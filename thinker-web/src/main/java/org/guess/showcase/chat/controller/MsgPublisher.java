package org.guess.showcase.chat.controller;

import com.google.common.collect.Maps;
import org.guess.core.utils.mapper.JsonMapper;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.Iterator;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * Created by rguess on 2014/8/20.
 */
public class MsgPublisher {

    private volatile Map<String, Queue<DeferredResult<String>>> usernameToDeferredResultMap = new ConcurrentHashMap();

    private MsgPublisher() {
    }

    private static MsgPublisher instance = new MsgPublisher();

    public static MsgPublisher getInstance() {
        return instance;
    }

    public DeferredResult<String> startAsync(final String username) {
        final DeferredResult<String> result = new DeferredResult<String>(30L * 1000, null);

        final Runnable removeDeferredResultRunnable = new Runnable() {
            @Override
            public void run() {
                Queue<DeferredResult<String>> queue = usernameToDeferredResultMap.get(username);
                if (queue != null) {
                    queue.remove(result);
                }
            }
        };
        result.onCompletion(removeDeferredResultRunnable);
        result.onTimeout(removeDeferredResultRunnable);

        //将异步上下文加入到队列中，这样在未来可以推送消息
        Queue<DeferredResult<String>> queue = usernameToDeferredResultMap.get(username);
        if (queue == null) {
            queue = new ConcurrentLinkedDeque();
            usernameToDeferredResultMap.put(username, queue);
        }
        queue.add(result);

        return result;
    }

    public void send(String receiver, String sender, String msg) {
        Map<String,String> data = Maps.newHashMap();
        data.put("type", "msg");
        data.put("username", sender);
        data.put("msg", msg);
        publish(receiver, sender, JsonMapper.nonDefaultMapper().toJson(data));
    }

    /**
     *
     * @param receiver 如果为空 表示发送给所有人
     * @param sender
     * @param data
     */
    private void publish(String receiver, String sender, String data) {
        if (receiver == null || receiver.trim().length() == 0) {//发送给所有人
            for (String loginUsername : usernameToDeferredResultMap.keySet()) {
                if (loginUsername.equals(sender)) {
                    continue;
                }
                Queue<DeferredResult<String>> queue = usernameToDeferredResultMap.get(loginUsername);
                if(queue != null) {
                    Iterator<DeferredResult<String>> iter = queue.iterator();
                    while(iter.hasNext()) {
                        DeferredResult<String> result = iter.next();
                        try {
                            result.setResult(data);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        iter.remove();
                    }
                }
            }
        } else { //私人消息
            Queue<DeferredResult<String>> queue = usernameToDeferredResultMap.get(receiver);
            if(queue != null) {
                Iterator<DeferredResult<String>> iter = queue.iterator();
                while(iter.hasNext()) {
                    DeferredResult result = iter.next();
                    try {
                        result.setResult(data);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    iter.remove();
                }
            }
        }
    }
}

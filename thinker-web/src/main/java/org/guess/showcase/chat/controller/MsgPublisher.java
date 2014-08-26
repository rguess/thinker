package org.guess.showcase.chat.controller;

import com.google.common.collect.Maps;
import org.guess.core.utils.mapper.JsonMapper;
import org.guess.showcase.chat.model.ChatingUser;
import org.guess.sys.model.User;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.*;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * Created by rguess on 2014/8/20.
 */
public class MsgPublisher {

    private volatile List<ChatingUser> chatingUsers = new LinkedList<ChatingUser>();

    private MsgPublisher() {
    }

    private static MsgPublisher instance = new MsgPublisher();

    public static MsgPublisher getInstance() {
        return instance;
    }

    /**
     * 获取登录的用户
     */
    public List<ChatingUser> getChatingUsers(){
        return chatingUsers;
    }

    /**
     * 根据User获取queue
     *
     * @param user
     * @param ip
     * @return
     */
    private Queue<DeferredResult<Object>> getQueueByUser(User user, String ip) {
        for (ChatingUser obj : chatingUsers) {
            if (obj.getUser().getId() == user.getId()) {
                return obj.getResults();
            }
        }
        Queue<DeferredResult<Object>> queue = new ConcurrentLinkedDeque();
        ChatingUser newUser = new ChatingUser(user, ip, queue);
        chatingUsers.add(newUser);
        return newUser.getResults();
    }

    /**
     * 根据登录名获取queue
     *
     * @param loginId
     * @return
     */
    private Queue<DeferredResult<Object>> getQueueByLoginId(String loginId) {
        for (ChatingUser obj : chatingUsers) {
            if (obj.getUser().getLoginId().equals(loginId)) {
                return obj.getResults();
            }
        }
        return null;
    }

    public DeferredResult<Object> startAsync(final User user, final String ip) {
        final DeferredResult<Object> result = new DeferredResult<Object>(30L * 1000, null);

        final Runnable removeDeferredResultRunnable = new Runnable() {
            @Override
            public void run() {
                Queue<DeferredResult<Object>> queue = getQueueByUser(user, ip);
                if (queue != null) {
                    queue.remove(result);
                }
            }
        };
        result.onCompletion(removeDeferredResultRunnable);
        result.onTimeout(removeDeferredResultRunnable);

        //将异步上下文加入到队列中，这样在未来可以推送消息
        Queue<DeferredResult<Object>> queue = getQueueByUser(user, ip);
        queue.add(result);

        return result;
    }

    public void send(String receiver, String sender, String msg) {
        Map<String, String> data = Maps.newHashMap();
        data.put("type", "msg");
        data.put("username", sender);
        data.put("msg", msg);
        publish(receiver, sender, JsonMapper.nonDefaultMapper().toJson(data));
    }

    /**
     * @param receiver 如果为空 表示发送给所有人
     * @param sender
     * @param data
     */
    private void publish(String receiver, String sender, String data) {
        if (receiver == null || receiver.trim().length() == 0) {//发送给所有人
            for (ChatingUser user : chatingUsers) {
                if (user.getUser().getLoginId().equals(sender)) {
                    continue;
                }
                Queue<DeferredResult<Object>> queue = getQueueByLoginId(user.getUser().getLoginId());
                if (queue != null) {
                    Iterator<DeferredResult<Object>> iter = queue.iterator();
                    while (iter.hasNext()) {
                        DeferredResult<Object> result = iter.next();
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
            Queue<DeferredResult<Object>> queue = getQueueByLoginId(receiver);
            if (queue != null) {
                Iterator<DeferredResult<Object>> iter = queue.iterator();
                while (iter.hasNext()) {
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

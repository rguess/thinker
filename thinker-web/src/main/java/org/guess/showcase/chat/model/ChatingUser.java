package org.guess.showcase.chat.model;

import org.guess.sys.model.User;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.Queue;

/**
 * Created by rguess on 2014/8/21.
 */
public class ChatingUser {

    private User user;

    private String ip;

    private Queue<DeferredResult<Object>> results;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Queue<DeferredResult<Object>> getResults() {
        return results;
    }

    public void setResults(Queue<DeferredResult<Object>> results) {
        this.results = results;
    }

    public ChatingUser(User user, String ip, Queue<DeferredResult<Object>> results) {
        this.user = user;
        this.ip = ip;
        this.results = results;
    }
}

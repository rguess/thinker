package org.guess.showcase.mobile.service;

import org.guess.showcase.mobile.model.Message;

public interface PushService {

	String sendNotification(Message message);
}

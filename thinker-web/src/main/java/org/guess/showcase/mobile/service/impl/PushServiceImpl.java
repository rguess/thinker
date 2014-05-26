package org.guess.showcase.mobile.service.impl;

import org.guess.showcase.mobile.model.Message;
import org.guess.showcase.mobile.service.PushService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.DeviceEnum;
import cn.jpush.api.push.CustomMessageParams;
import cn.jpush.api.push.MessageResult;
import cn.jpush.api.push.NotificationParams;
import cn.jpush.api.push.ReceiverTypeEnum;

@Service
public class PushServiceImpl implements PushService {
	
	@Value("#{app[jpushmasterSecret]}")
	private String masterSecret;
	
	@Value("#{app[jpushappKey]}")
	private String appKey;
	
	@Value("#{app[jpushtimeToLive]}")
	private int timeToLive;
	
	@Value("#{app[jpushdeviceEnumDevice]}")
	private DeviceEnum deviceEnumDevice;
	
	@Value("#{app[jpushapnsProduction]}")
	private Boolean apnsProduction;

	@Override
	public String sendNotification(Message message) {
		
		JPushClient jpushClient = new JPushClient(masterSecret,appKey, timeToLive, deviceEnumDevice, apnsProduction);
		
		NotificationParams ns = new NotificationParams();
		ns.setReceiverType(ReceiverTypeEnum.APP_KEY);
//		ns.setReceiverValue("rguess");
		ns.setAndroidNotificationTitle(message.getTitle());
//		ns.setTimeToLive(timeToLive);
		MessageResult nmsgResult = jpushClient.sendNotification(message.getContent(), ns,null);
		
		CustomMessageParams params = new CustomMessageParams();
		params.setReceiverType(ReceiverTypeEnum.APP_KEY);
//		params.setReceiverValue("rguess");
//		MessageResult msgResult = jpushClient.sendCustomMessage("测试",
//				"api推送消息测试5", params, null);
		if (nmsgResult.isResultOK()) {
			System.out.println("成功");
			return "success";
		}else{
			if (nmsgResult.getErrorCode() > 0) {
		        // 业务异常
		        System.out.println("Service error - ErrorCode: "
		                + nmsgResult.getErrorCode() + ", ErrorMessage: "
		                + nmsgResult.getErrorMessage());
		    } else {
		        // 未到达 JPush 
		    	System.out.println("Other excepitons - "
		                + nmsgResult.responseResult.exceptionString);
		    }
		}
		
		return "failure";
	}

}

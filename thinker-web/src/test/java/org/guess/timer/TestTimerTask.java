package org.guess.timer;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.guess.core.utils.DateUtil;

public class TestTimerTask extends TimerTask {

	@Override
	public void run() {
		Date executeTime = new Date(this.scheduledExecutionTime());
		System.out.println("本次任务执行的时间是" + DateUtil.format(executeTime, "yyyy-MM-dd HH:mm:ss"));
	}

}

class TestTimer {
	public static void main(String[] args) {
//		Timer timer = new Timer();
//		TimerTask task = new TestTimerTask();
//		timer.schedule(task, 500L, 1000L);
        System.out.println("%你好");
    }
}

package common.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * 서버에서 운영중인 세션객체의 수를 관리하는 리스너
 *
 */
//아래 annotation으로 Listener 등록
@WebListener
public class SessionCounterListener implements HttpSessionListener{

	private static int activeSessions;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		세션 만들어지면 호출
		activeSessions++;
//		System.out.println("[[  세션생성! - 현재 세션수 : " + activeSessions + "  ]]");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(activeSessions > 0)
				activeSessions--;
//		System.out.println("[[  세션제거! - 현재 세션수 : " + activeSessions + "  ]]");
	}
	
}

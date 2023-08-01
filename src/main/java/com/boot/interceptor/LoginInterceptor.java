package com.boot.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("@@@@@# loginInterceptor preHandler");
		
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("@@@@@# loginInterceptor postHandler");
		
		HttpSession session = request.getSession(false);
		
		
		if(session!=null && session.getAttribute("user_id")!=null) {
			long creationTime = session.getCreationTime(); // 세션 생성 시간 (1970년 1월 1일부터 경과한 시간을 밀리초로 반환)
			int maxInactiveInterval = session.getMaxInactiveInterval(); // 최대 유효 시간 (초 단위)
	
			long currentTime = System.currentTimeMillis(); // 현재 시간을 밀리초로 얻어옵니다.
	
			// 남은 시간 계산 (세션의 만료 시간 - 현재 시간)
			long remainingTime = (creationTime + (maxInactiveInterval * 1000)) - currentTime;
	
			// 남은 시간을 분과 초로 변환하여 출력
			int remainingMinutes = (int) (remainingTime / (1000 * 60));
			int remainingSeconds = (int) ((remainingTime / 1000) % 60);
		
			String user_id = (String) session.getAttribute("user_id");
			log.info("@@@@@ loginInterceptor user_id : "+user_id);
//			modelAndView.addObject("user_id", user_id);
			
			log.info("@@@@@ loginInterceptor : 로그인되어있습니다 : "+user_id);
			log.info("@@@@@ loginInterceptor 남은 시간 : " + remainingMinutes + "분 " + remainingSeconds + "초");
//			log.info("@@@@@ loginInterceptor : 유지 시간을 갱신합니다");
			session.setMaxInactiveInterval(1800);
		}
	}
}

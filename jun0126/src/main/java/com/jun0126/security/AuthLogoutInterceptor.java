package com.jun0126.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLogoutInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println("로그아웃 세션정보까진 오나요? "+ session);
		if( session != null ) {
			session.removeAttribute( "authUser" );
			session.invalidate();
		}
		
		 if (request.isRequestedSessionIdValid() == true) {
		        
			 System.out.print("세션 아이디가 유효합니다.<hr/>");
		    }
		    
		    else {
		        
		    	System.out.print("세션 아이디가 유효하지 않습니다.<hr/>");
		    }
		
		response.sendRedirect( request.getContextPath() + "/main");
		return false;
	}

}

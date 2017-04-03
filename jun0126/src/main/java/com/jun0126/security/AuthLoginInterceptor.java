package com.jun0126.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jun0126.VO.UserVO;
import com.jun0126.service.UserService;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler/*HandlerMethod*/)
		throws Exception {
		
		String user_ID = request.getParameter( "user_ID" );
		String passWord = request.getParameter( "passWord" );
		
		// Web Application Context 받아오기
		ApplicationContext ac =
			WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
		// Container 안에 있는 UserService Bean(객체) 받아오기
		UserService userService = ac.getBean( UserService.class );
		
		// 데이터베이스에서 해당 UserVo 받아오기 
		UserVO userVO = userService.login(user_ID, passWord); 
		
		// 아이디와 패스워드가 일치하지 않는 경우
		if( userVO == null ) { 
			response.sendRedirect( 
				request.getContextPath() + "/user/loginform?result=fail" );
			return false;
		}
		
		// 인증 처리
		HttpSession session = request.getSession( true );
		session.setAttribute( "authUser", userVO );
		response.sendRedirect( request.getContextPath() + "/main");
		
		return false;
	}

}

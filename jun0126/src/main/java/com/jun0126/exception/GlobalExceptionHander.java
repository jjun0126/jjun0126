/*package com.jun0126.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHander {
	
	private static final Log log = 
			LogFactory.getLog( GlobalExceptionHander.class  );
	
	@ExceptionHandler( Exception.class )
	public ModelAndView handlerException(
		HttpServletRequest request, 
		Exception e){
		
		// 1. 로깅
		StringWriter errors = new StringWriter();
		e.printStackTrace( new PrintWriter( errors ) );
		log.error( errors.toString());	

		// 2. 시스템 오류 안내 화면
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "error/exception" );
		
		return mav;
	}
	
}
*/
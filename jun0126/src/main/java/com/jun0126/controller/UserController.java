package com.jun0126.controller;

import java.util.List;

import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun0126.VO.UserVO;
import com.jun0126.service.UserService;

@Controller
@RequestMapping( "/user" )
public class UserController {
	@Autowired 
	private UserService userService;
	
 
	@RequestMapping( "/joinform" )
	public String joinForm( @ModelAttribute UserVO userVO ){
		return "user_view/join_View";
	} 
	 
	@RequestMapping( "/loginform" )
	public String loginForm(){
		return "user_view/login_View";
	}
	
	@RequestMapping( "/join" )
	public String join( 
		@ModelAttribute @Valid UserVO userVO,
		BindingResult result){
		   
		if( result.hasErrors() ) {
			List<ObjectError> list = result.getAllErrors();
			for( ObjectError o : list ) {
				System.out.println( "Object Error:" + o );
			}
			return "user_view/join_View";  
		} 
		 
		userService.join( userVO );
		return "redirect:/user/joinSuccess";
	}
	
	@RequestMapping( "/joinSuccess" )
	public String joinSuccess(){
		return "user_view/joinSuccess_View";
	}

}  




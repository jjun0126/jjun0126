package com.jun0126.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun0126.dto.JSONResult;
import com.jun0126.service.UserService;

@Controller( "userAPIController" )
@RequestMapping( "/user/api" )
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody	
	@RequestMapping( "/checkEmail" )
	public JSONResult checkEmail(@RequestParam( value="email", required=true, defaultValue="" ) String email
		){
		System.out.println("체크 이메일"+email);
	
		 
		//SingletonClass sc = SingletonClass.getInstance();
		boolean result = userService.emailCheck(email);
		return JSONResult.success( result ? "exist" : "not exist" );
	}
	 
	@ResponseBody	
	@RequestMapping( "/checkID" )
	public JSONResult checkID(@RequestParam( value="user_ID", required=true, defaultValue="" ) String user_ID
		){ 
		System.out.println("체크 아이디"+user_ID);
		//SingletonClass sc = SingletonClass.getInstance();
		boolean result = userService.idCheck(user_ID);
		return JSONResult.success( result ? "exist" : "not exist" ); 
	}
}  

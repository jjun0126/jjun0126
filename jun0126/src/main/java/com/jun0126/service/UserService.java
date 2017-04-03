package com.jun0126.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun0126.DAO.UserDAO;
import com.jun0126.VO.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO userDao;

	public void join(UserVO userVO) {
		userDao.joinUser(userVO) ;
	}
	
	public UserVO login( String user_ID, String passWord) {
		UserVO UserVO = null; 
		UserVO = userDao.login(user_ID, passWord);
		return UserVO;
	}

	public Boolean idCheck(String user_ID) {
		Boolean result = (userDao.idCheck(user_ID)!= null);
		return result;
	}

	public Boolean emailCheck(String email) {
		Boolean result = (userDao.emailCheck(email)!= null);
		return result; 
	}
}

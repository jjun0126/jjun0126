package com.jun0126.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun0126.VO.UserVO;
import com.jun0126.exception.UserDaoException;

 
@Repository
public class UserDAO {
	@Autowired
	private SqlSession sqlSession; 
	
	
	public void joinUser(UserVO userVO) { 
		sqlSession.insert("user.joinUser", userVO);
	}

	public Boolean loginCheck( Map<String, Object> map ) {
		Boolean result = sqlSession.selectOne("user.loginCheck", map);
		return result;
	}
	 
	public UserVO login(String user_ID, String passWord) 
			throws UserDaoException {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put( "user_ID", user_ID );
			map.put( "passWord", passWord);
					
			return sqlSession.selectOne( "user.loginCheck", map );
		}
	
	public UserVO idCheck( String user_ID ) {
		UserVO result = sqlSession.selectOne("user.idCheck", user_ID);
		return result;
	}
	
	public UserVO emailCheck( String email ) {
		UserVO result = sqlSession.selectOne("user.emailCheck", email);
		return result;
	} 
		
	}

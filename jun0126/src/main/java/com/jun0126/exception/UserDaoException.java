package com.jun0126.exception;

public class UserDaoException extends RuntimeException {
	private static final long serialVersionUID = 75687482485855900L;

	public UserDaoException(){
		super( "User Not Found" ); 
	}
}

package com.jun0126.VO;

public class UserVO {
	private String user_NO;
	private String user_ID;
	private String passWord;
	private String email;
	private String user_Name;
	private String admin;
	private String reg_date;
	public String getUser_NO() {
		return user_NO;
	}
	public void setUser_NO(String user_NO) {
		this.user_NO = user_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "UserVO [user_NO=" + user_NO + ", user_ID=" + user_ID + ", passWord=" + passWord + ", email=" + email
				+ ", user_Name=" + user_Name + ", admin=" + admin + ", reg_date=" + reg_date + "]";
	}
	
}
package com.jun0126.VO;

public class GuestBoardVO {
	private String board_NO;
	private String title;
	private String contents;
	private String reg_date;
	private String hit;
	private String group_NO;
	private String order_NO;
	private String depth;
	private String user_NO;
	private String user_ID;
	public String getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(String board_NO) {
		this.board_NO = board_NO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getGroup_NO() {
		return group_NO;
	}
	public void setGroup_NO(String group_NO) {
		this.group_NO = group_NO;
	}
	public String getOrder_NO() {
		return order_NO;
	}
	public void setOrder_NO(String order_NO) {
		this.order_NO = order_NO;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
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
	@Override
	public String toString() {
		return "GuestBoardVO [board_NO=" + board_NO + ", title=" + title + ", contents=" + contents + ", reg_date="
				+ reg_date + ", hit=" + hit + ", group_NO=" + group_NO + ", order_NO=" + order_NO + ", depth=" + depth
				+ ", user_NO=" + user_NO + ", user_ID=" + user_ID + "]";
	}
	
}
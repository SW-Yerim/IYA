package com.iya.board.dto;

import java.sql.Date;

public class CommentDTO {

	private int boardnum;
	private int groupNum;
	private int sortNum;
	private String userId;
	private String cContent;
	private int cUp;
	private int cDown;
	private Date cDate;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public int getcUp() {
		return cUp;
	}
	public void setcUp(int cUp) {
		this.cUp = cUp;
	}
	public int getcDown() {
		return cDown;
	}
	public void setcDown(int cDown) {
		this.cDown = cDown;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	
}

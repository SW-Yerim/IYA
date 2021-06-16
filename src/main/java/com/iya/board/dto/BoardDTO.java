package com.iya.board.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

public class BoardDTO {

//    boardnum NUMBER PRIMARY KEY,
//    userid VARCHAR2(100),
//    cate1 NUMBER,
//    cate2 NUMBER,
//    boardtitle VARCHAR2(500),
//    boardcontent VARCHAR2(4000),
//    boardtime DATE DEFAULT sysdate,
//    postup NUMBER,
//    postdown NUMBER
    
	private int boardnum;
	private String userId;
	private int cate1;
	private int cate2;
	private String boardtitle;
	private String boardcontent;
	private Date boardtime;
	private int postup;
	private int viewnum;
	

	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCate1() {
		return cate1;
	}
	public void setCate1(int cate1) {
		this.cate1 = cate1;
	}
	public int getCate2() {
		return cate2;
	}
	public void setCate2(int cate2) {
		this.cate2 = cate2;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public Date getBoardtime() {
		return boardtime;
	}
	public void setBoardtime(Date boardtime) {
		this.boardtime = boardtime;
	}
	public int getPostup() {
		return postup;
	}
	public void setPostup(int postup) {
		this.postup = postup;
	}
	public int getViewnum() {
		return viewnum;
	}
	public void setViewnum(int viewnum) {
		this.viewnum = viewnum;
	}

	
}

package com.jsp.dto;

import java.util.Date;

public class BoardInfo {
	// seqBoard
    private int boardListNum; // Primary Key 글쓴 순서대로 1씩 증가
    private String title; // 제목
    private String mainContents; // 본문
    private UserInfo userInfo;  // User DTO
    private int hitCount; // 조회수
    private Date regDate;  // 게시글 등록일
    
	public int getBoardListNum() {
		return boardListNum;
	}
	public String getTitle() {
		return title;
	}
	public String getMainContents() {
		return mainContents;
	}
	public UserInfo getUser() {
		return user;
	}
	public int getHitCount() {
		return hitCount;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setBoardListNum(int boardListNum) {
		this.boardListNum = boardListNum;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setMainContents(String mainContents) {
		this.mainContents = mainContents;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	
}
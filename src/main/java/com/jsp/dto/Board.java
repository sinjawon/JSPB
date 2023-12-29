package com.jsp.dto;

import java.util.Date;

public class Board {
	// seqBoard
    private int boardListNum; // Primary Key 글쓴 순서대로 1씩 증가
    private String title; // 제목
    private User user;  // User DTO
    private Date regDate;  // 게시글 등록일
    private int hitCount; // 조회수
    private String contents; // 본문
    
	public int getBoardListNum() {
		return boardListNum;
	}
	public void setBoardListNum(int boardListNum) {
		this.boardListNum = boardListNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
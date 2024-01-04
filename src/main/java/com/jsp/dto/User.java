package com.jsp.dto;

public class User{
    private String userNum; //Primary Key 가입순서대로 1씩 증가
    private String userId; 
    private String userNickname; // 게시글 작성자 아이디 안보여주려고 가입때 닉네임 설정
    private String userPw;
    
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname ;
	}
	public void setUserNickname(String userNickname ) {
		this.userNickname  = userNickname ;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String toStringNum() {
	return	this.userNum;
	}
	
	public String toStringPW() {
		return	this.userPw;
		}
	
	public String toStringNick() {
		return	this.userNickname;
		}
    
	

}

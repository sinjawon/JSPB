package com.jsp.dto;

public class User{
    private int userNum; //Primary Key 가입순서대로 1씩 증가
    private String userId; 
    private String userNickname; // 게시글 작성자 아이디 안보여주려고 가입때 닉네임 설정
    private String userPw;
    
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
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
    
	

}

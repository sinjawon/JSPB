package com.jsp.dto;

public class PostImage {

	private String imageName; //랜덤생성될 예정
	private int boardListNum; //외래키
	private int imageNum;// 이미지 나올 순서
	
	public String getImageName() {
		return imageName;
	}
	//이미지 이름은 조작 할 일 없겠죠?
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	
	public int getBoardListNum() {
		return boardListNum;
	}
	public void setBoardListNum(int boardListNum) {
		this.boardListNum = boardListNum;
	}
	
	
	
	public int getImageNum() {
		return imageNum;
	}
	//이미지 삽입 순서도 안 바뀌겠죠?
	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}
	
}


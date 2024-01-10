package com.jsp.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;


public class UserNote {
	
	private String sender; //아마유저 닉네임
    private String receiver;//아마 유저 번호
    private String content;// 내용 
    private Date timestamp;// 시간까지 날짜
    
    
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
    
    
}

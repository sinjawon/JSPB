package com.jsp.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;


public class UserNote {
	
	private String sender; //아마유저 닉네임
    private String receiver;//아마 유저 번호
    private String notecontent;// 내용 
    private Date notetime;// 시간까지 날짜
    
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
	public String getNotecontent() {
		return notecontent;
	}
	public void setNotecontent(String notecontent) {
		this.notecontent = notecontent;
	}
	public Date getNotetime() {
		return notetime;
	}
	public void setNotetime(Date notetime) {
		this.notetime = notetime;
	}
  
}

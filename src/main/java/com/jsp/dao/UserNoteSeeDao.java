package com.jsp.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jsp.dto.UserNote;

public interface UserNoteSeeDao {
		
	    //메시지 저장 
		@Insert("INSERT INTO UserNoteSee (notenum) VALUES(noteseq.NEXTVAL)")
		public void insertUserNoteSee();
	
}

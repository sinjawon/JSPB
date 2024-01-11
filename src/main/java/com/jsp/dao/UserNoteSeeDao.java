package com.jsp.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jsp.dto.UserNote;

public interface UserNoteSeeDao {
		
	    //메시지 저장
		@Insert("INSERT INTO UserNoteSee (notenum) VALUES(notesee.NEXTVAL)")
		public void insertUserNoteSee();
	
	  @Select("Select cansee from UserNoteSee Where notenum =${notenum}")
		public void GetcanSee(@Param("notenum") String notenum);
	  
	  @Insert("INSERT INTO UserNoteSee (cansee)  values (${seenum}) Where notenum = ${notenum}")
		public void SetcanSee(@Param("notenum") String notenum,@Param("seenum") String seenum);
		
		
}

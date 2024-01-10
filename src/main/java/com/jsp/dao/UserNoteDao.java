package com.jsp.dao;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserNoteDao {
	
	//메시지 저장 
	@Insert("INSERT INTO UserNote(notenum,sender,receiver,notecontent,notetime) VALUES(notesq.NEXTVAL,#{sender}, #{receiver}, #{notecontent}, #{notetime})")
	public void insertUserNote(
			@Param("sender") String sender,
			@Param("receiver") String receiver,
			@Param("notecontent") String notecontent,
			@Param("notetime") Timestamp notetime 
			);
	
	//모든 받는사람이 nickname 인사람
	@Select("SELECT receiver, sender, content, timestamp FROM UserNote WHERE receiver = #{nickname}")
	public List<UserNote> NoteReceiver(@Param("nickname") String nickname);
	
	//모든 보낸사람이 nickname 인사람
	@Select("select receiver, sender, content, timestamp FROM UserNote WHERE sender = #{nickname}")
	public List<UserNote> NoteSender(@Param("nickname") String nickname);
	
	
	
}

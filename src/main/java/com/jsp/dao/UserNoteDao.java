package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserNoteDao {
	
	//메시지 저장 
	@Insert("INSERT INTO userNote(sender,receiver,notecontent,notetime) VALUES(noteseq.NEXTVAL,#{sender}, #{receiver}, #{notecontent}, #{notetime})")
	public List<UserNote> insertUserNote(
			@Param("sender") String sender,
			@Param("receiver") String receiver,
			@Param("notecontent") String notecontent,
			@Param("notetime") String notetime 
			);
	
	//모든 수신자가 ?? 인사람 모든 쪽지 
	@Select("select receiver sender content timestamp userNote from UserNote WHERE receiver")
	public List<UserNote> getuserNicknameAll();
	
	
	
}

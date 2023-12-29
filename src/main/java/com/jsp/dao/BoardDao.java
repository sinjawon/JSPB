package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface BoardDao {

	// db에서 user 테이블에서 userNickName 으로 user 정보를 찾는다
	@Select("select * from user where userNickName = #{userNickName}")
	public User getUserByUserNickName(@Param("userNickName") String userNickName);
	
	@Select("select title from board where userNickName = #{userNickName}")
	public User getBoardByUserNickName(@Param("userNickName") String userNickName);
	
	
	@Select("select * from user where userNum = #{userNum} and password = #{userPw}")
	public User getUserCheck(@Param("userNum") String userNum, @Param("userPw") String userPw);

	@Insert("insert into board values(seqboard.nextval, #{boardListNum}, #{title}, #{contents})")
	public void insertBoard(@Param("boardListNum") String boardListNum, @Param("title") String title, @Param("contents") String contents);
	
	@Delete("delete from board where userNum = #{userNum}")
	public void deleteBoard(@Param("userNum") int userNum);
	
	
	@Update("update board set title = #{title}, contents = #{contents} where boardListNum =#{boardListNum}")
	public void updateBoard(@Param("title") String title, @Param("contents") String contents, @Param("boardListNum") String boardListNum);
}

// board 랑 user 둘다 pk 로 자동으로 1씩 증가하는 number를 만들때
// 시퀀스명 seqBoard, seqUser 로 만들고
// db 의 테이블 명을 board 로 자바의 클래스명도 Board 로 통일
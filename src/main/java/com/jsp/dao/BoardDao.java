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
	
	// board 에서 userNickName 으로 검색
	@Select("select * from board where userNickName = #{userNickName}")
	public List<Board> getBoardByUserNickName(@Param("userNickName") String userNickName);
	
	@Select("select * from board where title = #{title}")
	public List<Board> getBoardByTitle(@Param("title") String title);
	
	
	// user 에서 userNum 과 userPw 로 가입한 유저가 맞는지 확인
	@Select("select * from user where userNum = #{userNum} and password = #{userPw}")
	public User getUserCheck(@Param("userNum") String userNum, @Param("userPw") String userPw);

	// board 에 글 쓸때 자동으로 seqboard번호가 증가 title, contents
	@Insert("insert into board values(seqboard.nextval, #{boardListNum}, #{title}, #{contents})")
	public void insertBoard(@Param("boardListNum") String boardListNum, @Param("title") String title, @Param("contents") String contents);
	
	// board 에 글 지울때 boardListNum 인 글을 지운다?
	@Delete("delete from board where boardListNum = #{boardListNum}")
	public void deleteBoard(@Param("boardListNum") int boardListNum);
	
	// board 에 글 수정할때 boardListNum 인 글에서 title 과 contents 를 수정한다
	@Update("update board set title = #{title}, contents = #{contents} where boardListNum =#{boardListNum}")
	public void updateBoard(@Param("title") String title, @Param("contents") String contents, @Param("boardListNum") String boardListNum);


	@Results( id = "Board",value = {
			@Result(property="title", column="title"),
			@Result(property="contents", column="contents"),
			@Result(property="user", column="userNickName", one=@One(select="getUserByUserNickName"))
		})
	@Select("select * from boardlist order by id desc")
	public List<Board> getBoardAll();

	@Select("select x.id, x.title, x.author_id from (select ROWNUM as num, result.* from (select * from boardlist order by id desc) result) x where num <= #{limit}")
	public List<Board> getBoardLimit(@Param("limit") int limit);
		
	@Select("select x.id, x.title, x.author_id from (select ROWNUM as num, result.* from (select * from boardlist order by id desc) result) x where num between #{limit} * #{page} + 1 and #{limit} * (#{page} + 1)")
	public List<Board> getBoardPage(@Param("limit") int limit, @Param("page")  int page);



}

// board 랑 user 둘다 pk 로 자동으로 1씩 증가하는 number를 만들때
// 시퀀스명 seqBoard, seqUser 로 만들고
// db 의 테이블 명을 board 로 자바의 클래스명도 Board 로 통일
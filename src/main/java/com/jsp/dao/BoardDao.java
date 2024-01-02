package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface BoardDao {

	// db에서 user 테이블에서 userNickName 으로 user 정보를 찾는다
	@Select("select * from userDto where userNickname = #{userNickname}")
	public UserDTO getUserInfoByUserNickName(@Param("userNickname") String usernickname);
	
	// board 에서 userNickName 으로 검색
	@Select("select * from boardInfo where userNickname = #{userNickname}")
	public List<BoardInfo> getBoardInfoByUserNickName(@Param("userNickname") String userNickname);

	
	// board 에서 title 로 검색
	@Select("select * from boardInfo where title = #{title}")
	public List<BoardInfo> getBoardInfoByTitle(@Param("title") String title);

	// user 에서 userNum 과 userPw 로 가입한 유저가 맞는지 확인
	@Select("select * from userInfo where userNum = #{userNum} and password = #{userPw}")
	public UserDTO getUserInfoCheck(@Param("userNum") String userNum, @Param("userPw") String userPw);

	// board 에 글 쓸때 자동으로 seqBoardListNum 번호가 증가 title, mainContents
	@Insert("insert into boardInfo values(seqBoardListNum.nextval, #{title}, #{mainContents})")
	public void insertBoardInfo(@Param("title") String title, @Param("mainContents") String mainContents);
	
	// board 에 글 지울때 boardListNum 인 글을 지운다?
	@Delete("delete from boardInfo where boardListNum = #{boardListNum}")
	public void deleteBoardInfo(@Param("boardListNum") int boardListNum);
	
	// board 에 글 수정할때 boardListNum 인 글에서 title 과 mainContents 를 수정한다
	@Update("update boardInfo set title = #{title}, mainContents = #{mainContents} where boardlistNum =#{boardlistNum}")
	public void updateBoardInfo(@Param("title") String title, @Param("mainContents") String mainContents, @Param("boardlistNum") String boardlistNum);

/*
	@Results( id = "BoardInfo",value = {
			@Result(property="boardListNum", column="boardListNum"),
			@Result(property="title", column="title"),
			@Result(property="usernickname", column="usernickname", one=@One(select="getUserByUserNickName")),
			@Result(property="hitCount", column="hitCount"),
			@Result(property="regDate", column="regDate")
		})*/
	@Select("select count(*) as cnt from boardInfo order by boardListNum desc")
	public int getBoardInfoAllCnt();

	@Select("select * from boardInfo order by boardListNum desc")
	public List<BoardInfo> getBoardInfoAll();

	
	
	@Select("select x.boardListNum, x.title, x.userNickname,x.hitCount, x.regDate from (select ROWNUM as num, result.* from (select * from boardInfo order by boardlistNum desc) result) x where num <= #{limit}")
	public List<BoardInfo> getBoardInfoLimit(@Param("limit") int limit);
		
	@Select("select x.boardListNum, x.title, x.userNickname,x.hitCount, x.regDate from (select ROWNUM as num, result.* from (select * from boardInfo order by boardlistNum desc) result) x where num between #{limit} * #{page} + 1 and #{limit} * (#{page} + 1)")
	public List<BoardInfo> getBoardInfoPage(@Param("limit") int limit, @Param("page")  int page);



}

// board 랑 user 둘다 pk 로 자동으로 1씩 증가하는 number를 만들때
// 시퀀스명 seqBoard, seqUser 로 만들고
// db 의 테이블 명을 board 로 자바의 클래스명도 Board 로 통일
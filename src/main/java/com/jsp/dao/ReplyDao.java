package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface ReplyDao {

//	private int replyNum; // Primary Key 글쓴 순서대로 1씩 증가
//	private int boardListNum; // 외래키 
//	private String replyContents; // 댓글 내용
//	private String userNickname;
//	private String regDate;
	
	// boardlistNum 를 기준으로 댓글개수
	@Select("select count(*) from replyInfo where boardlistNum =#{boardlistNum}")
	public int getReplyInfoAllCnt();
	
	// boardlistNum 를 기준으로 댓글이 달린 게시글을 찾아가서 보여주기
	@Select("select * from replyInfo where boardlistNum =#{boardlistNum}")
	public List<ReplyInfo> searchByBoardListNum(@Param("boardListNum") int boardListNum); 
	
	// 새로운 댓글을 추가하는 메서드. 
	@Insert("insert into replyInfo (replyNum, boardListNum, replyContents, userNickname, regDate) values (seqReplyNum.nextval, #{boardlistNum}, #{replyContents}, #{userNickname}, sysdate)")
	public void insertNewReply(@Param("replyContents") String replyContents, @Param("userNickname") String userNickname);
		
	// ReplyInfo 에 글 지울때 replyNum 인 글을 지운다?
	@Delete("delete from replyInfo where replyNum = #{replyNum}")
	public void deleteReplyInfo(@Param("replyNum") int boardListNum);
		
	// ReplyInfo 에 글 수정할때 replyNum 인 글에서 replyContents 를 수정한다
	@Update("update boardInfo set replyContents = #{replyContents} where boardlistNum =#{boardlistNum}")
	public void updateBoardInfo(@Param("title") String title, @Param("mainContents") String mainContents, @Param("boardlistNum") int boardlistNum);

	
	
	
	
	
}

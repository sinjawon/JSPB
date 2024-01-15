
package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface PostImageDao {
	
	//@지수 - 이미지를 넣을 때 최신 글? 그러니 seqBoardListNum.currval로 최신 글을 찾을 거
	@Insert("insert into PostImage (imageName, boardListNum, imageNum) values (#{imageName}, #{boardListNum}, #{imageNum},")
	public void saveImage(@Param("imageName") String imageName, @Param("boardListNum") int boardListNum, @Param("imageNum") int imageNum);
	

	@Select("SELECT * from PostImage WHERE boardListNum = #{boardListNum}")
	public List<String> searchImageByBoardListNum(@Param("boardListNum") int boardListNum); 


}
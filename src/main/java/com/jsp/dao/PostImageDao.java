
package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface PostImageDao {
	
	@Insert("insert into PostImage (imageName, boardListNum, imageNum) values (#{imageName}, seqBoardListNum.nextval, #{imageNum},")
	public void saveImage(@Param("imageName") String imageName, @Param("imageNum") int imageNum);
	

	@Insert("insert into PostImage (imageName, boardListNum, imageNum) values (#{imageName}, #{boardListNum}, #{imageNum})")
	@Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
	void saveImage(PostImage postImage);
	}


  
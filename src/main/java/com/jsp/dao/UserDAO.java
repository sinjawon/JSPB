package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserDao {

	@Select( "select userId from Member")
	public List<User> getuserid();
	
	@Select( "select userNickName from Member")
	public List<User> getuserNickname();
	
	@Select("select userPw from Member where userid=#{userid}")
	public User getuserinfo(@Param("userid") String userid);
	
	@Insert("INSERT INTO Member VALUES(seqbd.NEXTVAL, #{name}, #{nickname}, #{userid}, #{password})")
	public void joinmember(
	        @Param("name") String name,
	        @Param("nickname") String nickname,
	        @Param("userid") String userid,
	        @Param("password") String password);
	}






package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserDao {

	@Select( "select userid from User")
	public List<User> getuserid();
	
	@Select( "select usernickname from User")
	public List<User> getuserNickname();
	
	@Select("select userpw from User where userid=#{userid}")
	public User getuserinfo(@Param("userid") String userid);
	
	@Insert("insert into User values(seqbd.nextval, #{name}, #{nickname},#{nickname},#{userid},#{password})")
	public void joinmember(
			@Param("name") String name,
			@Param("nickname")  String nickname,
			@Param("userid")  String userid,
			@Param("password")  String password);	 
}






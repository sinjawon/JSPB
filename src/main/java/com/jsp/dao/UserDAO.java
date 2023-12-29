package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserDAO {

	@Select( "select userid from User")
	public List<UserDTO> getuserid();
	
	@Select( "select usernickname from User")
	public List<UserDTO> getuseNickname();
	
	@Insert("insert into User value()")
	public void joinuser(
			@Param("name") String name
			,@Param("nickname")  String nickname
			,@Param("userid")  String userid
			,@Param("password")  String password);
	 
}






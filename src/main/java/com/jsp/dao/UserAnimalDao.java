package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface UserAnimalDao {
	

//회원가입 시 디폴트로 유저 동물이 들어간다  
	@Insert("INSERT INTO memberAnimal(userNum) VALUES (seqbd2.NEXTVAL)")
   public void meberanimal();		
	
	//아이디로 동물 이름찾기
	@Select("SELECT animalname FROM memberAnimal WHERE userNum = #{userNum}")
	public UserAnimal getAnimalName(@Param("userNum") String userNum);
	
	//유저넘버로 동물 생일찾기
	    @Select( "select animalBirth from memberAnimal where userNum=#{userNum}")
	    public UserAnimal getAnimalBirth(@Param("userNum") String userNum);
	
	//유저넘버로 동물 성별찾기
		@Select( "select animalgender from memberAnimal where userNum=#{userNum}")
		public UserAnimal getAnimalGender(@Param("userNum") String userNum);
		
	//유저넘버로 동물 몸무게
		@Select( "select animalweight from memberAnimal where userNum=#{userNum}")
		public UserAnimal getAnimalWeight(@Param("userNum") String userNum);

		//유저넘버로 동물 프로필
			@Select( "select animalProfile from memberAnimal where userNum=#{userNum}")
			public UserAnimal getAnimalProfile(@Param("userNum") String userNum);
		
		
	
	
	
	}
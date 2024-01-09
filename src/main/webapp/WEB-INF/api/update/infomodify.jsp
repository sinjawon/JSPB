<%@page import="java.nio.file.Paths"%>
<%@page import="com.jsp.system.RandomStringGenerator, java.lang.IllegalStateException"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>




<%    


//이미지 수정이 있다? ㅠㅠ
		//클라이언트가 이미지를 업로드하면 여기에 담길것
		String contentType = request.getContentType();
	//클라이언트가 둘중 하나의 프로파일을 넘겼을 경우 
       
//파일크기가 0이 아닐경우	   
if(contentType != null && contentType.toLowerCase().startsWith("multipart/form-data")) {	
else{
	
			 try(DBConnector con = new DBConnector();){
				 
					/* 	if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();	 */	
						UserDao map = con.OpenMap(request, UserDao.class);
						UserAnimalDao map2 =con.OpenMap(request, UserAnimalDao.class);
					     String usernum = (String)session.getAttribute("UserNum");
					     
					   //유저 닉네임 이메일 수정
					   String nickname = request.getParameter("nickname");
					   
					   String email = request.getParameter("email");
					  
					   //db업데이트
					    map.udtNickname(usernum,nickname);
					    map.udtemail(usernum,email);
					   
					    
					   //동물 수정 이름 생일 성별 무게
					   String petName = request.getParameter("petName");
					   String birth = request.getParameter("birth");
					   String gender = request.getParameter("gender");
					   String weight = request.getParameter("weight");
					   
					   //db업데이트
					   map2.aniname(usernum, petName);
					   map2.anibirth(usernum, birth);
					   map2.anigender(usernum, gender); 
					   map2.aniweight(usernum, weight);
			
			 }
			 catch(Exception e) {
					response.getWriter().write("이미지 있고 택스트 업데이트 처리하는 오류");
				}
	}






		
	
%>
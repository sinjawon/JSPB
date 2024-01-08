<%@page import="java.nio.file.Paths"%>
<%@page import="com.jsp.system.RandomStringGenerator"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>



<%     
//이미지 수정이 있다? ㅠㅠ
		//클라이언트가 이미지를 업로드하면 여기에 담길것
		
		
	//클라이언트가 둘중 하나의 프로파일을 넘겼을 경우 
if(request.getPart("image") != null || request.getPart("petimage") != null){
	
	  try(DBConnector con = new DBConnector();){
			if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();		
			UserDao map = con.OpenMap(request, UserDao.class);
			UserAnimalDao map2 =con.OpenMap(request, UserAnimalDao.class);
		     String usernum = (String)session.getAttribute("usernum");
		  
		   //유저 닉네임 이메일 수정
		   String nickname = request.getParameter("nickname");
		   String email = request.getParameter("email");
		   //db업데이트
		    map.udtNickname(usernum, nickname);
		    map.udtemail(usernum, email);
		    
		    
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
		   
			//이미지가 있으면
			if(request.getPart("image") != null){
				Part imagePart = request.getPart("image"); // 유저 profile
				//사용자가 업로드한 이미지 이름 담고 
				   String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString(); 
				    // 파일 이름에서 확장자 추출
				    String fileExtension = "";
				    int lastDotIndex = fileName.lastIndexOf('.');
				    if (lastDotIndex != -1) {
				        fileExtension = fileName.substring(lastDotIndex + 1);
				    }
				//랜덤이름 생성
				String random4 =RandomStringGenerator.generateRandomString(4);  
				//저장할 랜덤이름.확장자 리퀘스트 저장
				request.setAttribute("userprofile",random4+"."+fileExtension);
				//유저 먼저 경로를 db에 저장
				map.udtprofile(usernum , "/resources/userprofile/"+random4 +"."+fileExtension); 
			}
			if(request.getPart("petimage") != null){
				Part petimage = request.getPart("petimage");// 유저의 동물 profiles
				//사용자가 업로드한 이미지 이름 담고 
				   String fileName = Paths.get(petimage.getSubmittedFileName()).getFileName().toString(); 
				    // 파일 이름에서 확장자 추출
				    String fileExtension = "";
				    int lastDotIndex = fileName.lastIndexOf('.');
				    if (lastDotIndex != -1) {
				        fileExtension = fileName.substring(lastDotIndex + 1);
				    }
				
				String random4 =RandomStringGenerator.generateRandomString(4);
				request.setAttribute("animalprofile",random4+"."+fileExtension);
				map2.aniprofile(usernum, "/resources/animalprofile/"+random4+"."+fileExtension);
			}
			 	
			
		        // 모든 처리끝나고 db에 저장했으면 실제로 이미지 저장은 다른 서블릿으로 ㄱㄱ 
		        RequestDispatcher dispatcher = request.getRequestDispatcher("/upload");
		        dispatcher.forward(request, response);
			  } 
		catch(Exception e) {
			response.getWriter().write("이미지 있고 택스트 업데이트 처리하는 오류");
		}
	
	
}else{
	//이미지 수정이 없다? 심플하게 
	  try(DBConnector con = new DBConnector();){
			if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();		
			UserDao map = con.OpenMap(request, UserDao.class);
			UserAnimalDao map2 = con.OpenMap(request, UserAnimalDao.class);
			String usernum = (String)session.getAttribute("usernum");
			   //유저 닉네임 이메일 수정
			   String nickname = request.getParameter("nickname");
			   String email = request.getParameter("email");
			   //db업데이트
			    map.udtNickname(usernum, nickname);
			    map.udtemail(usernum, email);
			    
			    
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
			   
			response.sendRedirect("/app/mypage.jsp");
			  } 
		catch(Exception e) {
			response.getWriter().write("이미지 없고 택스트 처리하는 오류");
			
		}

}     
		
	
%>
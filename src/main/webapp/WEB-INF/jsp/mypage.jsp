<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/myreset.css" />
<link rel="stylesheet" href="/resources/mypage.css" />
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
    <div class="info_wrap">
        <div class="info">
            <div class=profile><a href="mypage.jsp">프로필</a></div>
            <div class=mydocument><a href="mydocument.jsp">내가 작성한 글</a></div>
        </div>
        <div class="userPet_info">
            <div class="user_info">
                <span>회원</span>
                <div class="info_image"><img src="<%=session.getAttribute("UserProfile")%>" alt=""></div>
                <div class="info_box">
                    <span><%=session.getAttribute("UserNickName") %></span>
                    <div></div>
                </div>
                <div class="info_box">
                    <span><%=session.getAttribute("UserEmail") %></span>
                    <div></div>
                </div>
            </div>
         
            
            <%try(DBConnector con = new DBConnector();){
        		UserAnimalDao map = con.OpenMap(request, UserAnimalDao.class);
        		 String usernum = (String)session.getAttribute("UserNum");
        		 
        		 
        		 %>
     		
        		  <div class="pet_info">
                  <span>반려동물</span>
                  <div class="info_image"><img src="<%=map.getAnimalProfile(usernum).getAnimalProfile()%>"  alt=""></div>
                  <div class="info_box" >
                      <span><%= map.getAnimalName(usernum).toStringPatName()%></span>
                      <div> </div>
                  </div>
                  <div class="info_box">
                      <span><%= map.getAnimalBirth(usernum).toStringPatBirth()%></span>
                      <div> </div>
                  </div>
                  <div class="info_box">
                      <span><%= map.getAnimalGender(usernum).toStringPatGender()%></span>
                      <div> </div>
                  </div>
                  <div class="info_box">
                      <span><%= map.getAnimalWeight(usernum).toStringPatWeight()%></span>
                      <div> </div>
                  </div>
                  
              </div>
          </div>
        		
        	<%
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	} %>
            
            
          
        <div class="info_menu">
            <button ><a href="#">정보 수정</a></button>
            <button>로그아웃</button>
        </div>
        <div class="withdraw"><a href="">회원탈퇴</a></div>
    </div>
    <%@include file="../jsp/footer.jsp"%>
</body>
</html>
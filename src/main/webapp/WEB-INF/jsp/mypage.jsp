<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.util.*, org.json.*"%> <%@ page
import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/myreset.css" />
    <link rel="stylesheet" href="/resources/mypage.css" />
  </head>
  <body>
    <%@include file="../jsp/nav.jsp"%> <%try(DBConnector con = new
    DBConnector();){ UserAnimalDao map = con.OpenMap(request,
    UserAnimalDao.class); String usernum =
    (String)session.getAttribute("UserNum"); %>
    <div class="info_wrap">
      <div class="info">
        <div class="profile"><a href="mypage.jsp">프로필</a></div>
        <div class="mydocument">
          <a href="mydocument.jsp">내가 작성한 글</a>
        </div>
      </div>
      <div class="userPet_info">
        <div class="user_info">
          <span class="user">회원</span>
          <div class="info_image">
            <img class='profile_img'
            src="<%=session.getAttribute("UserProfile")%>" alt="user_image">
          </div>
          <div class="info_box">
            <span><%=session.getAttribute("UserNickName")%></span>
            <div></div>
          </div>
          <div class="info_box">
            <span class="write">이메일</span>
            <span class="content"><%=session.getAttribute("UserEmail") %></span>
          </div>
        </div>
        <<<<<<< HEAD

        <div class="pet_info">
          <span class="pet">반려동물</span>
          <div class="info_image"><img src="" alt="" /></div>
          <div class="info_box">
            <span class="write">이름</span>
            <span class="content"
              ><%= map.getAnimalName(usernum).toStringPatName()%>
            </span>
          </div>
          <div class="info_box">
            <span class="write">생일</span>
            <span class="content"
              ><%= map.getAnimalBirth(usernum).toStringPatBirth()%></span
            >
          </div>
          <div class="info_box">
            <span class="write">성별</span>
            <span class="content"
              ><%= map.getAnimalGender(usernum).toStringPatGender()%></span
            >
          </div>
          <div class="info_box">
            <span class="write">몸무게</span>
            <span class="content">
              <%= map.getAnimalWeight(usernum).toStringPatWeight()%></span
            >
          </div>
        </div>
      </div>

      <% } catch(Exception e) { e.printStackTrace(); } %>

      <div class="info_menu">
        <button class="Modifybtn">
          <a href="infomodify.jsp">정보 수정</a>
        </button>
        <form action="../api/select/logout.jsp">
          <button type="submit" value="로그아웃" class="logoutbtn">
            로그아웃</button
          ><input type="hidden" name="logoutAction" value="true" />
        </form>
      </div>
      <div class="withdraw"><a href="">회원탈퇴</a></div>
      ======= >>>>>>> origin/donghyeok
    </div>
    <%@include file="../jsp/footer.jsp"%>
  </body>
</html>

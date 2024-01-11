<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<title>petpeople</title>
<link rel="stylesheet" type="text/css" href="/resources/login.css"> 
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
 <div class="login-box">
      <div class="loginimg">
        <img src="/resources/logindog.jpg" alt="이미지" class="login-img" />
  	    </div>
      <div class="login-title">로그인</div>
      <div class="login-box2">
        <form class="login-form" action="../api/select/logincheck.jsp">
        
          <input
            type="text"
            name="userid"
            class="login-ipbox"
            placeholder="아이디"
          />
        
          <input
            type="password"
            name="password"
            class="login-ipbox"
            placeholder="비밀번호"
          />
          <input type="submit" value="로그인" class="loginbtn" />
        </form>
        <!-- 로그인 실패 시 에러 메시지가 있으면 표시 -->
        <% String loginError = (String)request.getAttribute("loginError"); %>
        <% if (loginError != null) { %>
            <p style="color: red;"><%= loginError %></p>
        <% } %>
        <div class="gojoin">
          
        </div>
      </div>
    </div>
     
    
<%@include file="../jsp/footer.jsp"%>
	<%-- <form action="../api/select/logincheck.jsp">	
 	<label for="userid">아이디:</label><input type="text" name="userid">
 	<label for="password">비밀번호:</label><input type="text" name="password">
 	<input type="submit" value="로그인">
 	</form>
 	 <%-- 로그인 실패 시 에러 메시지가 있으면 표시 --%>
 	  
 	<a href="http://localhost:4885/app/joinmembership.jsp">회원가입</a>
</body>
</html>
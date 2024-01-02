<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/login2.css"> 
<title>Insert title here</title>
</head>
<body>
 <div class="login-box">
      <div class="img">
        <img src="/resources/logindog.jpg" alt="이미지" class="login-img" />
      </div>
      <div class="login-title">로그인</div>
      <div class="login-box2">
        <form class="login-form">
          <!-- <label for="id">아이디:</label> -->
          <input
            type="text"
            name="id"
            class="login-ipbox"
            placeholder="아이디"
          />
          <!-- <button>중복체크</button> -->
          <!-- <label for="password">비밀번호:</label> -->
          <input
            type="password"
            name="password"
            class="login-ipbox"
            placeholder="비밀번호"
          />
          <input type="submit" value="로그인" class="loginbtn" />
        </form>
        <div class="gojoin">
          <a href="http://localhost:9888/app/joinmembership.jsp">회원가입</a>
        </div>
      </div>
    </div>
    
    
	<%-- <form action="../api/select/logincheck.jsp">	
 	<label for="userid">아이디:</label><input type="text" name="userid">
 	<label for="password">비밀번호:</label><input type="text" name="password">
 	<input type="submit" value="로그인">
 	</form>
 	 로그인 실패 시 에러 메시지가 있으면 표시
        <% String loginError = (String)request.getAttribute("loginError"); %>
        <% if (loginError != null) { %>
            <p style="color: red;"><%= loginError %></p>
        <% } %>
 	<a href="http://localhost:8080/app/joinmembership.jsp">회원가입</a> --%>
</body>
</html>
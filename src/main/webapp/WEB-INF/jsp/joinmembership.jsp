<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="/resources/login.js" defer></script>
<link rel="stylesheet" type="text/css" href="/resources/login.css"> 
</head>
<body>
  <div id="formWrap">
 	<form id="signupForm" action="../api/insert/joinmember.jsp">
 	<label for="name">이름:</label><input type="text" placeholder="*" id="name" name="name">
 	<label for="nickname">닉네임:</label><input type="text" placeholder="*" id="nickname" name="nickname"><button type="button"  onclick="logincheckName()">닉네임 중복체크</button>
 	<label for="userid">아이디:</label><input type="text" placeholder="*" id="userid" name="userid"><button type="button"  onclick="logincheckID()">아이디 중복체크</button>
 	<label for="password">비밀번호:</label><input type="text" placeholder="*" id="password" name="password">	
 	<label for="passwordcheck">비밀번호 확인:</label><input type="text" placeholder="*" id="passwordcheck" name="passwordcheck">
 	<div id="passwordMatchStatus"></div>
 	<input id="signupButton" type="submit" value="회원 가입">
 	</form>
 	</div>
</body>
</html>
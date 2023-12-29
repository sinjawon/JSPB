<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 	<form action="../api/insert/joinmember.jsp">
 	<label for="name">이름:</label><input type="text" name="name">
 	<label for="nickname">닉네임:</label><input type="text" name="nickname"><button>중복체크</button>
 	<label for="id">아이디:</label><input type="text" name="id"><button>중복체크</button>
 	<label for="password">비밀번호:</label><input type="text" name="password">
 	<label for="passwordcheck">비밀번호 확인:</label><input type="text" name="passwordcheck">
 	<input type="submit" value="가입">
 	</form>
</body>
</html>
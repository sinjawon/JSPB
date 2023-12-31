<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃기능 수록</title>
</head>
<body>

 일단 집이야 일단와야해
  <!-- 사용자가 로그인되어 있는 경우에만 로그아웃 버튼 표시 -->
    <% if (session.getAttribute("UserNum") != null) { %>
        <p>Welcome, <%= session.getAttribute("UserNum") %>!</p>
        <form action="../select/logout.jsp">
            <input type="hidden" name="logoutAction" value="true">
            <input type="submit" value="로그아웃">
        </form>
    <% } else { %>
        <p>로그인이 필요합니다.</p>
        <!-- 로그인 폼 등을 표시하는 부분 -->
    <% } %>
 
 
</body>
</html>
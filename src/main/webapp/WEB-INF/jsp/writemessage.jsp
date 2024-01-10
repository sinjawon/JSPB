<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 작성</title>
</head>
<body>

<h2>쪽지 작성</h2>
<form action="/MessageServlet" method="post"> <!--  -->
     <input type="text" name="sender" style="display:none" required value="<%=session.getAttribute("UserNum")%>"><br>
     <input type="text" name="receiver" placeholder="받는사람" required><br>
     <textarea name="content" placeholder="내용" required ></textarea><br>
    <input type="submit" value="전송">
</form>

</body>
</html>
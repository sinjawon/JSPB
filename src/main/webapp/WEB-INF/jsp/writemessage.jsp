<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 작성</title>
</head>
<body>

<h2>쪽지 작성</h2>
<form action="/MessageServlet" method="post">
    보내는 사람: <input type="text" name="sender" required><br>
    받는 사람: <input type="text" name="receiver" required><br>
    내용: <textarea name="content" required></textarea><br>
    <input type="submit" value="전송">
</form>

</body>
</html>
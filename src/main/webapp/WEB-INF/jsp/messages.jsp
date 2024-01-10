<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지함</title>
</head>
<body>

<h2>쪽지 목록</h2>
<c:forEach var="message" items="${messages}">
    <p>
        <strong>${message.sender}</strong> to <strong>${message.receiver}</strong>: ${message.content}
        <br/>
        <small>${message.timestamp}</small>
    </p>
</c:forEach>

</body>
</html>
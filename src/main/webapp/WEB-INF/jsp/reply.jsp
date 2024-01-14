<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="/resources/reply2.js"></script> 
</head>
<body>

<!-- reply.jsp -->

<h1>댓글보기</h1>

<div id="replyContainer">
    <!-- 여기에 댓글 목록이 표시됩니다. -->
</div>

   <%session.getAttribute("UserNickName");%>
<h1>댓글 등록</h1>
<form id="replyForm" action="/api/addReply" method="post">
    <input type="text" id="boardListNumInput" name="boardListNum" value="<%=request.getParameter("id")%>" readonly>
    <br><br>
    <input type="text" id="userNickname" name="userNickname" value="<%=session.getAttribute("UserNickName")%>" placeholder="작성자 닉네임" readonly>
    <br><br>
    <textarea id="replyContents" name="replyContents" placeholder="댓글 내용"></textarea>
    <br><br>
    <button type="button" id="addReplyBtn">등록</button>      
</form>

</body>
</html>
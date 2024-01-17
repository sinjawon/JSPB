<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.jsp.system.Ajax, org.json.*"%>
<%@ page import="com.jsp.dto.ReplyInfo"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 글 확인 페이지</title>
<script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
</script>
<script src="/resources/postings4.js"></script>
<script defer src="/resources/reply4.js"></script>



</head>
<body>
	<h1>게시글 보기</h1>
	<div id="userNickname4">작성자</div>
	<div id="viewTitle4">글 제목</div>
	<div id="viewTextarea4">글 내용</div>

	<div> 이미지 공간 4개까지</div>
	<% session.getAttribute("UserNickName"); %>

	<div id="buttonContainer4"></div>



	<form action="/app/boardlist4.jsp" method="post">
		<button type="submit">뒤로가기</button>
	</form>


	<div id="replyContainer4">
		<template>
			<div class="userNickname4">작성자</div>
			<div class="replyContents4">본문</div>
			<div class="regDate4">등록일</div>
		<%-- 	<button class="editReply" name="editReply"
				onclick="editReply(${data.replyNum})">수정</button> --%>
			<button class="deleteReply4" name="deleteReply4"
				onclick="deleteReply4(${data.replyNum4})">삭제</button>
		</template>
	</div>

	<h1>댓글 등록</h1>
	<form id="replyForm4" action="/api/addReply4" method="post">
		<input type="text" id="boardListNumInput4" name="boardListNum4"
			value="<%=request.getParameter("id")%>" readonly> <br>
		<br> <input type="text" id="userNickname4" name="userNickname4"
			value="<%=session.getAttribute("UserNickName")%>"
			placeholder="작성자 닉네임"> <br>
		<br>
		<textarea id="replyContents4" name="replyContents4" placeholder="댓글 내용"></textarea>
		<br>
		<br>
		<button type="button" id="addReplyBtn4">등록</button>
	</form>


</body>
</html>
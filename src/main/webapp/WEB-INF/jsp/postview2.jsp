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
<script src="/resources/postings2.js"></script>
<script defer src="/resources/reply2.js"></script>



</head>
<body>
	<h1>게시글 보기</h1>
	<div id="userNickname2">작성자</div>
	<div id="viewTitle2">글 제목</div>
	<div id="viewTextarea2">글 내용</div>

	<div id="imageContainer2"></div>
	   
	<% session.getAttribute("UserNickName"); %>

	<div id="buttonContainer2"></div>



	<form action="/app/boardlist2.jsp" method="post">
		<button type="submit">뒤로가기</button>
	</form>


	<div id="replyContainer2">
		<template>
			<div class="userNickname2">작성자</div>
			<div class="replyContents2">본문</div>
			<div class="regDate2">등록일</div>
		<%-- 	<button class="editReply" name="editReply"
				onclick="editReply(${data.replyNum})">수정</button> --%>
			<button class="deleteReply2" name="deleteReply2"
				onclick="deleteReply2(${data.replyNum2})">삭제</button>
		</template>
	</div>

	<h1>댓글 등록</h1>
	<form id="replyForm2" action="/api/addReply2" method="post">
		<input type="text" id="boardListNumInput2" name="boardListNum2"
			value="<%=request.getParameter("id")%>" readonly> <br>
		<br> <input type="text" id="userNickname2" name="userNickname2"
			value="<%=session.getAttribute("UserNickName")%>"
			placeholder="작성자 닉네임"> <br>
		<br>
		<textarea id="replyContents2" name="replyContents2" placeholder="댓글 내용"></textarea>
		<br>
		<br>
		<button type="button" id="addReplyBtn2">등록</button>
	</form>


</body>
</html>

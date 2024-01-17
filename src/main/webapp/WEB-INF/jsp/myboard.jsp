<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Board List</title>
<style>

<%-- 임시로 보기 좋으라고 --%>

a { 
	display: inline-block;
	text-align: center;
	overflow: hidden;
}

a.boardListNum, a.usernickname, a.hitCount, a.regDate {
	width: 150px;
}

a.title {
	width: 200px;
	background: gray;
}

a.mainContents {
	width: 200px;
	background: aqua;
}
</style>
<script defer src="/resources/myboard.js"></script>
</head>
<body>

	<h1>Board List</h1>


	<div id="boards">
		<template>
			<a href="/app/postview.jsp?id=0" class="boardListNum">0</a> 
			<a href="/app/postview.jsp?id=0" class="title">제목</a> 
			<a class="mainContents">본문</a> 
			<a class="userNickname">작성자</a> 
			<a class="hitCount">조회수</a> 
			<a class="regDate">등록일</a>
		</template>
	</div>


	<form id="searchform" action="/api/boardList" method="post" style="display: none;">
		<select id="searches" name="searchtype">
			<option value="userNickname">작성자</option>
		</select> 
		<input type="text" id="search" name="search" value='<%=session.getAttribute("UserNickName")%>'> 
		<input type="text" id="page" name="page" value="1" style="display: none;" />
		<button type="button" onclick="submitSearch()">검색</button>
	</form>


</body>
</html>
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
<script defer src="/resources/boardlist2.js"></script>
</head>
<body>

	<h1>Board List2</h1>


	<div id="boards2">
		<template>
			<a href="/app/postview2.jsp?id=0" class="boardListNum2">0</a> 
			<a href="/app/postview2.jsp?id=0" class="title2">제목</a> 
			<a class="mainContents2">본문</a> 
			<a class="userNickname2">작성자</a> 
			<a class="hitCount2">조회수</a> 
			<a class="regDate2">등록일</a>
		</template>
	</div>


	<form id="searchform2" action="/api/boardList2" method="post" style="display: none;">
		<select id="searches2" name="searchtype2">
			<option value="userNickname2">작성자</option>
		</select> 
		<input type="text" id="search2" name="search2" value='<%=session.getAttribute("UserNickName")%>'> 
		<input type="text" id="page2" name="page2" value="1" style="display: none;" />
		<button type="button" onclick="submitSearch()2">검색</button>
	</form>


</body>
</html>
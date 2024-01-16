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

a.boardListNum4, a.usernickname4, a.hitCount4, a.regDate4 {
	width: 150px;
}

a.title4 {
	width: 200px;
	background: gray;
}

a.mainContents4 {
	width: 200px;
	background: aqua;
}
</style>
<script defer src="/resources/boardlist4.js"></script>
</head>
<body>

	<h1>Board List4</h1>


	<div id="boards4">
		<template>
			<a href="/app/postview4.jsp?id=0" class="boardListNum4">0</a> 
			<a href="/app/postview4.jsp?id=0" class="title4">제목</a> 
			<a class="mainContents4">본문</a> 
			<a class="userNickname4">작성자</a> 
			<a class="hitCount4">조회수</a> 
			<a class="regDate4">등록일</a>
		</template>
	</div>
	<div id="pages4">
		<template>
			<span onclick="pageChange4(this.innerText)">1</span>
		</template>
	</div>


	<form id="searchform4" action="/api/boardList4" method="post">
		<select id="searches4" name="searchtype4">
			<option value="all4">== 선택 ==</option>
			<option value="title4">제목</option>
			<option value="userNickname4">작성자</option>
		</select> 
		<input type="text" id="search4" name="search4"> 
		<input type="text" id="page4" name="page4" value="1" style="display: none;" />
		<button type="button" onclick="submitSearch4()">검색</button>
	</form>


	<form id="refresh4" action="/api/boardList4" method="post">
		<button type="button" class="back4"
			onClick="location.href='/app/boardlist4.jsp'">목록으로 돌아가기</button>
	</form>
	<form action="/insert4" method="post">
		<button type="button" class="navyBtn4"
			onClick="location.href='/app/insert4.jsp'">글쓰기</button>
	</form>


</body>
</html>
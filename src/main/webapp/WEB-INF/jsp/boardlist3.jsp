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

a.boardListNum3, a.usernickname3, a.hitCount3, a.regDate3 {
	width: 150px;
}

a.title3 {
	width: 200px;
	background: gray;
}

a.mainContents3 {
	width: 200px;
	background: aqua;
}
</style>
<script defer src="/resources/boardlist3.js"></script>
</head>
<body>

	<h1>Board List3</h1>


	<div id="boards3">
		<template>
			<a href="/app/postview3.jsp?id=0" class="boardListNum3">0</a> 
			<a href="/app/postview3.jsp?id=0" class="title3">제목</a> 
			<a class="mainContents3">본문</a> 
			<a class="userNickname3">작성자</a> 
			<a class="hitCount3">조회수</a> 
			<a class="regDate3">등록일</a>
		</template>
	</div>
	<div id="pages3">
		<template>
			<span onclick="pageChange3(this.innerText)">1</span>
		</template>
	</div>


	<form id="searchform3" action="/api/boardList3" method="post">
		<select id="searches3" name="searchtype3">
			<option value="all3">== 선택 ==</option>
			<option value="title3">제목</option>
			<option value="userNickname3">작성자</option>
		</select> 
		<input type="text" id="search3" name="search3"> 
		<input type="text" id="page3" name="page3" value="1" style="display: none;" />
		<button type="button" onclick="submitSearch3()">검색</button>
	</form>


	<form id="refresh3" action="/api/boardList3" method="post">
		<button type="button" class="back3"
			onClick="location.href='/app/boardlist3.jsp'">목록으로 돌아가기</button>
	</form>
	<%if(session.getAttribute("UserNickName") != null) { %>
	<form action="/insert3" method="post">
		<button type="button" class="navyBtn3"
			onClick="location.href='/app/insert3.jsp'">글쓰기</button>
	</form>
	<%} %>

</body>
</html>
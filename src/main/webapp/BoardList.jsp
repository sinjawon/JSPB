<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
		<%-- 임시로 보기 좋으라고 --%>
   	div{
		display: inline-block;
	}
	div.boardListNum, div.usernickname,div.hitCount,div.regDate{
		width:100px;
	}
	div.title{
		width:600px;
	}
    </style>
<script src="/resources/boardlist.js"></script>
</head>
<body>

<h1>Board List</h1>
		
		<%-- 안에 채워진 건 다 임시로 보여주기용이다 실제가 아니다 --%>
		
		<%-- db에서 등록된 글을 가져오고 한페이지에 몇개를 보여줄까?
		한페이지에 글이 10개고 마지막 페이지에 글이 5개 라면 
		리스트 칸이 5개로 줄어드나? 아님 10개 칸 유지하고 밑에 5개 빈공간으로 보여줄까?
		다른 페이지로 이동하는 번호는 몇개씩 보여주지? 
		사진은 리스트에 보여줄건가 아님 텍스트만 보여줄건가?
		사진이 없는 글은 디폴트 이미지를 넣어주나?  --%>
	<div id="boards">
		<template>
			<div class="boardListNum">0</div>
			<div class="title">제목</div>
			<div class="userNickname">작성자</div>
			<div class="hitCount">작성자</div>
			<div class="regDate">작성자</div>
		</template>
	</div>
        
	<div class="searchBar">
   		<form action="/api/searchboard" method="post">
        	<label for="search">Search</label>
        	<select id="searchtype" name="searchtype">
				<option value="All">All</option>
				<option value="title">제목</option>
				<option value="userNickname">작성자</option>
			</select> 
        		<input type="text" id="search" name="search">
        		<button type="submit">검색</button>
    			<a href="/writeBoard">글쓰기</a>
   		</form>
	</div>



</body>
</html>
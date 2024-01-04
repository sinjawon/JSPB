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
	
	<div id="boards">
		<template>
			<div class="boardListNum">0</div>
			<div class="title">제목</div>
			<div class="userNickname">작성자</div>
			<div class="hitCount">작성자</div>
			<div class="regDate">작성자</div>
		</template>
	</div>
        
        
        <%--검색 기능 미구현 --%>
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
   		</form>
   		<form action="/insert" method="post">
   			<button type="button" class="navyBtn" onClick="location.href='/insert.jsp'">글쓰기</button>
   		</form>  
   				
	</div>



</body>
</html>
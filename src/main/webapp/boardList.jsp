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
   	a{
		display: inline-block;
	}
	a.boardListNum, a.usernickname,a.hitCount,a.regDate{
		width:100px;
	}
	a.title{
		width:600px;
	}
    </style>
<script src="/resources/boardlist3.js"></script>
</head>
<body>

<h1>Board List</h1>
		
		
	<div id="boards">
		<template>
			<a href="/postView.jsp?id=0" class="boardListNum">0</a>
			<a class="title">제목</a>
			<a class="userNickname">작성자</a>
			<a class="hitCount">작성자</a>
			<a class="regDate">작성자</a>
		</template>
	</div>
        
	
   		<form id="searchtype" action="/api/boardlist" method="post" onsubmit="return false">
        	<select id="searches" name="searchtype">
				<option value="All">선택</option>
				<option value="title">제목</option>
				<option value="userNickname">작성자</option>
			</select> 
        		<input type="text" id="search" name="search">
        		<button type="button" onclick="submitSearch()">검색</button>
   		</form>
   		
   		<form action="/api/boardlist" method="post">
   			<button type="button" class="back" onClick="location.href='/BoardList.jsp'">목록으로 돌아가기</button>
   		</form>  		
   		<form action="/insert" method="post">
   			<button type="button" class="navyBtn" onClick="location.href='/insert.jsp'">글쓰기</button>
   		</form>  		




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	a.boardListNum, div.usernickname,div.hitCount,div.regDate{
		width:100px;
	}
	a.title{
		width:600px;
	}
    </style>
<script src="/resources/boardlist.js"></script>
</head>
<body>

<h1>Board List</h1>
	
	<div id="boards">
		<template>
			<a href="/postView.jsp?id=0" class="boardListNum">0</a>
			<a class="title">글 제목</a>
			<a class="userNickname">작성자</a>
			<a class="hitCount">조회수</a>
			<a class="regDate">등록일</a>
			<c:if test="${data.userNickname eq sessionScope.userNickname}">
			<%-- 이러면 작성자만 보이나? --%>
				<button onclick="editPost(${data.boardListNum})">수정</button>
                <button onclick="deletePost(${data.boardListNum})">삭제</button>
            </c:if>
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
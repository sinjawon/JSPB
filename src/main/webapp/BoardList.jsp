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
		display:inline-block; text-align: center; overflow: hidden;
	}
	a.boardListNum, a.usernickname,a.hitCount,a.regDate{
		width:150px;  
	}
	a.title{
		width:500px;  
	}
    </style>
<script defer src="/resources/boardlist.js"></script>
</head>
<body>

<h1>Board List</h1>
		
		
	<div id="boards">
		<template>
			<a href="/postView.jsp?id=0" class="boardListNum">0</a>
			<a href="/postView.jsp?id=0" class="title">제목</a>
			<a class="userNickname">작성자</a>
			<a class="hitCount">조회수</a>
			<a class="regDate">등록일</a>
			<a href="/editPost.jsp?id=0" class="editPost">수정</a>
         	<a href="javascript:void(0)" class="deletePost" onclick="deletePost(0)">삭제</a>
		</template>
	</div>
	<div id="pages">
		<div> <!-- 원래 template 으로 해서 자동으로 적용해야 하는데 못해서 임시로 넘어갑니다. 이걸 건드리면 검색이랑 리스트랑 다 엉켜서요. -->
			<span onclick="pageChange(this.innerText)">1</span>
			<span onclick="pageChange(this.innerText)">2</span>
			<span onclick="pageChange(this.innerText)">3</span>
			<span onclick="pageChange(this.innerText)">4</span>		
		</div>
	</div>
        
	
  		<form id="searchtype" action="/api/boardlist" method="post" onsubmit="submitSearch()">
        	<select id="searches" name="searchtype">
        		<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="userNickname">작성자</option>
			</select> 
        		<input type="text" id="search" name="search">
        		<input type="text" id="page" name="page" value="1" style="display:none;"/>
        		<button type="button" onclick="submitSearch()">검색</button>
   		</form> 
   		
   		
   		<form id="searchtype" action="/api/boardlist" method="post">
   			<button type="button" class="back" onClick="location.href='/boardList.jsp'">목록으로 돌아가기</button>
   		</form>  		
   		<form action="/insert" method="post">
   			<button type="button" class="navyBtn" onClick="location.href='/insert.jsp'">글쓰기</button>
   		</form>  		


</body>
</html>
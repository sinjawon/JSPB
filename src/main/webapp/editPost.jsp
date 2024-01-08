<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 페이지</title>
    <script>var valueId=<%=request.getParameter("id")%>;</script>
    <script src="/resources/postings.js"></script>
    
</head>
<body>
    <h1>글 수정하기</h1>
    
    
    <form id="editForm" action="/api/editPost" method="post">
    <input type="hidden" name="boardListNum" value="<%= request.getParameter("id") %>">
    <textarea id="userNickname" name="userNickname" placeholder="작성자"></textarea>
    <br>
    <textarea id="viewTitle" name="title" placeholder="글 제목"></textarea>
    <br><br>
    <textarea id="viewTextarea" name="mainContents" placeholder="글 내용"></textarea>
    <br><br><br>
    <button type="button" onclick="editPost()">수정 확인</button>
    
    <form action="/boardList" method="post">
        <button type="submit">뒤로가기</button>
    </form>
</form>
    
    
    
    
    
    <form id="editForm" action="/api/editPost" method="post">
    	<div id= boardListNum>${valueId} </div>
    	<textarea id="userNickname" name="userNickname" placeholder="작성자"></textarea>
    	<br>
    	<textarea id="viewTitle" name="title" placeholder="글 제목"></textarea>
    	<br><br>
    	<textarea id="viewTextarea" name="mainContents" placeholder="글 내용"></textarea>
    	<br><br><br>
    
        <button type="button" onclick="editPost()">수정 확인</button>
        
        <form action="/boardList" method="post">
            <button type="submit">뒤로가기</button>
        </form>
    </form>
</body>
</html>
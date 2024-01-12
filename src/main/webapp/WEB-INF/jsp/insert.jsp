<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
</head>
<body>
    <script defer src="/resources/boardWrite.js"></script>
    	<%@include file="../jsp/nav.jsp"%>
    
    <h1>글쓰기</h1>
    
    <form id="writeForm" action="/api/newPost" method="post">
        <input type="text" id="userNickname" name="userNickname" placeholder="작성자">
        <br>
        <input type="text" id="titleInput" name="title" placeholder="글 제목">
        <br><br>
        <textarea id="postTextarea" name="mainContents" placeholder="글 내용"></textarea>
        <br><br><br>
        <button type="button" onclick="submitPost()">확인</button>
        <button type="button" onclick="cancelPost()">취소</button>
        
        <form action="/app/boardList" method="post">
            <button type="button" onclick="location.href='/app/boardlist.jsp'">뒤로가기</button>
         </form>  
    </form>
        	<%@include file="../jsp/footer.jsp"%>
    
</body>
</html>


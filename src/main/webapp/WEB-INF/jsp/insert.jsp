<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone-min.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone.min.css">
    <script defer src="/resources/boardWrite.js"></script>
</head>
<body>
    <h1>글쓰기</h1>
    
    
    
        
    <form id="writeForm" action="/api/newPost" method="post">
        <input type="text" id="userNickname" name="userNickname" value='<%=session.getAttribute("UserNickName")%>' readonly >
        <br>
        <input type="text" id="titleInput" name="title" placeholder="글 제목">
        <br><br>
        <textarea id="postTextarea" name="mainContents" placeholder="글 내용"></textarea>
        <br><br><br>
        
        
        <div class="dropzone"></div>
        
        <button type="submit" id="submit">확인</button>
        <button type="button" onclick="cancelPost()">취소</button>
        
        <form action="/app/boardlist" method="post">
   			<button type="button" onclick="location.href='/app/boardlist.jsp'">뒤로가기</button>
   		</form>  
    </form>
</body>
</html>



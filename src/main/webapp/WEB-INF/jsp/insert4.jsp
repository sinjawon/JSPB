<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone-min.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone.min.css">
    <script defer src="/resources/boardWrite4.js"></script>
</head>
<body>
    <h1>글쓰기4</h1>
    
    
    
        
    <form id="writeForm4" action="/api/newPost4" method="post">
        <input type="text" id="userNickname4" name="userNickname4" class="userNickname" value='<%=session.getAttribute("UserNickName")%>' readonly>
        <input type="text" id="titleInput4" name="title4" placeholder="제목을 입력해주세요" class="titleInput">
        <textarea id="postTextarea4" name="mainContents4" placeholder="글 내용을 입력해주세요" class="postTextarea"></textarea>
        <div class="dropzone"></div>
        
        <button type="submit" id="submit">확인</button>
        <button type="button" onclick="cancelPost4()">취소</button>
        
        <form action="/app/boardlist4" method="post">
   			<button type="button" onclick="location.href='/app/boardlist4.jsp'">뒤로가기</button>
   		</form>  
    </form>
</body>
</html>


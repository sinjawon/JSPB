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
    
   
    <form id="writeForm" action="/api/newPost" method="post">
        <input type="text" id="userNickname" name="userNickname" placeholder="작성자" value='<%=session.getAttribute("UserNickName")%>' readonly>
        <input type="text" id="titleInput" name="title" placeholder="제목을 입력해주세요">
        <textarea id="postTextarea" name="mainContents" placeholder="글 내용을 입력해주세요"></textarea>
	       <div class="btns">
	        <button type="button" onclick="submitPost()" class="insertok">확인</button>
	        <button type="button" onclick="cancelPost()" class="cancelbtn">취소</button>
	        <form action="/app/boardlist" method="post">
	            <button type="button" onclick="location.href='/app/boardlist.jsp'" class="backbtn">뒤로가기</button>
	         </form>  
    </form>
           </div>
    
</body>
</html>


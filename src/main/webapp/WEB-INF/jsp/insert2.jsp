<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone-min.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone.min.css">
    <script defer src="/resources/boardWrite2.js"></script>
</head>
<body>

        
    <form id="writeForm2" action="/api/newPost2" method="post">
        <input type="text" id="userNickname2" name="userNickname2" class="userNickname" value='<%=session.getAttribute("UserNickName")%>' readonly>
        <input type="text" id="titleInput2" name="title2" placeholder="제목을 입력해주세요" class="titleInput">
        <textarea id="postTextarea2" name="mainContents2" placeholder="글 내용을 입력해주세요" class="postTextarea"></textarea>
        <div class="dropzone"></div>
           <div class="btns">
              <button type="submit" id="submit" class="insertok">확인</button>
              <button type="button" onclick="cancelPost2()" class="cancelbtn">취소</button>
        <form action="/app/boardlist2" method="post">
            <button type="button" onclick="location.href='/app/boardlist2.jsp'" class="backbtn">게시판</button>
         </form>  
           </div>
    </form>
    
</body>
</html>

   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 페이지</title>
</head>
<body>
    <h1>글 수정하기</h1>
    
    <form id="editForm" action="/api/editPost" method="post">
        <input type="text" id="editUserNickname" name="userNickname" placeholder="작성자" value="${post.userNickname}">
        <br>
        <input type="text" id="editTitleInput" name="title" placeholder="글 제목" value="${post.title}">
        <br><br>
        <textarea id="editPostTextarea" name="mainContents" placeholder="글 내용">${post.mainContents}</textarea>
        <br><br><br>
        <button type="button" onclick="submitEdit()">확인</button>
        <form action="/boardList" method="post">
            <button type="submit">뒤로가기</button>
        </form>
    </form>
</body>
</html>
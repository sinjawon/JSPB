<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>글쓰기 페이지</title>

</head>
<body>




<body>
    <script src="boardWrite.js"></script>
    <h1>글쓰기</h1>
    <form id="writeForm">
        <input type="text" id="titleInput" placeholder="글 제목">
        <br>
          <br>
            <br>
        <textarea id="contentTextarea" placeholder="글 내용"></textarea>
        <br>
          <br>
            <br>
        <button type="button" onclick="submitPost()">확인</button>
        <button type="button" onclick="cancelPost()">취소</button>
    </form>

</body>
</html>
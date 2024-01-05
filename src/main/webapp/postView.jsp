
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>작성한 글 확인 페이지</title>
    <script>var valueId=<%=request.getParameter("id")%>;</script>
    <script src="/resources/postings.js"></script>
</head>
<body>
    <h1>게시글 보기 </h1>
    <div id="userNickname">작성자</div>
    <div id="viewTitle">글 제목</div>
    <div id="viewTextarea">글 내용</div>

</body>
</html>

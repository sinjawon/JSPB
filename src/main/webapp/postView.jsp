<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
    <c:if test="${data.userNickname eq sessionScope.userNickname}">
        <button onclick="editPost(${data.boardListNum})">수정</button>
    </c:if>
    
    <form action="/boardList.jsp" method="post">
        <button type="submit">뒤로가기</button>
    </form>
</body>
</html>





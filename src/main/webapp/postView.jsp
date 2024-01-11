<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<%@ page import="com.jsp.dto.ReplyInfo" %>


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
    
    <h1> 댓글보기 </h1>
  
    
    <c:choose>
    <c:when test="${not empty replyList}">
        <c:forEach var="reply" items="${replyList}">
            <div class="replyContents">${reply.replyContents}</div>
            <div class="userNickname">${reply.userNickname}</div>
            <div class="regDate">${reply.regDate}</div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p>댓글이 없습니다.</p>
    </c:otherwise>
</c:choose>
    
	<button type="button" onclick="editReply()">수정</button>  
	<button type="button" onclick="deleteReply()">삭제</button>  
    
    <h1> 댓글 등록 </h1>
    <form id="replyForm" action="/api/addReply" method="post">
        <br><br>
        <textarea id="replyContents" name="replyContents" placeholder="댓글 내용"></textarea>
        <br><br>
        <button type="button" onclick="addReply()">등록</button>      
      </form>
    
</body>
</html>
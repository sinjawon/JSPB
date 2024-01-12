<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<%@ page import="com.jsp.dto.ReplyInfo" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>petpeople</title>
    <link rel="stylesheet" type="text/css" href="/resources/detail.css"> 
    <script>var valueId=<%=request.getParameter("id")%>;</script>
    <script src="/resources/postings.js"></script>
</head>
<body>
	<%@include file="../jsp/nav.jsp"%>
	<div class="detail">
    <h3>자유게시판</h3>
    <div class="detail_board">
	    <div id="userNickname" class="detail_writer" >작성자</div>
	    <div id="viewTitle" class="detail_title">글 제목</div>
	    <div id="viewTextarea" class="detail_contents">글</div>
    </div>
    <div class="detail_btn">
    <c:if test="${data.userNickname eq sessionScope.userNickname}">
        <button onclick="editPost(${data.boardListNum})">수정</button>
    </c:if>
    <form action="/app/boardList.jsp" method="post" class=btnform>
        <button type="submit" class='goback'>뒤로가기</button>
    </form>
    </div>
    
    <div class="comment_box">
     <h4>댓글</h4>
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
    <div class="modi_btn">
		<button type="button" onclick="editReply()">수정</button>  
		<button type="button" onclick="deleteReply()">삭제</button>  
    </div>
 
    <form id="replyForm" action="/api/addReply" method="post">
       <div class="writing_field">
        	<textarea id="replyContents" name="replyContents" placeholder="댓글 내용을 입력하세요" class="text"></textarea>
        	<button type="button" onclick="addReply()" class="writing_btn">등록</button>
       </div>      
      </form>
    </div>
      </div>
	<%@include file="../jsp/footer.jsp"%>
      
</body>
</html>
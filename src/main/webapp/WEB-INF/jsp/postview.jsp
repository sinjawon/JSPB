<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<%@ page import="com.jsp.dto.ReplyInfo" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>작성한 글 확인 페이지</title>
    <script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
    </script>
    <script src="/resources/postings.js"></script>
    <script defer src="/resources/reply2.js"></script> 
 
</head>
<body>
    <h1>게시글 보기 </h1>
    <div id="userNickname">작성자</div>
    <div id="viewTitle">글 제목</div>
    <div id="viewTextarea">글 내용</div>
    
    <%session.getAttribute("UserNickName");%>
    
  	 <div id ="buttonContainer"></div>

    
    
    <form action="/app/boardlist.jsp" method="post">
        <button type="submit">뒤로가기</button>
    </form>
    
    
    <h1>댓글보기</h1>

<div id="replyContainer">
    <!-- 여기에 댓글 목록이 표시됩니다. -->
</div>
    
    
    <h1>댓글 등록</h1>
<form id="replyForm" action="/api/addReply" method="post">
    <input type="text" id="boardListNumInput" name="boardListNum" value="<%=request.getParameter("id")%>" readonly>
    <br><br>
    <input type="text" id="userNickname" name="userNickname" value="<%=session.getAttribute("UserNickName")%>" placeholder="작성자 닉네임" readonly>
    <br><br>
    <textarea id="replyContents" name="replyContents" placeholder="댓글 내용"></textarea>
    <br><br>
    <button type="button" id="addReplyBtn">등록</button>      
</form>
    
</body>
</html>
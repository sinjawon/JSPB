<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 페이지</title>
    <script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
    </script>
    
    <script src="/resources/postings.js"></script>
    
</head>
<body>
    <h1>글 수정하기</h1>
    
    
    <form id="editForm" action="/api/editPost" method="post">
    <input type="hidden" name="boardListNum" value="<%= request.getParameter("id") %>">
    <textarea id="userNickname" name="userNickname" placeholder="작성자"></textarea>
    <br>
    <textarea id="viewTitle" name="title" placeholder="글 제목"></textarea>
    <br><br>
    <textarea id="viewTextarea" name="mainContents" placeholder="글 내용"></textarea>
    <br><br><br>
    <button type="button" onclick="editPost()">수정 확인</button>
    
   
       <form id="refresh" action="/api/boardList" method="post">
   			<button type="button" onClick="location.href='/app/postview.jsp?id=<%= request.getParameter("id") %>'">돌아가기</button>
   		</form>
   		<%-- 수정했던 글로 가도록 변경함 --%>
   
</form>
    
    
    
    
    
   
</body>
</html>

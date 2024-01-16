<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 페이지2</title>
    <script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
    </script>
    
    <script src="/resources/postings2.js"></script>
    
</head>
<body>
    <h1>글 수정하기2</h1>
    
    
    <form id="editForm2" action="/api/editPost2" method="post">
    <input type="hidden" name="boardListNum2" value="<%= request.getParameter("id") %>">
    <textarea id="userNickname2" name="userNickname2" placeholder="작성자"></textarea>
    <br>
    <textarea id="viewTitle2" name="title2" placeholder="글 제목"></textarea>
    <br><br>
    <textarea id="viewTextarea2" name="mainContents2" placeholder="글 내용"></textarea>
    <br><br><br>
    <button type="button" onclick="editPost2()">수정 확인</button>
    
   
       <form id="refresh2" action="/api/boardList2" method="post">
   			<button type="button" onClick="location.href='/app/boardlist2.jsp'">돌아가기</button>
   		</form>
   
</form>
    
    

</body>
</html>
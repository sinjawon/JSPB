<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 페이지3</title>
    <script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
    </script>
    
    <script src="/resources/postings3.js"></script>
    
</head>
<body>
   
    <%@include file="../jsp/nav.jsp"%>
    
    
    <form id="editForm3" action="/api/editPost3" method="post">
    <input type="hidden" name="boardListNum3" value="<%= request.getParameter("id") %>">
    <textarea id="userNickname3" name="userNickname3" placeholder="작성자"></textarea>
    <br>
    <textarea id="viewTitle3" name="title3" placeholder="글 제목"></textarea>
    <br><br>
    <textarea id="viewTextarea3" name="mainContents3" placeholder="글 내용"></textarea>
    <br><br><br>
    <button type="button" onclick="editPost3()">수정 확인</button>
    
   
       <form id="refresh3" action="/api/boardList3" method="post">
   			<button type="button" onClick="location.href='/app/postview3.jsp?id=<%= request.getParameter("id") %>'">돌아가기</button>
   		</form>
   
</form>
    
    

</body>
</html>
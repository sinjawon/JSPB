<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <style><%-- 임시--%>
        .uploaded-image {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
        }
    </style>
</head>
<body>


    <h1>게시글 보기 </h1>
    <div id="userNickname">작성자</div>
    <div id="viewTitle">글 제목</div>
    <div id="viewTextarea">글 내용</div>
    
   
    
    
    
    <div id ="buttonContainer"></div>
    
   <%-- 버튼 
   	<button type="button" onclick="location.href='/editPost.jsp?id=<%=request.getParameter("id")%>'">수정</button>
    <button type="button" onclick="deletePost(<%=request.getParameter("id")%>)">삭제</button>
    --%>
    
    
  
 
        

  
    
    <form action="/boardList.jsp" method="post">
        <button type="submit">뒤로가기</button>
    </form>
</body>
</html>





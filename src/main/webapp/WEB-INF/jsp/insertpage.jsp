<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
<link rel="stylesheet" type="text/css" href="/resources/insertpage.css"> 

<script src="/resources/boardWrite.js" defer></script>

<title>petpeople</title>
</head>
<body>

	<%@include file="../jsp/nav.jsp"%>
	<div class="insertpage">
	<div class="insert-box">
<!-- 
      <select
        class="insert-list"
        name="insert-list"
        onchange="moveurl(this.value)"
      >
        <option value="insert.jsp">자유게시판</option>
        <option value="insert2.jsp">자랑게시판</option>
        <option value="insert3.jsp">산책게시판</option>
        <option value="insert4.jsp">애완용품거래게시판</option>
      </select> -->
      <div class="insertpagebox">
	      <ul  class="insertbtn">
	        <li>
	          <a href="insert.jsp">자유게시판</a>
	          <ul class="insertul">
	            <li><a href="insert2.jsp">자랑게시판</a></li>
	            <li><a href="insert3.jsp">산책게시판</a></li>
	            <li><a href="insert4.jsp">애완용품거래게시판</a></li>
	          </ul>
	        </li>
	       </ul>
       </div>

      
      
<%-- 	<p class="insertpage-p"><%=session.getAttribute("UserNickName") %> 님</p> 
 --%>  
   
    <div id="options">
    </div> 
    </div>
    </div>
    
	<%@include file="../jsp/footer.jsp"%>
</body>
</html>
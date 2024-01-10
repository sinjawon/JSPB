<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
<link rel="stylesheet" type="text/css" href="/resources/insertpage.css"> 

<script src="/resources/insertpage.js" defer></script>

<title>Insert title here</title>
</head>
<body>
	<div class="insert-box">

      <select
        class="insert-list"
        name="insert-list"
        onchange="moveurl(this.value)"
      >
        <option value="freepage.jsp">자유게시판</option>
        <option value="test.jsp">자랑게시판</option>
        <option value="work">산책게시판</option>
        <option value="boardlist.html">애완용품거래게시판</option>
      </select>


    <div id="options">
    </div> 
</body>
</html>
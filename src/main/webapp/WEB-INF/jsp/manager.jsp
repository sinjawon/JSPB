<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/manager.css"> 
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
<div class="manager-box">
      <h2 class="manager-title">관리자페이지 입니다.</h2>
      <div class="manager-top">
        <h3 class="manager-join">회원유동 그래프</h3>
        <div class="manager">그래프</div>
      </div>

      <div class="document">
        <ul>
          <li>
            <div class="boards"><a href="#">쪽지</a></div>
            <div class="boardDocs"></div>
          </li>
          <li>
            <div class="boards"><a href="#">회원수</a></div>
            <div class="boardDocs"></div>
          </li>
          <li>
            <div class="boards"><a href="#">회원관리</a></div>
            <div class="boardDocs"></div>
          </li>
        </ul>
      </div>
    </div>
    
<%@include file="../jsp/footer.jsp"%>
</body>
</html>
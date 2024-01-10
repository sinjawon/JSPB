<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petpeople</title>
<link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
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

      <h3 class="manager-people">가입인원</h3>
      <div class="manager-peoplech">
        <!-- 가입인원 데이터 -->
      </div>
    </div>
    
<%@include file="../jsp/footer.jsp"%>
</body>
</html>
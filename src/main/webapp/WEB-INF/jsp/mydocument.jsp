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
<link rel="stylesheet" href="/resources/myreset.css" />
<link rel="stylesheet" href="/resources/mydocument.css" />
</head>
<body>
	<%@include file="../jsp/nav.jsp"%>
		<div class="info_wrap">
        <div class="info">
            <div><a href="mypage.jsp">프로필</a></div>
            <div><a href="mydocument.jsp">내가 작성한 글</a></div>
            <div class="notepage"><a href="notepage.jsp">쪽지함</a></div>
        </div>
    <div class="document">
        <ul>
          <li>
                <div class=boards><a href="#">자유게시판</a></div>
                <div class="boardDocs"></div>
            </li>
            <li>
                <div class=boards><a href="#">자랑게시판</a></div>
                <div class="boardDocs"></div>
            </li>
            <li>
                <div class=boards><a href="#">산책게시판</a></div>
                <div class="boardDocs"></div>
            </li>
            <li>
                <div class=boards><a href="#">애완용품거래</a></div>
                <div class="boardDocs"></div>
            </li>
        </ul>
    </div>
       
    </div>
	
	<%@include file="../jsp/footer.jsp"%>
	
</body>
</html>
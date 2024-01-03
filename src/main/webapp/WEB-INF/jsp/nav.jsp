<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
<link rel="stylesheet" type="text/css" href="/resources/nav.css"> 
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<title>Insert title here</title>
</head>
<body>
 <header>
      <nav>
        <h1>
         <a href="main.jsp"><img src="/resources/logo.png" alt="Logo" style="width:100%" /></a>
        </h1>
        <div class="menu">
          <div class="search">
            <input type="search" />
            <button type="submit">
              <i class="fa-solid fa-magnifying-glass fa-2x"></i>
            </button>
          </div>
          <div class="box">
            <div class="board">
              <ul>
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">자랑게시판</a></li>
                <li><a href="#">산책게시판</a></li>
                <li><a href="#">애완용품거래</a></li>
              </ul>
            </div>
            <div class="login">
              <div><a href="login.jsp">로그인</a></div>
              <div><a href="joinmembership.jsp">회원가입</a></div>
            </div>
          </div>
        </div>
      </nav>
    </header>
</body>
</html>
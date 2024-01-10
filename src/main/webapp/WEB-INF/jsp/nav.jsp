<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
         <a href="main.jsp"><img src="/resources/logo.png" alt="Logo" style= "width:350px" /></a>
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
                <li><a href="freeboard.jsp">자유게시판</a></li>
                <li><a href="boastboard.jsp">자랑게시판</a></li>
                <li><a href="walkboard.jsp">산책게시판</a></li>
                <li><a href="tradeboard.jsp">애완용품거래</a></li>
              </ul>
            </div>
            
            <c:if test = "${sessionScope.UserNickName==null }" >
	            <div class="login">
	              <div><a href="login.jsp">로그인</a></div>
	              <div><a href="joinmembership.jsp">회원가입</a></div>
            	</div>
            </c:if>
            <c:if test = "${sessionScope.UserNickName!=null }" >
            <p><%=session.getAttribute("UserNickName") %> 님</p> <!-- 로그인하면 이름 뜨게 -->
	            <div class="login">
	              <div><form action="../api/select/logout.jsp"><input type="submit" value="로그아웃" /><input type="hidden" name="logoutAction" value="true"/></form></div>
	              <div><a href="mypage.jsp">마이페이지</a></div>
            	</div>
            </c:if>
          </div>    
        </div>     
      </nav>
    </header>
</body>
</html>
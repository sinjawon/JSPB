<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.jsp.system.Ajax, org.json.*"%>
<%@ page import="com.jsp.dto.ReplyInfo"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/trade.css" />
    <script>
    var valueId=<%=request.getParameter("id")%>;
    var sessionUser='<%=session.getAttribute("UserNickName")%>';
</script>
<script src="/resources/postings4.js"></script>
<script defer src="/resources/reply4.js"></script>s
</head>
<body>

  <div class="trade-box">
      <div class="swiper mainslide">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img class="image" src="./img/mainbanner08_sub.jpg" alt="자유" />
          </div>
          <div class="swiper-slide">
            <img class="image" src="./img/mainbanner02.sub.jpg" alt="자랑" />
          </div>
          <div class="swiper-slide">
            <img class="image" src="./img/mainbanner06_sub.jpg" alt="산책" />
          </div>
          <div class="swiper-slide">
            <img class="image" src="./img/mainbanner07_sub.jpg" alt="정보" />
          </div>
        </div>
        
        <div class="swiper-pagination p1"></div>
      </div>
      <% session.getAttribute("UserNickName"); %>
      <div class="trade-info">
        <div class="trade_image"><img src="" alt="" /></div>
        <div class="trinfo-box">
          <div class="trainfo-nick">닉네임</div>
          <div class="trainfo-addr">주소</div>
        </div>
      </div>

      <div class="trade-des">
        <div class="trade-name">물건 이름</div>
        <div class="trade-price">가격</div>
        <div class="trade-content">물건 설명</div>
      </div>
      <div class="trade-line"></div>
    </div>
    
</body>
</html>
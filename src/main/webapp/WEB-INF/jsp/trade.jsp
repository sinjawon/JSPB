<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
<link rel="stylesheet" type="text/css" href="/resources/trade.css"> 
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  
    <script src="/resources/mainbanner.js" defer></script>
<title>petpeople</title>
</head>
<body>

<!-- 중고 거래 세부 페이지 
뭐가 더 필요한게ㅐ 있는지 
이미지 4개까지 등록 가능한데 어떻게 해야 할지 
-->

<%@include file="../jsp/nav.jsp"%>

    <div class="trade-box">
	<div class="swiper mainslide">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img class="image" src="/resources/mainbanner08_sub.jpg" alt="자유"
          />
        </div>
        <div class="swiper-slide">
          <img class="image" src="/resources/mainbanner02.sub.jpg" alt="자랑"
          />
        </div>
        <div class="swiper-slide">
          <img class="image" src="/resources/mainbanner06_sub.jpg" alt="산책"
          />
        </div>
        <div class="swiper-slide">
          <img class="image" src="/resources/mainbanner07_sub.jpg" alt="정보"
          />
        </div>
      </div>
      <div class="swiper-pagination p1"></div>
      
    </div>
    
     <div class="trade-info">
        <div class="trade_image"><img src="" alt="" /></div>
        <div class="trinfo-box">
          <div class="trainfo-nick">닉네임</div>
          <div class="trainfo-addr">주소</div>
        <div class="trinfo-box">
      </div>

      <div class="trade-des">
        <div class="trade-name">물건 이름</div>
        <div class="trade-price">가격</div>
        <div class="trade-content">물건 설명</div>
      </div>
      <div class="trade-line"></div>
    </div>
    
<%@include file="../jsp/footer.jsp"%>
</body>
</html>
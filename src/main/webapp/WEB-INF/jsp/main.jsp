<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/main.css"> 
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  
    <script src="/resources/mainbanner.js" defer></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
<div class="swiper mainslide">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href=""
            ><img class="image" src="/resources/mainbanner08_sub.jpg" alt="자유"
          /></a>
          <div class="subTitle">
            <h2>자유게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href=""
            ><img class="image" src="/resources/mainbanner02.sub.jpg" alt="자랑"
          /></a>
          <div class="subTitle">
            <h2>자랑게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href=""
            ><img class="image" src="/resources/mainbanner06_sub.jpg" alt="산책"
          /></a>
          <div class="subTitle">
            <h2>산책게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href=""
            ><img class="image" src="/resources/mainbanner07_sub.jpg" alt="정보"
          /></a>
          <div class="subTitle">
            <h2>정보게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <img class="image" src="/resources/mainbanner05_sub.jpg" alt="기타 "  />
        </div>
      </div>
      <div class="swiper-button-next next1"></div>
      <div class="swiper-button-prev prev1"></div>
      <div class="swiper-pagination p1"></div>
    </div>
    <div class="mainshop">
      <div class="main-title">애완용품거래 게시판</div>
      <div class="titleborder"></div>
      <div class="main-grid">
        <div class="mainshopbox">
          <a class="brag-a" href="#home">
            <div class="mainshopimg">
              <img src="/resources/dog1.jpg" class="main-img2" />
            </div>
            <div class="shoptitle">제목</div>
            <div class="mainprice">가격</div>
          </a>
        </div>
      </div>
    </div>

    <div class="mainpage">
      <div class="main-box">
        <div class="main-title">자유게시판</div>
        <div class="titleborder"></div>
        <div class="main-container">
          <div class="free-flex">
            <a class="free-a" href="#home">
              <div class="free-title">자유게시판 제목</div>
              <div class="free-nick">닉네임</div>
            </a>
          </div>
        </div>
      </div>

      <div class="main-box">
        <div class="main-title">산책친목게시판</div>
        <div class="titleborder"></div>
        <div class="main-container">
          <div class="free-flex">
            <a class="free-a" href="#home">
              <div class="free-title">산책친목 제목</div>
              <div class="free-nick">닉네임</div>
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- 자랑게시판 미리보기 -->
    <div class="main-brag">
      <div class="main-title">자랑 게시판</div>
      <div class="titleborder"></div>
      <div class="main-grid">
        <div class="main-img">
          <a class="brag-a" href="#home">
            <div class="brag-img">
              <img src="/resources/dog1.jpg" class="main-img3" />
            </div>
            <div>제목</div>
          </a>
        </div>
      </div>
    </div>
    
    
    
<%@include file="../jsp/footer.jsp"%>
</body>
</html>
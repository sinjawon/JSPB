 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch"%>

<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%> 
<!DOCTYPE html>
  
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="/resources/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="/resources/favicon-16x16.png"
    />
    <link rel="manifest" href="/site.webmanifest" />
    <link rel="stylesheet" type="text/css" href="/resources/board.css">
    
    <link rel="stylesheet" type="text/css" href="/resources/main.css" />

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<script defer src="/resources/boardlist.js"></script>
		<script defer src="/resources/boardlist3.js"></script>
	
    <script src="/resources/mainbanner.js" defer></script>
    <script src="/resources/modal.js" defer></script>
    <title>petpeople</title>
  </head>
  <body>
  
 
        		 
    <%@include file="../jsp/nav.jsp"%>
  
 
        		 
    <div class="swiper mainslide">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <a href="boardlist.jsp"
            ><img
              class="image"
              src="/resources/mainbanner08_sub.jpg"
              alt="자유"
          /></a>
          <div class="subTitle">
            <h2>자유게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href="boardlist2.jsp"
            ><img
              class="image"
              src="/resources/mainbanner02.sub.jpg"
              alt="자랑"
          /></a>
          <div class="subTitle">
            <h2>자랑게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href="boardlist3.jsp"
            ><img
              class="image"
              src="/resources/mainbanner06_sub.jpg"
              alt="산책"
          /></a>
          <div class="subTitle">
            <h2>산책게시판</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href="boardlist4.jsp"
            ><img
              class="image"
              src="/resources/mainbanner07_sub.jpg"
              alt="정보"
          /></a>
          <div class="subTitle">
            <h2>애완용품거래</h2>
          </div>
        </div>
        <div class="swiper-slide">
          <a href="joinmembership.jsp"	
            ><img
              class="image"
              src="/resources/mainbanner05_sub.jpg"
              alt="기타 "
          /></a>
          <div class="subTitle">
            <h2>회원가입</h2>
          </div>
        </div>
      </div>
      <div class="swiper-button-next next1"></div>
      <div class="swiper-button-prev prev1"></div>
      <div class="swiper-pagination p1"></div>
    </div>
    <div class="mainshop">
      <div class="main-title">애완용품거래</div>
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
		<div id="boards" class="boards">
		<template>
		<div class="board">
			<div class="NumBox"><a href="/app/postview.jsp?id=0" class="boardListNum">0</a></div>
			<div>
				<div class="titleBox"><a href="/app/postview.jsp?id=0" class="title">제목</a></div>
				<div class="board_contents"><a class="mainContents" style="opacity:0">본문</a></div>
			</div>
			<div class="writer"><a class="userNickname">작성자</a></div>
			<div class="hitCountBox"><a class="hitCount" style="display:none;">조회수</a></div>
			<div class="date"><a class="regDate" style="display:none;">등록일</a></div>
		</div>
		</template>
		<form id="searchform" action="/api/boardlist" method="post" style="disply:none" >
        	<select id="searches" name="searchtype">
        		<option value="all">== 선택 ==</option>
				<option value="title">제목</option>
				<option value="userNickname">작성자</option>
			</select> 
        		<input type="text" id="search" name="search">
        		<input type="text" id="page" name="page" value="1" style="display:none;"/>
        		<button type="button" onclick="submitSearch()" class="searchBtn">검색</button>
   		</form> 
	</div>
              <!-- <div class="free-title">자유게시판 제목</div>
              <div class="free-nick">닉네임</div> -->
            </a>
          </div>
        </div>
      </div>

      <div class="main-box">
        <div class="main-title">산책게시판</div>
        <div class="titleborder"></div>
        <div class="main-container">
          <div class="free-flex">
            <a class="free-a" href="#home">
              <div id="boards3" class="boards">
				<template>
					<div class="board">
						<div class="NumBox"><a href="/app/postview3.jsp?id=0" class="boardListNum3 boardListNum">0</a></div> 
						<div>
							<div class="titleBox"><a href="/app/postview3.jsp?id=0" class="title3 title">제목</a></div> 
							<div class="board_contents"><a class="mainContents3 mainContents" style="display:none;">본문</a></div>
						</div>
						<div class="writer"><a class="userNickname3 userNickname">작성자</a></div>
						<div class="hitCountBox"><a class="hitCount3 hitCount" style="display:none;">조회수</a></div> 
						<div class="date"><a class="regDate3 regDate" style="display:none;">등록일</a></div>
					</div>
				</template>
			 </div>
	
				<form id="searchform3" class="searchform" action="/api/boardList3" method="post" style="display:none">
					<select id="searches3" name="searchtype3" >
						<option value="all3">== 선택 ==</option>
						<option value="title3">제목</option>
						<option value="userNickname3">작성자</option>
					</select> 
					<input type="text" id="search3" name="search3"> 
					<input type="text" id="page3" name="page3" value="1" style="display: none;" />
					<button type="button" onclick="submitSearch3()">검색</button>
				</form>

            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- 자랑게시판 미리보기 -->
    <div class="main-brag">
      <div class="main-title">자랑게시판</div>
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



 <%--    <i class="fa-solid fa-circle-exclamation" style="color: #ff0000"></i> 
     <div type="button" class="main-note" id="open-modal">
      <i class="fa-regular fa-comments"></i>
    </div>
    <div id="modal" class="modal-content">
      <div class="modal">
        <h2>쪽지함</h2>
       
        <div class="note-reception" id="receiver">
        <div class="note-title">받은쪽지</div>
		 <% for(UserNote ReceiveNote : ReceiveNotes) { %> 
          <details>
            <summary class="summary">
              <div class="note-content">
                <div class="note-content-detail"><%=ReceiveNote.getNotetime()%></div>
                <div class="note-content-writer"><%=ReceiveNote.getSender()%></div>
              </div>
            </summary>
            <div class="note-content-div"><%=ReceiveNote.getNotecontent()%></div>
          </details>
          
		<% } %>
	
        </div>

        <div class="note-sent" id="sender">
          <div class="note-title2">보낸쪽지</div>
		<% for(UserNote ReceiveNote : ReceiveNotes) { %> 
          <details>
            <summary class="summary" >
              <div class="note-content">
                <div class="note-content-detail"><%=ReceiveNote.getNotetime()%></div>
                <div class="note-content-writer"><%=ReceiveNote.getSender()%></div>
              </div>
            </summary>
            <div class="note-content-div"><%=ReceiveNote.getNotecontent()%></div>
          </details>
          	<% } %> 
        </div>
      </div>

      <button id="close-modal"><i class="fa-solid fa-xmark fa-2x"></i></button>
    </div>

    <div class="write-go">
      <a href="insertpage.jsp">
        <i class="fa-solid fa-pen-to-square fa-2x"></i>
      </a>
    </div>
    
 --%>
 <c:if test = "${sessionScope.UserNickName==null }" >
  <div class="">
 	</div>
 </c:if>
 <c:if test = "${sessionScope.UserNickName!=null }" >
	<div style="position:fixed; bottom:4.7rem; right:3.5rem; ">
    	<div class="write-go" >
		<a href="insert.jsp" >
       		<i class="fa-solid fa-pen-to-square fa-2x"></i>
      	</a>
    </div>
 	<iframe src="./messagebox.jsp" style="position:fixed; bottom:7rem; right:-2rem; width:25rem; height:40rem; z-index: 1;">></iframe>
		
 	</div>
 </c:if>
 

    <%@include file="../jsp/footer.jsp"%>
    

  </body>
</html>

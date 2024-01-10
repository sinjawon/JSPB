<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" type="text/css" href="/resources/detail.css"> 


<title>petpeople</title>
</head>
<body>
	<%@include file="../jsp/nav.jsp"%>
		<div class="detail">
            <h3>산책게시판</h3>
            <div class="detail_board">
                <div class="detail_title">제목</div>
                <div class="detail_img"><img src="" alt=""></div>
                <div class="detail_contents"><p>글</p></div>
                <div class="detail_location">위치</div>
                <div class="detail_writer">작성자</div>
            </div>
            <div class="comment_box">
                <h4>댓글</h4>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                
                </div>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                </div>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                </div>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                </div>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                </div>
                <div class="comment_wrap">
                    <p>댓글</p>
                    <span class="comment_writer">작성자</span>
                </div>
            </div>
            <div class="writing_field">
                <input type="text" placeholder="댓글을 입력하세요">
                <button type="submit">제출</button>
            </div>
        </div>
         
          		
	<%@include file="../jsp/footer.jsp"%>
</body>
</html>
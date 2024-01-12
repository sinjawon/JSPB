<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" type="text/css" href="/resources/board.css"> 

<title>petpeople</title>
</head>
<body>
	<%@include file="../jsp/nav.jsp"%>
		<div class="main_board"> 
            <h3>자랑게시판</h3>
            <div class="main_contents">
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents"><a href="boastdetail.jsp">제목</a></div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="boastdetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
         
            </div>
            
            <c:if test = "${sessionScope.UserNickName!=null }" >
             <div class="freeboard-insert"><a href="insertpage.jsp">글쓰기</a></div>
            </c:if>
        </div>
	<%@include file="../jsp/footer.jsp"%>
</body>
</html>
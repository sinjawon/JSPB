<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/board.css"> 

<title>Insert title here</title>
</head>
<body>
	<%@include file="../jsp/nav.jsp"%>
		 <div class="main_board"> 
            <h3>자유게시판</h3>
            <div class="main_contents">
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
                        <div class="board_contents">내용</div>
                    </div>
                    <div class="writer">작성자</div>
                    <div class="date">게시일</div>
                </div>
                <div class="board">
                    <div class="board_wrap">
                        <div class="title"><a href="freedetail.jsp">제목</a></div>
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
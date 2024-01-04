<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/myreset.css" />
<link rel="stylesheet" href="/resources/mypage.css" />
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
    <div class="info_wrap">
        <div class="info">
            <div class=profile><a href="mypage.jsp">프로필</a></div>
            <div class=mydocument><a href="mydocument.jsp">내가 작성한 글</a></div>
        </div>
        <div class="userPet_info">
            <div class="user_info">
                <span>회원</span>
                <div class="info_image"><img src="" alt=""></div>
                <div class="info_box">
                    <span>닉네임</span>
                    <div></div>
                </div>
                <div class="info_box">
                    <span>이메일</span>
                    <div></div>
                </div>
            </div>
            <div class="pet_info">
                <span>반려동물</span>
                <div class="info_image"><img src="" alt=""></div>
                <div class="info_box" >
                    <span>이름</span>
                    <div> </div>
                </div>
                <div class="info_box">
                    <span>생일</span>
                    <div> </div>
                </div>
                <div class="info_box">
                    <span>성별</span>
                    <div> </div>
                </div>
                <div class="info_box">
                    <span>몸무게</span>
                    <div> </div>
                </div>
                
            </div>
        </div>
        <div class="info_menu">
            <button ><a href="#">정보 수정</a></button>
            <button>로그아웃</button>
        </div>
        <div class="withdraw"><a href="">회원탈퇴</a></div>
    </div>
    <%@include file="../jsp/footer.jsp"%>
</body>
</html>
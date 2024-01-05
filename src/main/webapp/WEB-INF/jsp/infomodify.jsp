<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/infomodify.css"> 

<title>Insert title here</title>
</head>
<body>
<%@include file="../jsp/nav.jsp"%>
	<div class="modify">
        <h2>정보수정</h2>
        <div class="info_modi">
            <div class="user_modi">
                <span class='user'>회원</span>
                <div class="modi_image"><img src="" alt=""></div>
                <input type="file" class="file">
                    <div class="modiWrap">
                        <input type="text" name="nickname" class="modiBox" placeholder="닉네임">
                        <input type="email" name="email" class="modiBox" placeholder="이메일">
                    </div>
            </div>
            <div class="pet_modi">
                <span class='pet'>반려동물</span>
                <div class="modi_image"><img src="" alt=""></div>
                <input type="file" class="file">
                <div class="modiWrap">
                        <input type="text" name="petName" class="modiBox" placeholder="이름">
                        <input type="date" name="birth" class="modiBox">
                        <div class="radioBoxWrap">
                            <div class="radioBox">
                                <input type="radio" name="sex" id="man">
                                <label for="man">수컷</label>
                            </div>
                            <div class="radioBox">
                                <input type="radio" name="sex" id="woman">
                                <label for="woman">암컷</label>
                            </div>
                            <div class="radioBox">
                                <input type="radio" name="sex" id="neu">
                                <label for="neu">중성</label>
                            </div>
                        </div>
                        <input type="text" name="weight" class="modiBox" placeholder="몸무게">
                </div>
            </div>
        </div>
    </div>
    <button class='Modi_btn' ><a href="infomodify.jsp">정보 수정</a></button>
    <div class="withdraw"><a href="">회원탈퇴</a></div>
    
<%@include file="../jsp/footer.jsp"%>
</body>
</html>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자유게시판</h1>
    <input
          type="text"
          id="userNickname"
          name="userNickname"
          placeholder="작성자"
        />
        <input
          type="text"
          id="titleInput"
          name="title"
          placeholder="제목을 입력해주세요"
        />
        <textarea
          id="postTextarea"
          name="mainContents"
          placeholder="글 내용을 입력해주세요"
        ></textarea>
        <div class="btns">
          <button type="button" onclick="submitPost()" class="insertok">
            확인
          </button>
          <button type="button" onclick="cancelPost()" class="cancelbtn">
            취소
          </button>
        </div>
      </form> 
</body>
</html>
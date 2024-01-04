"use strict";
function submitPost() {
    console.log("전송되었습니다");
    var form = document.getElementById("writeForm");
    form.submit();
}
function cancelPost() {
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다"); //확인용 메세지
    var titleInput = document.getElementById("titleInput");
    var postTextarea = document.getElementById("postTextarea");
    var userNicknameArea = document.getElementById("userNickname");
    titleInput.value = "";
    postTextarea.value = "";
    userNicknameArea.value = "";
}

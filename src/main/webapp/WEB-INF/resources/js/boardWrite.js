"use strict";

 document.addEventListener("DOMContentLoaded", function() {
            moveurl('insert.jsp');
        });
        
 function moveurl(url) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("options").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
};

function submitPost() {
    console.log("전송되었습니다");
    let form = document.getElementById("writeForm");
    form.submit();
}
function cancelPost() {
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다"); //확인용 메세지
    let titleInput = document.getElementById("titleInput");
    let postTextarea = document.getElementById("postTextarea");
    let userNicknameArea = document.getElementById("userNickname");
    titleInput.value = "";
    postTextarea.value = "";
    userNicknameArea.value = "";
}

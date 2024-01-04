"use strict";
//채울래
function fillPostData(userInfo, titleInfo, contentInfo) {
    var userNickname = document.getElementById('userNickname');
    console.log(userNickname);
    var viewTitle = document.getElementById('viewTitle');
    var viewTextarea = document.getElementById('viewTextarea');
    //바꿔 없으면 기존 거 출력됨
    if (userNickname && viewTitle && viewTextarea) {
        userNickname.innerText = "\uC791\uC131\uC790: ".concat(userInfo);
        viewTitle.innerText = "\uAE00 \uC81C\uBAA9: ".concat(titleInfo);
        viewTextarea.innerText = "\uAE00 \uB0B4\uC6A9: ".concat(contentInfo);
    }
}
//@ts-ignore
var clickedPostId = valueId; // 클릭한 게시글의 ID
function PostInfo() {
    fetch("/api/showPost?boardListNum=".concat(clickedPostId), {
        method: "GET"
    })
        .then(function (response) { return response.json(); })
        .then(function (data) {
        fillPostData(data.userNickname, data.title, data.mainContents);
    })
        .catch(function (error) {
        console.error('게시글 정보를 가져오지 못했습니다.', error);
    });
}
window.onload = function () {
    PostInfo();
};

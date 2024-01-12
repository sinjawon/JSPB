"use strict";
//@ts-ignore
let clickedPostId = valueId; // 클릭한 게시글의 ID
function editPost() {
    fetch(`/api/editPost?boardListNum=${clickedPostId}`, {
        method: "GET"
    })
        .then(response => response.json())
        .then(data => {
        fillPostData(data.userNickname, data.title, data.mainContents);
    })
        .catch(error => {
        console.error('게시글 정보를 가져오지 못했습니다.', error);
    });
}
window.onload = function () {
    editPost();
};

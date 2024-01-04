"use strict";
//채울래
function fillPostData(userInfo, titleInfo, contentInfo) {
    let userNickname = document.getElementById('userNickname');
    let viewTitle = document.getElementById('viewTitle');
    let viewTextarea = document.getElementById('viewTextarea');
    //바꿔 없으면 기존 거 출력됨
    if (userNickname && viewTitle && viewTextarea) {
        userNickname.innerText = `작성자: ${userInfo}`;
        viewTitle.innerText = `글 제목: ${titleInfo}`;
        viewTextarea.innerText = `글 내용: ${contentInfo}`;
    }
}
//가져오는 기능 누가 좀 만들어 줘
function PostInfo() {
    const clickedPostId = -1; // 클릭한 게시글의 ID (실제로는 클릭한 게시글의 정보를 가져와야 합니다.)
    fetch(`/api/showPost?boardListNum=${clickedPostId}`)
        .then(response => response.json())
        .then(data => {
        fillPostData(data.userNickname, data.title, data.mainContents);
    })
        .catch(error => {
        console.error('게시글 정보를 가져오지 못했습니다.', error);
    });
}
window.onload = function () {
    PostInfo();
};

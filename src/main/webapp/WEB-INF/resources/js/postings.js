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
//@ts-ignore
let clickedPostId = valueId; // 클릭한 게시글의 ID
function PostInfo() {
    fetch(`/api/showPost?boardListNum=${clickedPostId}`, {
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
    PostInfo();
};
function editPost(boardListNum) {
    window.location.href = `/editPost.jsp?boardListNum=${boardListNum}`;
    fetch(`/api/editPost?boardListNum=${boardListNum}`, {
        method: "GET"
    })
        .then(response => response.json())
        .then(data => {
        if (data.success) {
            console.log("게시글 수정 성공");
        }
        else {
            console.error("게시글 수정 실패:", data.message);
        }
    })
        .catch(error => {
        console.error('게시글 수정 중 오류 발생:', error);
    });
}
function deletePost(boardListNum) {
    fetch(`/api/deletePost?boardListNum=${boardListNum}`, {
        method: "POST"
    })
        .then(response => response.json())
        .then(data => {
        if (data.success) {
            console.log("게시글 삭제 성공");
        }
        else {
            console.error("게시글 삭제 실패:", data.message);
        }
    })
        .catch(error => {
        console.error('게시글 삭제 중 오류 발생:', error);
    });
}

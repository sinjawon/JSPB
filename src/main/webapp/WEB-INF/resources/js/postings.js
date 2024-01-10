"use strict";
//@ts-nocheck
//채울래
function fillPostData(userInfo, titleInfo, contentInfo) {
    let userNickname = document.getElementById('userNickname');
    console.log(userNickname);
    let viewTitle = document.getElementById('viewTitle');
    let viewTextarea = document.getElementById('viewTextarea');
    //바꿔 없으면 기존 거 출력됨
    if (userNickname && viewTitle && viewTextarea) {
        userNickname.innerText = userInfo;
        viewTitle.innerText = titleInfo;
        viewTextarea.innerText = contentInfo;
    }
}
let clickedPostId = valueId; // 클릭한 게시글의 ID
let userCheck = ""; ///ID로 작성자를 받아올 예정
function writerSearch() {
    fetch(`/api/writerSearch?boardListNum=${clickedPostId}`, {
        method: "GET"
    })
        .then(response => response.text())
        .catch(error => {
        console.error('리스폰스 됐니?', error);
    })
        .then(data => {
        userCheck = data;
        console.log(userCheck + "뜨네");
    });
}
writerSearch();
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
function editPost() {
    console.log("수정되었습니다");
    let form = document.getElementById("editForm");
    let boardListNum = document.createElement("input");
    if (form) {
        boardListNum.type = "hidden";
        boardListNum.name = "boardListNum";
        boardListNum.value = clickedPostId.toString(); // 클릭한 게시글의 ID를 문자열로
        form.appendChild(boardListNum);
        form.submit();
    }
    location.href = "/boardList.jsp";
}
function deletePost(boardListNum) {
    fetch(`/api/deletePost?boardListNum=${boardListNum}`, {
        method: "POST"
    })
        .then(response => response.json())
        .then(data => {
        if (data.success) {
            console.log("게시글 삭제 성공");
            // 삭제 성공 시 필요한 작업 수행
        }
        else {
            console.error("게시글 삭제 실패:", data.message);
        }
    })
        .catch(error => {
        console.error('게시글 삭제 중 오류 발생:', error);
        alert('게시글 삭제 중 오류 발생');
    });
    location.href = "/boardList.jsp";
}

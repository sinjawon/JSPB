"use strict";
// 데이터 전송 JSON 포장용
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
let authorId; //
let title;
let content;
let author;
let createDate;
let recommended;
//확인버튼 동작
function submitPost() {
    console.log("저장되었습니다"); //확인용 메세지
    let titleInput = document.getElementById("titleInput");
    let postTextarea = document.getElementById("postTextarea");
    let authorArea = document.getElementById("author");
    title = titleInput.value;
    content = postTextarea.value;
    author = authorArea.value;
    createDate = new Date();
    recommended = 0;
    let post = {
        "title": title, //제목
        "content": content, //내용
        "author": author, //작성자
        "createDate": createDate, //작성일
        "recommended": recommended, //추천수
    };
    // JSON 만들어서 보냄 api를 받을 예정
    ajax("/api/savePostData", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(post)
    }).then((response) => {
        console.log("글이 성공적으로 저장되었습니다:", response);
    }).catch((error) => {
        console.log("데이터 저장 중 오류가 발생했습니다:", error);
    });
}
// 게시글 삭제
function deletePost(postId) {
    ajax(`/api/deletePost/${postId}`, {
        method: "DELETE",
    }).then((response) => {
        console.log("글이 성공적으로 삭제되었습니다:", response);
    }).catch((error) => {
        console.log("데이터 삭제 중 오류가 발생했습니다:", error);
    });
}
// 게시글 수정
function updatePost() {
    // 수정 코드 작성 (로그인 상태 확인 후 수정)
    if (isLoggedIn()) {
        let titleInput = document.getElementById("titleInput");
        let postTextarea = document.getElementById("postTextarea");
        let updatedTitle = titleInput.value;
        let updatedContent = postTextarea.value;
        let newPost = {
            "newTitle": updatedTitle,
            "newContent": updatedContent,
            "author": author,
            "createDate": createDate,
            "recommended": recommended, //수정하면 추천 날아가게 해야하나?
        };
        // 수정 API
        ajax(`/api/updatePost/${authorId}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(newPost)
        }).then((response) => {
            console.log("글이 성공적으로 수정되었습니다:", response);
        }).catch((error) => {
            console.error("데이터 수정 중 오류가 발생했습니다:", error);
        });
    }
    else {
        console.log("로그인이 필요합니다.");
    }
}
// 로그인 상태
function isLoggedIn() {
    //로그인 확인용 함수자리임
    return true;
}
// 현재 글 수정용
// function editPost(postId: number) {
//     authorId = postId;
//     // postId로 DB에서 정보 불러오기
//     (postId)
//         .then((post) => {
//             if (post) {
//                 // 글 정보를 불러와서 UI에 표시하는 로직 작성
//                 let titleInput = document.getElementById('titleInput') as HTMLInputElement;
//                 let postTextarea = document.getElementById('postTextarea') as HTMLTextAreaElement;
//                 titleInput.value = post.title;
//                 postTextarea.value = post.content;
//             } else {
//                 console.log('해당 postId에 해당하는 글을 찾을 수 없습니다.');
//             }
//         })
//         .catch((error) => {
//             console.error('데이터베이스에서 글을 불러오는 중 오류가 발생했습니다:', error);
//         });
// }
function cancelPost() {
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다"); //확인용 메세지
    let titleInput = document.getElementById("titleInput");
    let postTextarea = document.getElementById("postTextarea");
    titleInput.value = "";
    postTextarea.value = "";
}
//임시 ajax
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        return fetch(url, option).then((res) => res.json());
    });
}

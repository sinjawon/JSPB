"use strict";
//@ts-nocheck
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        return fetch(url, option).then((res) => res.json());
    });
}
let form = new FormData();
ajax("/api/boardlist", {
    method: "POST",
    body: form,
}).then((json) => {
    var _a;
    console.log(json);
    let boards = document.querySelector("#boards");
    let template = document.querySelector("#boards template");
    if (template) {
        for (let data of json.data) {
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            (_a = template.content.querySelector(".boardListNum")) === null || _a === void 0 ? void 0 : _a.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
            let a = document.createElement("a");
            a.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(a);
            }
        }
    }
});
function deletePost(boardListNum) {
    fetch(`/api/deletePost?boardListNum=${boardListNum}`, {
        method: "POST"
    })
        .then(response => response.json())
        .then(data => {
        if (data.success) {
            console.log("게시글 삭제 성공");
            // 게시글 삭제 성공 시 필요한 작업 수행 (예: UI 업데이트 등)
        }
        else {
            console.error("게시글 삭제 실패:", data.message);
        }
    })
        .catch(error => {
        console.error('게시글 삭제 중 오류 발생:', error);
    });
}
//   //게시글 클릭 가능 이벤트 추가 이거 그냥 html쪽에 둘까요?
//   function showPostView(board: any) {
//     let form = document.createElement("form");
//     form.setAttribute("id", "postForm");
//     form.setAttribute("action", "/api/showPost");
//     form.setAttribute("method", "post");
//     form.style.display = "none"; // 화면에 보이지 않도록 설정
//     // 게시글 정보를 준비
//     const userNicknameInput = document.createElement("input");
//     userNicknameInput.setAttribute("userNickname" , board.userNickname);
//     const titleInput = document.createElement("input");
//     titleInput.setAttribute("title" , board.title);
//     const mainContentsInput = document.createElement("input");
//     mainContentsInput.setAttribute( "mainContents", board.mainContents);
//     // form에 담아서
//     form.appendChild(userNicknameInput);
//     form.appendChild(titleInput);
//     form.appendChild(mainContentsInput);
//     // 보낸다
//     document.body.appendChild(form);
//     form.submit();
// }
function submitSearch() {
    console.log("전송되었습니다");
    let form = document.getElementById("searchtype");
    form.submit();
}

"use strict";
// function addReply(){
//     console.log("전송되었습니다")
//     let form: HTMLFormElement = document.getElementById("replyForm") as HTMLFormElement;
//     form.submit();
// }
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
//@ts-nocheck
document.addEventListener("DOMContentLoaded", () => {
    loadReply();
    let addReplyBtn = document.getElementById("addReplyBtn");
    addReplyBtn.addEventListener("click", addReply);
});
function loadReply() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let boardListNumInput = document.getElementById("boardListNumInput");
            let boardListNum = boardListNumInput.value;
            let response = yield fetch(`/api/replylist`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Cache-Control": "no-cache"
                },
                body: JSON.stringify({ boardListNum: boardListNum })
            });
            if (!response.ok) {
                throw new Error("댓글 불러오기 실패");
            }
            let replyList = yield response.json();
            displayReply(replyList);
        }
        catch (error) {
            console.error(error);
        }
    });
}
function displayReply(replyies) {
    let replyContainer = document.getElementById("replyContainer");
    if (replyContainer) {
        replyContainer.innerHTML = replyies.replyList.map(reply => `
            <div class="comment">
                <div class="userNickname">${reply.userNickname}</div>
                <div class="replyContents">${reply.replyContents}</div>
                <div class="regDate">${reply.regDate}</div>
            </div>
        `).join("");
    }
}
function addReply() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let boardListNumInput = document.getElementById("boardListNumInput");
            let boardListNum = boardListNumInput.value;
            let userNicknameInput = document.getElementById("userNickname");
            let userNickname = userNicknameInput.value;
            let replyContentsInput = document.getElementById("replyContents");
            let replyContents = replyContentsInput.value;
            let response = yield fetch(`/api/addReply`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    boardListNum: boardListNum,
                    userNickname: userNickname,
                    replyContents: replyContents
                })
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList = yield response.json();
            if (replyList.success) {
                clearReplyInput();
                loadReply();
                location.href = '/app/postview.jsp?id=' + boardListNum;
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
function clearReplyInput() {
    let replyContentsInput = document.getElementById("replyContents");
    replyContentsInput.value = "";
}

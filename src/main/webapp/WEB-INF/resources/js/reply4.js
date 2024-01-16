"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
document.addEventListener("DOMContentLoaded", () => {
    loadReply4();
    let addReplyBtn4 = document.getElementById("addReplyBtn4");
    if (addReplyBtn4) {
        addReplyBtn4.addEventListener("click", addReply4);
    }
    document.addEventListener("click", (event) => {
        if (event.target && event.target.className == "deleteReply4") {
            let replyNum4 = parseInt(event.target.getAttribute("data-replynum") || "", 10);
            // console.log(replyNum);
            if (!isNaN(replyNum4)) {
                deleteReply4(replyNum4);
            }
        }
    });
});
function loadReply4() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let boardListNumInput4 = document.getElementById("boardListNumInput4");
            let boardListNum4 = boardListNumInput4.value;
            let formData = new FormData();
            formData.append("boardListNum4", boardListNum4);
            let response = yield fetch(`/api/replylist4?${new URLSearchParams(formData)}`, {
                method: "GET",
                headers: {
                    "Cache-Control": "no-cache",
                },
            });
            if (!response.ok) {
                throw new Error("댓글 불러오기 실패");
            }
            let replyList4 = yield response.json();
            displayReply4(replyList4);
        }
        catch (error) {
            console.error(error);
        }
    });
}
// 댓글작성자
let currentUser4 = sessionUser; // 실제 기본값으로 설정하세요
function displayReply4(replies4) {
    let replyContainer4 = document.querySelector("#replyContainer4");
    let template = document.querySelector("#replyContainer4 template");
    if (template && replyContainer4) {
        replyContainer4.innerHTML = "";
        for (let data of replies4.replyList4) {
            let clone = document.importNode(template.content, true);
            clone.querySelector(".userNickname4").innerHTML = data.userNickname4;
            clone.querySelector(".replyContents4").innerHTML = data.replyContents4;
            clone.querySelector(".regDate4").innerHTML = data.regDate4;
            if (currentUser4 === data.userNickname4) {
                // 맞다면 삭제 버튼을 활성화
                clone.querySelector(".deleteReply4").setAttribute("data-replynum", data.replyNum4.toString());
            }
            console.log(currentUser4, data.userNickname4);
            replyContainer4.appendChild(clone);
        }
    }
}
function addReply4() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let formData = new FormData(document.getElementById("replyForm4"));
            let response = yield fetch("/api/addReply4", {
                method: "POST",
                body: formData,
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList4 = yield response.json();
            if (replyList4.success) {
                clearReplyInput4();
                loadReply4();
                location.href = '/app/postview4.jsp?id=' + formData.get("boardListNum4");
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
function clearReplyInput4() {
    let replyContentsInput4 = document.getElementById("replyContents4");
    if (replyContentsInput4) {
        replyContentsInput4.value = "";
    }
}
function deleteReply4(replyNum4) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log(replyNum4);
            let response4 = yield fetch(`/api/deleteReply4?replyNum4=${replyNum4}`, {
                method: "POST",
            });
            if (!response4.ok) {
                throw new Error("댓글 삭제 실패");
            }
            let replyList4 = yield response4.json();
            if (replyList4.success) {
                console.log("댓글 삭제 성공");
                loadReply4();
                location.href = '/app/postview4.jsp?id=' + document.getElementById("boardListNumInput4").value;
            }
            else {
                console.error("댓글 삭제 실패:", replyList4.success);
            }
        }
        catch (error) {
            console.error('댓글 삭제 중 오류 발생:', error);
            alert('댓글 삭제 중 오류 발생');
        }
    });
}

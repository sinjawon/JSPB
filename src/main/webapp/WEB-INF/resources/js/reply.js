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
    loadReply();
    let addReplyBtn = document.getElementById("addReplyBtn");
    if (addReplyBtn) {
        addReplyBtn.addEventListener("click", addReply);
    }
    document.addEventListener("click", (event) => {
        if (event.target && event.target.className == "deleteReply") {
            let replyNum = parseInt(event.target.getAttribute("data-replynum") || "", 10);
            // console.log(replyNum);
            if (!isNaN(replyNum)) {
                deleteReply(replyNum);
            }
        }
    });
});
function loadReply() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let boardListNumInput = document.getElementById("boardListNumInput");
            let boardListNum = boardListNumInput.value;
            let formData = new FormData();
            formData.append("boardListNum", boardListNum);
            let response = yield fetch(`/api/replylist?${new URLSearchParams(formData)}`, {
                method: "GET",
                headers: {
                    "Cache-Control": "no-cache",
                },
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
function displayReply(replies) {
    let replyContainer = document.querySelector("#replyContainer");
    let template = document.querySelector("#replyContainer template");
    if (template && replyContainer) {
        replyContainer.innerHTML = "";
        for (let data of replies.replyList) {
            let clone = document.importNode(template.content, true);
            clone.querySelector(".userNickname").innerHTML = data.userNickname;
            clone.querySelector(".replyContents").innerHTML = data.replyContents;
            clone.querySelector(".regDate").innerHTML = data.regDate;
            clone.querySelector(".deleteReply").setAttribute("data-replynum", data.replyNum.toString());
            replyContainer.appendChild(clone);
        }
    }
}
function addReply() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let formData = new FormData(document.getElementById("replyForm"));
            let response = yield fetch("/api/addReply", {
                method: "POST",
                body: formData,
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList = yield response.json();
            if (replyList.success) {
                clearReplyInput();
                loadReply();
                location.href = '/app/postview.jsp?id=' + formData.get("boardListNum");
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
function clearReplyInput() {
    let replyContentsInput = document.getElementById("replyContents");
    if (replyContentsInput) {
        replyContentsInput.value = "";
    }
}
function deleteReply(replyNum) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log(replyNum);
            let response = yield fetch(`/api/deleteReply?replyNum=${replyNum}`, {
                method: "POST",
            });
            if (!response.ok) {
                throw new Error("댓글 삭제 실패");
            }
            let replyList = yield response.json();
            if (replyList.success) {
                console.log("댓글 삭제 성공");
                loadReply();
                location.href = '/app/postview.jsp?id=' + document.getElementById("boardListNumInput").value;
            }
            else {
                console.error("댓글 삭제 실패:", replyList.success);
            }
        }
        catch (error) {
            console.error('댓글 삭제 중 오류 발생:', error);
            alert('댓글 삭제 중 오류 발생');
        }
    });
}

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
    loadReply3();
    let addReplyBtn3 = document.getElementById("addReplyBtn3");
    if (addReplyBtn3) {
        addReplyBtn3.addEventListener("click", addReply3);
    }
    document.addEventListener("click", (event) => {
        if (event.target && event.target.className == "deleteReply3") {
            let replyNum3 = parseInt(event.target.getAttribute("data-replynum") || "", 10);
            // console.log(replyNum);
            if (!isNaN(replyNum3)) {
                deleteReply3(replyNum3);
            }
        }
    });
});
function addReply3() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let formData = new FormData(document.querySelector('#replyForm3'));
            let response = yield fetch('/api/addReply3', {
                method: 'POST',
                cache: 'no-cache',
                body: new URLSearchParams(formData).toString(),
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList3 = yield response.json();
            if (replyList3.success) {
                clearReplyInput3();
                loadReply3();
                location.href = '/app/postview3.jsp?id=' + formData.get("boardListNum3");
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
// 댓글작성자
let currentUser3 = sessionUser; // 실제 기본값으로 설정하세요
function displayReply3(replies3) {
    let replyContainer3 = document.querySelector("#replyContainer3");
    let template = document.querySelector("#replyContainer3 template");
    if (template && replyContainer3) {
        replyContainer3.innerHTML = "";
        for (let data of replies3.replyList3) {
            let clone = document.importNode(template.content, true);
            clone.querySelector(".userNickname3").innerHTML = data.userNickname3;
            clone.querySelector(".replyContents3").innerHTML = data.replyContents3;
            clone.querySelector(".regDate3").innerHTML = data.regDate3;
            if (currentUser3 === data.userNickname3) {
                // 맞다면 삭제 버튼을 활성화
                clone.querySelector(".deleteReply3").setAttribute("data-replynum", data.replyNum3.toString());
            }
            console.log(currentUser3, data.userNickname3);
            replyContainer3.appendChild(clone);
        }
    }
}
function addReply3() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let formData = new FormData(document.getElementById("replyForm3"));
            let response = yield fetch("/api/addReply3", {
                method: "POST",
                body: formData,
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList3 = yield response.json();
            if (replyList3.success) {
                clearReplyInput3();
                loadReply3();
                location.href = '/app/postview3.jsp?id=' + formData.get("boardListNum3");
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
function clearReplyInput3() {
    let replyContentsInput3 = document.getElementById("replyContents3");
    if (replyContentsInput3) {
        replyContentsInput3.value = "";
    }
}
function deleteReply3(replyNum3) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log(replyNum3);
            let response3 = yield fetch(`/api/deleteReply3?replyNum3=${replyNum3}`, {
                method: "POST",
            });
            if (!response3.ok) {
                throw new Error("댓글 삭제 실패");
            }
            let replyList3 = yield response3.json();
            if (replyList3.success) {
                console.log("댓글 삭제 성공");
                loadReply3();
                location.href = '/app/postview3.jsp?id=' + document.getElementById("boardListNumInput3").value;
            }
            else {
                console.error("댓글 삭제 실패:", replyList3.success);
            }
        }
        catch (error) {
            console.error('댓글 삭제 중 오류 발생:', error);
            alert('댓글 삭제 중 오류 발생');
        }
    });
}

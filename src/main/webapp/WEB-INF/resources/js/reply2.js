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
    loadReply2();
    let addReplyBtn2 = document.getElementById("addReplyBtn2");
    if (addReplyBtn2) {
        addReplyBtn2.addEventListener("click", addReply2);
    }
    document.addEventListener("click", (event) => {
        if (event.target && event.target.className == "deleteReply2") {
            let replyNum2 = parseInt(event.target.getAttribute("data-replynum") || "", 10);
            // console.log(replyNum);
            if (!isNaN(replyNum2)) {
                deleteReply2(replyNum2);
            }
        }
    });
});
function loadReply2() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let boardListNumInput2 = document.getElementById("boardListNumInput2");
            let boardListNum2 = boardListNumInput2.value;
            let formData = new FormData();
            formData.append("boardListNum2", boardListNum2);
            let response = yield fetch(`/api/replylist2?${new URLSearchParams(formData)}`, {
                method: "GET",
                headers: {
                    "Cache-Control": "no-cache",
                },
            });
            if (!response.ok) {
                throw new Error("댓글 불러오기 실패");
            }
            let replyList2 = yield response.json();
            displayReply2(replyList2);
        }
        catch (error) {
            console.error(error);
        }
    });
}
// 댓글작성자
let currentUser2 = sessionUser; // 실제 기본값으로 설정하세요
function displayReply2(replies2) {
    let replyContainer2 = document.querySelector("#replyContainer2");
    let template = document.querySelector("#replyContainer2 template");
    if (template && replyContainer2) {
        replyContainer2.innerHTML = "";
        for (let data of replies2.replyList2) {
            let clone = document.importNode(template.content, true);
            clone.querySelector(".userNickname2").innerHTML = data.userNickname2;
            clone.querySelector(".replyContents2").innerHTML = data.replyContents2;
            clone.querySelector(".regDate2").innerHTML = data.regDate2;
            if (currentUser2 === data.userNickname2) {
                // 맞다면 삭제 버튼을 활성화
                clone.querySelector(".deleteReply2").setAttribute("data-replynum", data.replyNum2.toString());
            }
            
            console.log(currentUser2, data.userNickname2);
            replyContainer2.appendChild(clone);
        }
    }
}
function addReply2() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let formData = new FormData(document.getElementById("replyForm2"));
            let response = yield fetch("/api/addReply2", {
                method: "POST",
                body: formData,
            });
            if (!response.ok) {
                throw new Error("댓글 등록 실패");
            }
            let replyList2 = yield response.json();
            if (replyList2.success) {
                clearReplyInput2();
                loadReply2();
                location.href = '/app/postview2.jsp?id=' + formData.get("boardListNum2");
            }
        }
        catch (error) {
            console.error("Fetch 오류:", error);
        }
    });
}
function clearReplyInput2() {
    let replyContentsInput2 = document.getElementById("replyContents2");
    if (replyContentsInput2) {
        replyContentsInput2.value = "";
    }
}
function deleteReply2(replyNum2) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            console.log(replyNum2);
            let response2 = yield fetch(`/api/deleteReply2?replyNum2=${replyNum2}`, {
                method: "POST",
            });
            if (!response2.ok) {
                throw new Error("댓글 삭제 실패");
            }
            let replyList2 = yield response2.json();
            if (replyList2.success) {
                console.log("댓글 삭제 성공");
                loadReply2();
                location.href = '/app/postview2.jsp?id=' + document.getElementById("boardListNumInput2").value;
            }
            else {
                console.error("댓글 삭제 실패:", replyList2.success);
            }
        }
        catch (error) {
            console.error('댓글 삭제 중 오류 발생:', error);
            alert('댓글 삭제 중 오류 발생');
        }
    });
}

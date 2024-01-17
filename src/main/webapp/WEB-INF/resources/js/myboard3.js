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
//@ts-nocheck
function ajax3(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("ajax 로딩 중~~~~~");
        return fetch(url, option).then((res) => res.json());
    });
}
window.onload = submitSearch3();
// 검색 폼 제출 시 호출되는 함수
function submitSearch3() {
    console.log("전송되었습니다");
    let form = document.getElementById("searchform3");
    if (form) {
        let formData = new FormData(form);
        ajax3("/api/boardList3", {
            method: "POST",
            body: formData,
        }).then((json) => {
            var _a, _b;
            console.log(json);
            let boards3 = document.querySelector("#boards3");
            let template = document.querySelector("#boards3 template");
            let pagesContainer3 = document.querySelector("#pages3");
            let pageTemplate = document.querySelector("#pages3 template");
            // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
            if (template) {
                boards3.innerHTML = "";
                for (let data of json.data) {
                    template.content.querySelector(".boardListNum3").innerHTML = data.boardListNum3;
                    (_a = template.content.querySelector(".boardListNum3")) === null || _a === void 0 ? void 0 : _a.setAttribute("href", `/app/postview3.jsp?id=${data.boardListNum3}`);
                    template.content.querySelector(".title3").innerHTML = data.title3;
                    (_b = template.content.querySelector(".title3")) === null || _b === void 0 ? void 0 : _b.setAttribute("href", `/app/postview3.jsp?id=${data.boardListNum3}`);
                    template.content.querySelector(".mainContents3").innerHTML = data.mainContents3;
                    template.content.querySelector(".userNickname3").innerHTML = data.userNickname3;
                    template.content.querySelector(".hitCount3").innerHTML = data.hitCount3;
                    template.content.querySelector(".regDate3").innerHTML = data.regDate3;
                    let a = document.createElement("div");
                    a.innerHTML = template.innerHTML;
                    if (boards3) {
                        boards3.appendChild(template);
                        boards3.appendChild(a);
                    }
                }
            }
        });
    }
}

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
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("ajax loading~~~~~");
        return fetch(url, option).then((res) => res.json());
    });
}
let form = new FormData();
ajax("/api/boardlist", {
    method: "POST",
    body: form,
}).then((json) => {
    console.log(json);
    let boards = document.querySelector("#boards");
    let template = document.querySelector("#boards template");
    if (template) {
        for (let data of json.data) {
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
            let div = document.createElement("div");
            div.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(div);
            }
        }
    }
});
// 검색 폼 제출 시 호출되는 함수
function submitSearch() {
    console.log("전송되었습니다");
    // 검색 폼 가져오기
    const form = document.getElementById("searchtype");
    if (form) {
        // FormData 객체 생성
        const formData = new FormData(form);
        // AJAX를 통해 서버로 검색 요청 보내기
        ajax("/api/searchBoard", {
            method: "POST",
            body: formData,
        }).then((json) => {
            console.log(json);
            // 검색 결과를 가지고 동적으로 화면 업데이트 등의 동작 수행
            // 예를 들어, 검색 결과를 화면에 표시하는 등의 작업 수행
            updateSearchResults(json);
        });
    }
}
// 검색 결과를 화면에 표시하는 함수
function updateSearchResults(json) {
    const boards = document.querySelector("#boards");
    const template = document.querySelector("#boards template");
    // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
    if (boards && template) {
        boards.innerHTML = ""; // 기존 목록 비우기
        for (const data of json.data) {
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
            let div = document.createElement("div");
            div.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(div);
            }
        }
    }
}

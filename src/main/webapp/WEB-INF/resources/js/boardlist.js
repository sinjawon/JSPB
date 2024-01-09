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
        console.log("ajax 로딩 중~~~~~");
        return fetch(url, option).then((res) => res.json());
    });
}
// 처음 전체 보드리스트 출력 
ajax("/api/boardlist", {
    method: "POST",
    body: new FormData(document.getElementById("searchtype")),
}).then((json) => {
    var _a, _b, _c, _d;
    console.log(json);
    let boards = document.querySelector("#boards");
    let template = document.querySelector("#boards template");
    if (template) {
        for (let data of json.data) {
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            (_a = template.content.querySelector(".boardListNum")) === null || _a === void 0 ? void 0 : _a.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
            template.content.querySelector(".title").innerHTML = data.title;
            (_b = template.content.querySelector(".title")) === null || _b === void 0 ? void 0 : _b.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
            //수정 버튼 클릭하면 쿼리문에 글 id 가져와서 이동함
            template.content.querySelector(".editPost").innerHTML = "수정";
            (_c = template.content.querySelector(".editPost")) === null || _c === void 0 ? void 0 : _c.setAttribute("href", `/editPost.jsp?id=${data.boardListNum}`);
            //삭제 버튼 
            template.content.querySelector(".deletePost").innerHTML = "삭제";
            (_d = template.content.querySelector(".deletePost")) === null || _d === void 0 ? void 0 : _d.setAttribute("onclick", `deletePost(${data.boardListNum})`);
            let a = document.createElement("a");
            // let span: HTMLElement | null = document.createElement("span");
            a.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(a);
            }
        }
    }
});
// 검색 폼 제출 시 호출되는 함수
function submitSearch() {
    console.log("전송되었습니다");
    // 검색 폼 가져오기
    let form = document.getElementById("searchtype");
    if (form) {
        let formData = new FormData(form);
        ajax("/api/boardlist", {
            method: "POST",
            body: formData,
        }).then((json) => {
            console.log(json);
            let boards = document.querySelector("#boards");
            let template = document.querySelector("#boards template");
            // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
            if (template) {
                boards.innerHTML = "";
                // JSON 데이터를 이용하여 동적으로 HTML 생성
                for (let data of json.data) {
                    // 새로운 div 생성
                    let a = document.createElement("div");
                    // template 내용을 복제하여 div에 추가
                    let clone = document.importNode(template.content, true);
                    a.appendChild(clone);
                    // 동적으로 생성된 div에 데이터 추가
                    a.querySelector(".boardListNum").innerHTML = data.boardListNum;
                    a.querySelector(".title").innerHTML = data.title;
                    a.querySelector(".userNickname").innerHTML = data.userNickname;
                    a.querySelector(".hitCount").innerHTML = data.hitCount;
                    a.querySelector(".regDate").innerHTML = data.regDate;
                    // div를 #boards 아래에 추가
                    boards.appendChild(template);
                    boards.appendChild(a);
                }
            }
        });
    }
}
// 페이지 링크 동기화 안되었음 일단 클릭하면 이동은 가능함
function pageChange(page) {
    document.querySelector("#searchtype #page").value = page;
    submitSearch();
}
// 삭제
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
    });
}

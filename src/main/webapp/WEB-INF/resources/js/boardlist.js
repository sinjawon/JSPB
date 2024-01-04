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
function submitSearch() {
    console.log("전송되었습니다");
    var form = document.getElementById("searchtype");
    form.submit();
}

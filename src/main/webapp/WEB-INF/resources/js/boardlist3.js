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
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
//@ts-nocheck
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            console.log("ajax loading~~~~~");
            return [2 /*return*/, fetch(url, option).then(function (res) { return res.json(); })];
        });
    });
}
var form = new FormData();
ajax("/api/boardlist", {
    method: "POST",
    body: form,
}).then(function (json) {
    var _a;
    console.log(json);
    var boards = document.querySelector("#boards");
    var template = document.querySelector("#boards template");
    if (template) {
        for (var _i = 0, _b = json.data; _i < _b.length; _i++) {
            var data = _b[_i];
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            (_a = template.content.querySelector(".boardListNum")) === null || _a === void 0 ? void 0 : _a.setAttribute("href", "/postView.jsp?id=".concat(data.boardListNum));
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
            var a = document.createElement("a");
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
    var form = document.getElementById("searchtype");
    if (form) {
        var formData = new FormData(form);
        ajax("/api/boardlist", {
            method: "POST",
            body: formData,
        }).then(function (json) {
            var _a;
            console.log(json);
            var boards = document.querySelector("#boards");
            var template = document.querySelector("#boards template");
            // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
            if (template) {
                boards.innerHTML = "";
                // JSON 데이터를 이용하여 동적으로 HTML 생성
                for (var _i = 0, _b = json.data; _i < _b.length; _i++) {
                    var data = _b[_i];
                    // 새로운 div 생성
                    var a = document.createElement("div");
                    // template 내용을 복제하여 div에 추가
                    var clone = document.importNode(template.content, true);
                    a.appendChild(clone);
                    // 동적으로 생성된 div에 데이터 추가
                    a.querySelector(".boardListNum").innerHTML = data.boardListNum;
                    (_a = a.querySelector(".boardListNum")) === null || _a === void 0 ? void 0 : _a.setAttribute("href", "/postView.jsp?id=".concat(data.boardListNum));
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

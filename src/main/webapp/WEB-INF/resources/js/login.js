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
console.log("적용했다");
alert("나옴");
let userIdsArray;
let userNicknamesArray;
function loginajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        return fetch(url, option).then((res) => res.json());
    });
}
let form = new FormData();
console.log("만들었다");
loginajax("http://localhost:8080/api/select/checkapi.jsp", {
    method: "POST",
    body: form,
}).then((json) => {
    console.log(json);
    userIdsArray = json.userids.map(item => item.userid);
    userNicknamesArray = json.userNicknames.map(item => item.userNickName);
});
console.log(userNicknamesArray);
console.log(userIdsArray);
function logincheckID() {
    return __awaiter(this, void 0, void 0, function* () {
        let inputForUserId = document.querySelector('input[name="userid"]').value;
        let checkID = userIdsArray.find(lang => lang === inputForUserId);
        if (checkID) {
            alert("중복이 있습니다");
        }
        else {
            alert("사용가능한 이이디입니다");
        }
    });
}
function logincheckName() {
    return __awaiter(this, void 0, void 0, function* () {
        let inputForUserNickname = document.querySelector('input[name="userNickname"]').value;
        let checkNick = userNicknamesArray.find(lang => lang === inputForUserNickname);
        if (checkNick) {
            alert("중복이 있습니다");
        }
        else {
            alert("사용가능한 이이디입니다");
        }
    });
}

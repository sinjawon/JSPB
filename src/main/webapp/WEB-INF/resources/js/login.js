"use strict";
//@ts-nocheck
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
//가입 체크를 위한 변수 
let IdTrue = false;
let NinameTrue = false;
let PwTrue = false;
//기본 패치 아작스 함수
let form = new FormData();
function loginajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        return fetch(url, option).then((res) => res.json());
    });
}
//아이디 중복확인
function logincheckID() {
    return __awaiter(this, void 0, void 0, function* () {
        yield loginajax("http://localhost:8080/api/select/checkapi.jsp", {
            method: "POST",
            body: form,
        }).then((json) => {
            let userIdsArray = json.userids.map(data => data.userId);
            let inputForUserId = document.querySelector("input[name='userid']").value;
            let checkID = userIdsArray.find(lang => lang === inputForUserId);
            if (checkID !== undefined) {
                alert("동일한 아이디가 있습니다");
            }
            else {
                alert("사용가능한 이이디입니다");
                IdTrue = ture;
            }
        });
    });
}
//닉네임중복 확인
function logincheckName() {
    return __awaiter(this, void 0, void 0, function* () {
        yield loginajax("http://localhost:8080/api/select/checkapi.jsp", {
            method: "POST",
            body: form,
        }).then((json) => {
            let userNicknamesArray = json.userNicknames.map(data => data.userNickName);
            let inputForUserNickname = document.querySelector("input[name='nickname']").value;
            let checkID = userNicknamesArray.find(lang => lang === inputForUserNickname);
            if (checkID !== undefined) {
                alert("동일한 닉네임이  있습니다");
            }
            else {
                alert("사용가능한 닉네임입니다");
                NinameTrue = true;
            }
        });
    });
}
// 비밀번호 일치 여부 확인

function checkPasswordMatch() {
    let password = document.getElementById('password').value;
    let  confirmPassword = document.getElementById('passwordcheck').value;
    let passwordMatchStatus = document.getElementById('passwordMatchStatus');
    if(password && confirmPassword){
    if (password === confirmPassword) {
        passwordMatchStatus.innerText = '비밀번호 일치';
        passwordMatchStatus.style.color = 'green';
        document.getElementById('signupButton').disabled = false;
    }
    else {
        passwordMatchStatus.innerText = '비밀번호 불일치';
        passwordMatchStatus.style.color = 'red';
        document.getElementById('signupButton').disabled = true;
    }
}
}


document.getElementById('password').addEventListener('input', checkPasswordMatch);
document.getElementById('passwordcheck').addEventListener('input', checkPasswordMatch);

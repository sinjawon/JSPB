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
function messgeajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        console.log("이게뭐야1");
        return fetch(url, option).then((res) => res.json());
    });
}
//  async function sendAjax(notenum: String) {
//   let Sendform:FormData = document.querySelector(`#sendform${notenum}`); 
//   let formData = new FormData(Sendform);
//   let jsonData = {
//     seenum: formData.get("seenum"),
//     notenum: formData.get("notenum"),
//     // 다른 필드들 추가
//   };
//   await messgeajax("/Deletmessage/Send", {  
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json"
//     },
//     body: JSON.stringify(jsonData),
//   });
// }
// async function RecieveAjax(notenum: String) {
//   let Sendform:FormData = document.querySelector(`#sendform${notenum}`); 
//   let formData = new FormData(Sendform);
//   let jsonData = {
//     seenum: formData.get("seenum"),
//     notenum: formData.get("notenum"),
//     // 다른 필드들 추가
//   };
//   await messgeajax("/Deletmessage/Recieve", {  
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json"
//     },
//     body: JSON.stringify(jsonData),
//   });
// }
function messgedelet(notenum, endpoint) {
    return __awaiter(this, void 0, void 0, function* () {
        let Sendform = document.querySelector(`#${endpoint}form${notenum}`);
        console.log(Sendform);
        let formData = new FormData(Sendform);
        let jsonData = {
            seenum: formData.get("seenum"),
            notenum: formData.get("notenum"),
            // 다른 필드들 추가
        };
        yield messgeajax(`/Deletmessage/${endpoint}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(jsonData),
        });
    });
}
function messgedeletAll(endpoint) {
    return __awaiter(this, void 0, void 0, function* () {
        let Sendform = document.querySelector(`#${endpoint}form`);
        let formData = new FormData(Sendform);
        let jsonData = {
            seenums: formData.get("seenums"),
            notenums: formData.get("notenums"),
            // 다른 필드들 추가
        };
        yield messgeajax(`/Deletmessage/${endpoint}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(jsonData),
        });
    });
}
function sendDelet(notenum) {
    return __awaiter(this, void 0, void 0, function* () {
        let summaryElement = document.querySelector(`#sendsum${notenum}`);
        summaryElement.style.display = 'none';
        yield messgedelet(notenum, "send");
    });
}
function recieveDelet(notenum) {
    return __awaiter(this, void 0, void 0, function* () {
        let summaryElement = document.querySelector(`#receivesum${notenum}`);
        summaryElement.style.display = 'none';
        yield messgedelet(notenum, "recieve");
    });
}
function sendDeletAll(notenumString) {
    return __awaiter(this, void 0, void 0, function* () {
        let notenumArray = JSON.parse(notenumString);
        // 배열의 각 원소에 대해 반복
        for (let i = 0; i < notenumArray.length; i++) {
            let currentNotenum = notenumArray[i];
            // 작업 수행
            let summaryElement = document.querySelector(`#sendsum${currentNotenum}`);
            if (summaryElement) {
                summaryElement.style.display = 'none';
            }
        }
        yield messgedeletAll("sendAll");
    });
}
function recieveDeletAll(notenumString) {
    return __awaiter(this, void 0, void 0, function* () {
        let notenumArray = JSON.parse(notenumString);
        // 배열의 각 원소에 대해 반복
        for (let i = 0; i < notenumArray.length; i++) {
            let currentNotenum = notenumArray[i];
            // 작업 수행
            let summaryElement = document.querySelector(`#receivesum${currentNotenum}`);
            if (summaryElement) {
                summaryElement.style.display = 'none';
            }
        }
        yield messgedeletAll("receiveAll");
    });
}

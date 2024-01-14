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
        return fetch(url, option).then((res) => res.json());
    });
}
function SendAjax(notenum) {
    return __awaiter(this, void 0, void 0, function* () {
        let Sendform = document.querySelector(`#sendform${notenum}`);
        messgeajax("/Deletmessage/Send", {
            method: "POST",
            body: Sendform,
        });
    });
}
function snedDelet(notenum) {
    event.preventDefault();
    SendAjax(notenum);
    let summaryElement = document.querySelector(`#sendsum${notenum}`);
    summaryElement.style.display = 'none';
}

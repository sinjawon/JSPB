"use strict";
//  변경점
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
// 데이터 전송 포장용
class Post {
    constructor(title, content) {
        this.title = title;
        this.content = content;
    }
}
//확인버튼 동작
function submitPost() {
    console.log("저장되었습니다"); //확인용 메세지
    let titleInput = document.getElementById('titleInput');
    let postTextarea = document.getElementById('postTextarea');
    let title = titleInput.value;
    let content = postTextarea.value;
    let newPost = new Post(title, content);
    // JSON 만들어서 보냄 api  받을 예정
    ajax('/api/savePostData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(newPost)
    }).then((response) => {
        console.log('글이 성공적으로 저장되었습니다:', response);
    }).catch((error) => {
        console.error('데이터 저장 중 오류가 발생했습니다:', error);
    });
}
function cancelPost() {
    // 작성된 내용 초기화 
    console.log("삭제되었습니다"); //확인용 메세지
    let titleInput = document.getElementById('titleInput');
    let postTextarea = document.getElementById('postTextarea');
    titleInput.value = "";
    postTextarea.value = "";
}
//임시 ajax
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function* () {
        return fetch(url, option).then((res) => res.json());
    });
}

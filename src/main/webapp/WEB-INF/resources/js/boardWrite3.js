"use strict";
function submitPost3() {
    console.log("전송되었습니다");
    let form = document.getElementById("writeForm3");
    form.submit();
}
function cancelPost3() {
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다"); //확인용 메세지
    let titleInput3 = document.getElementById("titleInput3");
    let postTextarea3 = document.getElementById("postTextarea3");
    titleInput3.value = "";
    postTextarea3.value = "";
    dropzone.removeAllFiles();
}
//@ts-ignore
Dropzone.autoDiscover = false;
//@ts-ignore
var dropzone = new Dropzone("div.dropzone", {
    url: "/api/image/upload3",
    method: "POST",
    dictDefaultMessage: "여기에 사진을 드래그&드랍 하세요.",
    autoQueue: false,
    maxFiles: 1,
    maxFilesize: 100,
    paramName: 'boardImage',
    timeout: 1000 * 60 * 3,
    acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
    init: function () {
        let zone = this;
        let button = document.querySelector("button#submit");
        button.addEventListener("click", () => {
            //@ts-ignore
            zone.enqueueFiles(zone.getFilesWithStatus(Dropzone.ADDED));
            submitPost3();
        });
        //@ts-ignore
        this.on('sending', (file, xhr, data) => {
            let date = new Date(Date.now());
            data.append("username", "name");
            data.append("year", date.getFullYear());
            data.append("month", date.getMonth() + 1);
            data.append("day", date.getDate());
        });
    }
});

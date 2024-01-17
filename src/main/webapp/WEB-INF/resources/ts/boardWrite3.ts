//@ts-nocheck
document.addEventListener("DOMContentLoaded", function() {
    moveurl('insert.jsp');
});

function moveurl(url) {
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
if (this.readyState == 4 && this.status == 200) {
    document.getElementById("options").innerHTML = this.responseText;
}
};
xhttp.open("GET", url, true);
xhttp.send();
};

function submitPost(){
    console.log("전송되었습니다")

    let form: HTMLFormElement = document.getElementById("writeForm3") as HTMLFormElement;
    form.submit();

}

function cancelPost3() {
    
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다");//확인용 메세지
    
    let titleInput3 = document.getElementById("titleInput3") as HTMLInputElement;
    let postTextarea3 = document.getElementById("postTextarea3") as HTMLTextAreaElement;
    
    titleInput3.value = "";
    postTextarea3.value = "";
}

//@ts-ignore
Dropzone.autoDiscover=false;
//@ts-ignore
var dropzone = new Dropzone("div.dropzone", { 
    url: "/api/image/upload",
    method: "POST",
    dictDefaultMessage:"여기에 사진을 드래그&드랍 하세요.",
    autoQueue: false, 
    maxFiles: 10,
    maxFilesize: 100,
    paramName: 'boardImage',
    timeout: 1000 * 60 * 3,
    acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
    init:function(){
        let zone = this;
        let button:HTMLElement = document.querySelector("button#submit") as HTMLElement;
        button.addEventListener("click",()=>{
            //@ts-ignore
            zone.enqueueFiles(zone.getFilesWithStatus(Dropzone.ADDED));
            submitPost();
        });
        //@ts-ignore
        this.on('sending',(file,xhr,data)=>{
            let date = new Date(Date.now());
            data.append("username","name");
            data.append("year",date.getFullYear());
            data.append("month",date.getMonth() + 1);
            data.append("day",date.getDate());
        });
    }
});


function submitPost(): void {
    let form: HTMLFormElement = document.getElementById("writeForm") as HTMLFormElement;
    form.submit();
}

function cancelPost() {
    
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다");//확인용 메세지

    let titleInput = document.getElementById("titleInput") as HTMLInputElement;
    let postTextarea = document.getElementById("postTextarea") as HTMLTextAreaElement;
    let userNicknameArea = document.getElementById("userNickname") as HTMLInputElement;

    
    titleInput.value = "";
    postTextarea.value = "";
    userNicknameArea.value = "";
}
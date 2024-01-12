function addReply(){
    console.log("전송되었습니다")
    let form: HTMLFormElement = document.getElementById("replyForm") as HTMLFormElement;
    form.submit();
}
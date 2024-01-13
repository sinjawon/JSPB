//@ts-nocheck


//채울래
function fillPostData(userInfo: string, titleInfo: string, contentInfo: string) {
    let userNickname = document.getElementById('userNickname');
    console.log(userNickname);
    let viewTitle = document.getElementById('viewTitle');
    let viewTextarea = document.getElementById('viewTextarea');

    //바꿔 없으면 기존 거 출력됨
    if (userNickname && viewTitle && viewTextarea) {
        userNickname.innerText =  userInfo;
        viewTitle.innerText = titleInfo;
        viewTextarea.innerText =contentInfo;
    }
}
//@ts-ignore
let clickedPostId = valueId;// 클릭한 게시글의 ID

function PostInfo() {
    fetch(`/api/showPost?boardListNum=${clickedPostId}`,{
    method: "GET"  
})
    .then(response => response.json())
        .then(data => {
            fillPostData(data.userNickname, data.title, data.mainContents);
        })
        .catch(error => {
            console.error('게시글 정보를 가져오지 못했습니다.', error);
        });
}
window.onload = function() {
    PostInfo();
};



function editPost() {
    console.log("수정되었습니다");
    let form: HTMLFormElement | null = document.getElementById("editForm") as HTMLFormElement | null;
    let boardListNum: HTMLInputElement | null = document.createElement("input") as HTMLInputElement | null;

    if (form) {
        boardListNum.type = "hidden";
        boardListNum.name = "boardListNum";
        boardListNum.value = clickedPostId.toString(); // 클릭한 게시글의 ID를 문자열로

        form.appendChild(boardListNum);
        form.submit();
    }
}





// function deletePost(boardListNum: number) {
//     fetch(`/api/deletePost?boardListNum=${boardListNum}`, {
//         method: "POST"
//     })
//         .then(response => response.json())
//         .then(data => {
//             if (data.success) {
//                 console.log("게시글 삭제 성공");
//             } else {
//                 console.error("게시글 삭제 실패:", data.message);
//             }
//         })
//         .catch(error => {
//             console.error('게시글 삭제 중 오류 발생:', error);
//         });
// }
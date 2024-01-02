
// 데이터 전송 JSON 포장용

let authorId:number;//
let title:String;
let content:String;
let author:String;
let createDate:Date;
let recommended:number;





//확인버튼 동작
function submitPost() {
    console.log("저장되었습니다");//확인용 메세지
    let titleInput = document.getElementById("titleInput") as HTMLInputElement;
    let postTextarea = document.getElementById("postTextarea") as HTMLTextAreaElement;
    let authorArea = document.getElementById("author") as HTMLInputElement;
 
  
  
    title = titleInput.value;
    content = postTextarea.value;
    author = authorArea.value;
    createDate = new Date();
    recommended = 0;
    

let post = {
    "title" : title,                     //제목
    "content" : content,                 //내용
    "author" : author,                   //작성자
    "createDate" : createDate,           //작성일
    "recommended" : recommended,         //추천수
}

 
    // JSON 만들어서 보냄 api를 받을 예정
    ajax("/api/savePostData", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(post)
    }).then((response) => {
        console.log("글이 성공적으로 저장되었습니다:", response);
        
    }).catch((error) => {
        console.log("데이터 저장 중 오류가 발생했습니다:", error);
        
    });
}

// 게시글 삭제
function deletePost(postId: number) {//글 id
    ajax(`/api/deletePost/${postId}`, {
        method: "DELETE",
    }).then((response) => {
        console.log("글이 성공적으로 삭제되었습니다:", response);
    }).catch((error) => {
        console.log("데이터 삭제 중 오류가 발생했습니다:", error);
    });
}




// 게시글 수정
function updatePost() {
    // 로그인 상태 확인
    if (isLoggedIn()) {

            let titleInput = document.getElementById("titleInput") as HTMLInputElement;
            let postTextarea = document.getElementById("postTextarea") as HTMLTextAreaElement;
            
            let updatedTitle = titleInput.value;
            let updatedContent = postTextarea.value;


            let newPost = {
                "newTitle" : updatedTitle,
                "newContent" : updatedContent,
                "author" : author,
                "createDate" : createDate,
                "recommended" : recommended,//수정하면 추천 날아가게 해야하나?
            }

            // 수정 API
            ajax(`/api/updatePost/${authorId}`, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(newPost)
            }).then((response) => {
                console.log("글이 성공적으로 수정되었습니다:", response);
            }).catch((error) => {
                console.error("데이터 수정 중 오류가 발생했습니다:", error);
            });
        }
     else {
        console.log("로그인이 필요합니다.");
    }
}

// 로그인 상태
function isLoggedIn(): boolean {
    //로그인 확인용 함수자리임
    return true;  
}





function cancelPost() {
    
    // 글쓰기 창에서 작성된 내용 초기화 
    console.log("삭제되었습니다");//확인용 메세지

    let titleInput = document.getElementById("titleInput") as HTMLInputElement;
    let postTextarea = document.getElementById("postTextarea") as HTMLTextAreaElement;
    
    titleInput.value = "";
    postTextarea.value = "";
}


//임시 ajax
async function ajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
}
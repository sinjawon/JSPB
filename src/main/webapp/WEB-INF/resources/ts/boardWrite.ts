
//  변경점

class Post {
    constructor(public title: string, public content: string) {}
}


//확인버튼 동작
function submitPost() {
    let titleInput = document.getElementById('titleInput') as HTMLInputElement;
    let postTextarea = document.getElementById('contentTextarea') as HTMLTextAreaElement;

    let title = titleInput.value;
    let content = postTextarea.value;

    let newPost = new Post(title, content);
    console.log("저장되었습니다")
    
    // JSON 만들어서 보냄
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
    let titleInput = document.getElementById('titleInput') as HTMLInputElement;
    let contentTextarea = document.getElementById('contentTextarea') as HTMLTextAreaElement;
    
    titleInput.value = '';
    contentTextarea.value = '';
}


//임시 ajax
async function ajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
}

//@ts-nocheck

document.addEventListener("DOMContentLoaded", () => {
    // 페이지 로딩 시 댓글 목록을 불러오는 함수 호출
    loadReply();

    // 댓글 등록 버튼 클릭 시
    const addReplyBtn = document.getElementById("addReplyBtn");
    addReplyBtn.addEventListener("click", () => {
        addReply();
    });
});

function loadReply() {
    // 현재 게시글의 ID를 가져옴
    const boardListNumInput = document.getElementById("boardListNumInput") as HTMLInputElement;
    const boardListNum = boardListNumInput.value;

    // Fetch API를 사용하여 댓글 목록을 서버에서 비동기적으로 불러옴
    fetch("/api/replylist", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Cache-Control": "no-cache" // 이 부분을 추가
        },
        body: `boardListNum=${encodeURIComponent(boardListNum)}`
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("댓글 불러오기 실패");
        }
        return response.json();
    })
    .then(replyList => {
        console.log(replyList); // 서버 응답 확인
        // 댓글 목록을 받아와서 화면에 표시하는 함수 호출
        displayReply(replyList);
    })
    .catch(error => {
        console.log(error);
    });
}

function displayReply(replyies: { replyList: any[] }) {

    // 댓글 목록을 돌면서 화면에 표시하는 코드 작성
    for (let i = 0; i < replyies.replyList.length; i++) {
        const reply = replyies.replyList[i];
        const replyHtml = `<div class="comment">
                              <div class="userNickname">${reply.userNickname}</div>
                              <div class="replyContents">${reply.replyContents}</div>
                              <div class="regDate">${reply.regDate}</div>
                            </div>`;

        // 화면에 댓글 추가
        const replyContainer = document.getElementById("replyContainer");
        if (replyContainer) {
            replyContainer.innerHTML += replyHtml;
        }
    }
}


function addReply() {
    // 댓글 등록 시 사용자 입력 값을 가져와서 서버로 전송
    const boardListNumInput = document.getElementById("boardListNumInput") as HTMLInputElement;
    const boardListNum = boardListNumInput.value;

    const userNicknameInput = document.getElementById("userNickname") as HTMLInputElement;
    const userNickname = userNicknameInput.value;

    const replyContentsInput = document.getElementById("replyContents") as HTMLTextAreaElement;
    const replyContents = replyContentsInput.value;

    // Fetch API를 사용하여 댓글을 서버에 등록
    fetch("/api/addReply", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `boardListNum=${encodeURIComponent(boardListNum)}&` +
              `userNickname=${encodeURIComponent(userNickname)}&` +
              `replyContents=${encodeURIComponent(replyContents)}`
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("댓글 등록 실패");
        }
    
        // 응답 형식이 JSON인지 확인
        const contentType = response.headers.get('content-type');
        if (contentType && contentType.includes('application/json')) {
            return response.json();
        } else {
            // JSON이 아니라면 적절히 처리 (여기서는 HTML 응답을 로그로 출력)
            console.log("Non-JSON response:", response);
            return { success: false, message: "JSON이 아닌 응답을 받았습니다" };
        }
    })
    .then(replyList => {
        console.log(replyList); // 서버 응답 확인
    
        // 댓글 등록 성공 시, 댓글 입력 창 비우기
        if (replyList.success) {
          
            loadReply(); // 댓글 목록을 다시 불러오기
    
            // 페이지를 원하는 URL로 리디렉션
            window.location.href = '/app/postview.jsp?id=' + boardListNum;
        }
    })
    .catch(error => {
        // 예외 처리
        console.error("Fetch 오류:", error);
    });
}




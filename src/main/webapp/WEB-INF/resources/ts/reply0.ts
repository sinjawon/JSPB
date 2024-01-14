// function addReply(){
//     console.log("전송되었습니다")
//     let form: HTMLFormElement = document.getElementById("replyForm") as HTMLFormElement;
//     form.submit();
// }

//@ts-nocheck

document.addEventListener("DOMContentLoaded", () => {
    loadReply();

    let addReplyBtn = document.getElementById("addReplyBtn");
    addReplyBtn.addEventListener("click", addReply);
});

async function loadReply(): Promise<void> {
    try {
        let boardListNumInput = document.getElementById("boardListNumInput") as HTMLInputElement;
        let boardListNum = boardListNumInput.value;

        let response = await fetch(`/api/replylist`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Cache-Control": "no-cache"
            },
            body: JSON.stringify({ boardListNum: boardListNum })
        });

        if (!response.ok) {
            throw new Error("댓글 불러오기 실패");
        }

        let replyList = await response.json();
        displayReply(replyList);
    } catch (error) {
        console.error(error);
    }
}

function displayReply(replyies: { replyList: any[] }): void {
    let replyContainer = document.getElementById("replyContainer");

    if (replyContainer) {
        replyContainer.innerHTML = replyies.replyList.map(reply => `
            <div class="comment">
                <div class="userNickname">${reply.userNickname}</div>
                <div class="replyContents">${reply.replyContents}</div>
                <div class="regDate">${reply.regDate}</div>
            </div>
        `).join("");
    }
}

async function addReply(): Promise<void> {
    try {
        let boardListNumInput = document.getElementById("boardListNumInput") as HTMLInputElement;
        let boardListNum = boardListNumInput.value;

        let userNicknameInput = document.getElementById("userNickname") as HTMLInputElement;
        let userNickname = userNicknameInput.value;

        let replyContentsInput = document.getElementById("replyContents") as HTMLTextAreaElement;
        let replyContents = replyContentsInput.value;

        let response = await fetch(`/api/addReply`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                boardListNum: boardListNum,
                userNickname: userNickname,
                replyContents: replyContents
            })
        });

        if (!response.ok) {
            throw new Error("댓글 등록 실패");
        }

        let replyList = await response.json();

        if (replyList.success) {
            clearReplyInput();
            loadReply();
            location.href = '/app/postview.jsp?id=' + boardListNum;
        }
    } catch (error) {
        console.error("Fetch 오류:", error);
    }
}

function clearReplyInput(): void {
    let replyContentsInput = document.getElementById("replyContents") as HTMLTextAreaElement;
    replyContentsInput.value = "";
}

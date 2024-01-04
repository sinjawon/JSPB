
async function ajax(url: string, option?: any) {
    console.log("ajax loading~~~~~")
      return fetch(url, option).then((res) => res.json());
    }  
  
    let form: FormData = new FormData();
  
  ajax("/api/boardlist", {
      method: "POST",
      body: form,
  }).then((json) => {
    console.log(json);
    let boards: HTMLElement | null = document.querySelector("#boards");
    let template: HTMLTemplateElement | null = document.querySelector("#boards template");
    if (template) {
      for (let data of json.data) {
        let div: HTMLElement | null = document.createElement("div");
            div.classList.add("board-card");
            div.innerHTML = `
                <div class="boardListNum">${data.boardListNum}</div>
                <div class="title">${data.title}</div>
                <div class="userNickname">${data.userNickname}</div>
                <div class="hitCount">${data.hitCount}</div>
                <div class="regDate">${data.regDate}</div>
            `;
            // 클릭 이벤트 추가
            div.addEventListener("click", () => {
              console.log("클릭!");
            });
        if (boards) {
          boards.appendChild(div);
        }
      }
    }
  });


  //게시글 클릭 가능 이벤트 추가 이거 그냥 html쪽에 둘까요?
  function showPostView(board: any) {
    let form = document.createElement("form");
    form.setAttribute("id", "postForm");
    form.setAttribute("action", "/api/showPost");
    form.setAttribute("method", "post");
    form.style.display = "none"; // 화면에 보이지 않도록 설정

    // 게시글 정보를 준비
    const userNicknameInput = document.createElement("input");
    userNicknameInput.setAttribute("userNickname" , board.userNickname);

    const titleInput = document.createElement("input");
    titleInput.setAttribute("title" , board.title);

    const mainContentsInput = document.createElement("input");
    mainContentsInput.setAttribute( "mainContents", board.mainContents);

    // form에 담아서
    form.appendChild(userNicknameInput);
    form.appendChild(titleInput);
    form.appendChild(mainContentsInput);

    // 보낸다
    document.body.appendChild(form);
    form.submit();
}
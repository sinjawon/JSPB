
//@ts-nocheck

async function ajax(url: string, option?: any) {
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
        template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
        template.content.querySelector(".boardListNum")?.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
        template.content.querySelector(".title").innerHTML = data.title;
        template.content.querySelector(".userNickname").innerHTML = data.userNickname;
        template.content.querySelector(".hitCount").innerHTML = data.hitCount;
        template.content.querySelector(".regDate").innerHTML = data.regDate;
        let a: HTMLElement | null = document.createElement("a");
        a.innerHTML = template.innerHTML;
        if (boards) {
          boards.appendChild(a);

        }
      }
    }
  });


//   //게시글 클릭 가능 이벤트 추가 이거 그냥 html쪽에 둘까요?
//   function showPostView(board: any) {
//     let form = document.createElement("form");
//     form.setAttribute("id", "postForm");
//     form.setAttribute("action", "/api/showPost");
//     form.setAttribute("method", "post");
//     form.style.display = "none"; // 화면에 보이지 않도록 설정

//     // 게시글 정보를 준비
//     const userNicknameInput = document.createElement("input");
//     userNicknameInput.setAttribute("userNickname" , board.userNickname);

//     const titleInput = document.createElement("input");
//     titleInput.setAttribute("title" , board.title);

//     const mainContentsInput = document.createElement("input");
//     mainContentsInput.setAttribute( "mainContents", board.mainContents);

//     // form에 담아서
//     form.appendChild(userNicknameInput);
//     form.appendChild(titleInput);
//     form.appendChild(mainContentsInput);

//     // 보낸다
//     document.body.appendChild(form);
//     form.submit();
// }

//@ts-nocheck

async function ajax(url: string, option?: any) {
  console.log("ajax 로딩 중~~~~~");
  return fetch(url, option).then((res) => res.json());
}


  // 처음 전체 보드리스트 출력 
  ajax("/api/replylist", {
    method: "POST",
    body: new FormData(document.getElementById("searchtype")),
  }).then((json) => {
    console.log(json);
  
    let boards: HTMLElement | null = document.querySelector("#boards");
    let template: HTMLTemplateElement | null = document.querySelector("#boards template");
    
    if (template) {
        for (let data of json.data) {
            template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
            template.content.querySelector(".boardListNum")?.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".title")?.setAttribute("href", `/postView.jsp?id=${data.boardListNum}`);
            template.content.querySelector(".mainContents").innerHTML = data.mainContents;
            template.content.querySelector(".userNickname").innerHTML = data.userNickname;
            template.content.querySelector(".hitCount").innerHTML = data.hitCount;
            template.content.querySelector(".regDate").innerHTML = data.regDate;
          
            
            let a: HTMLElement | null = document.createElement("a");
            // let span: HTMLElement | null = document.createElement("span");
            a.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(a);
            }
        }
    }
  });


// 검색 폼 제출 시 호출되는 함수
function submitSearch() {
  console.log("전송되었습니다");

  // 검색 폼 가져오기
  let form: HTMLFormElement | null = document.getElementById("searchtype");

  if (form) {
      let formData = new FormData(form);

      ajax("/api/boardlist", {
          method: "POST",
          body: formData,
      }).then((json) => {
          console.log(json);

          let boards: HTMLElement | null = document.querySelector("#boards");
          let template: HTMLTemplateElement | null = document.querySelector("#boards template");
         
          // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
          if (template) {
              boards.innerHTML = "";

              // JSON 데이터를 이용하여 동적으로 HTML 생성
              for (let data of json.data) {
                  // 새로운 div 생성
                  let a = document.createElement("div");

                  // template 내용을 복제하여 div에 추가
                  let clone: DocumentFragment = document.importNode(template.content, true);
                  a.appendChild(clone);

                  // 동적으로 생성된 div에 데이터 추가
                  a.querySelector(".boardListNum")!.innerHTML = data.boardListNum;
                  a.querySelector(".title")!.innerHTML = data.title;
                  a.querySelector(".mainContents")!.innerHTML = data.mainContents;
                  a.querySelector(".userNickname")!.innerHTML = data.userNickname;
                  a.querySelector(".hitCount")!.innerHTML = data.hitCount;
                  a.querySelector(".regDate")!.innerHTML = data.regDate;

                  // div를 #boards 아래에 추가
                  boards.appendChild(template);
                  boards.appendChild(a);
              }
          }
      });
  }
}

// 페이지 링크 동기화 안되었음 일단 클릭하면 이동은 가능함
function pageChange(page){
	document.querySelector("#searchtype #page").value = page;
	submitSearch();
}



// 삭제
function deletePost(boardListNum: number) {
  fetch(`/api/deletePost?boardListNum=${boardListNum}`, {
      method: "POST"
  })
  .then(response => response.json())
  .then(data => {
      if (data.success) {
          console.log("게시글 삭제 성공");
          // 삭제 성공 시 필요한 작업 수행
      } else {
          console.error("게시글 삭제 실패:", data.message);
      }
  })
  .catch(error => {
      console.error('게시글 삭제 중 오류 발생:', error);
  });
}

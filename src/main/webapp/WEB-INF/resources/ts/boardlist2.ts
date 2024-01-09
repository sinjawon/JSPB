
//@ts-nocheck
async function ajax(url: string, option?: any) {
  console.log("ajax 로딩 중~~~~~");
  return fetch(url, option).then((res) => res.json());
}

function validateSearchForm() {
  // 사용자 정의 유효성 검사를 수행합니다.
  let searchInput: HTMLInputElement | null = document.getElementById("search") as HTMLInputElement;
  if (!searchInput || searchInput.value.length < 3 || searchInput.value.length > 10) {
      alert("검색어는 3자 이상 10자 이하이어야 합니다.");
      return false; // 폼 제출 방지
  }

  // 유효성 검사를 통과하면 submitSearch 함수를 호출합니다.
  submitSearch(); // submitSearch 함수 호출
  return false; // 기본 폼 제출 방지
}

let form: FormData = new FormData();

ajax("/api/boardlist", {
  method: "POST",
  body: new FormData(document.getElementById("searchtype")),
}).then((json) => {
  console.log(json);


  let pagesContainer = document.querySelector("#pages");
  let pageTemplate = document.querySelector("#pages template");

  if (pageTemplate && pagesContainer) {
      pagesContainer.innerHTML = ""; // 기존의 페이지 링크를 지우기

      for (let i = 1; i <= json.totalPages; i+=1) {
          let span = document.createElement("span");
        //   span.classList.add("paging"); // span에 class 추가
          span.innerText = i;
          span.onclick = function () {
              pageChange(i);
          };
          pagesContainer.appendChild(span);
      }
  }



  let boards: HTMLElement | null = document.querySelector("#boards");
  let template: HTMLTemplateElement | null = document.querySelector("#boards template");
  
  if (template) {
      for (let data of json.data) {
          template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
          template.content.querySelector(".title").innerHTML = data.title;
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
  // else if(pagetemplate){
  //   for (let data of json.data) {
  //     template.content.querySelector(".paging").innerHTML = data.paging;
  //     let b: HTMLElement | null = document.createElement("div");
  //     b.innerHTML = pagetemplate.innerHTML;
  //     if (pages) {
  //       pages.appendChild(b);
  //   }
  //   }
  // }
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

// function pageChange(page){
// 	document.querySelector("#searchtype #page").value = page;
// 	submitSearch();
// }


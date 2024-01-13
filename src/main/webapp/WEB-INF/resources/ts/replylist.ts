//@ts-nocheck

async function ajax(url: string, option?: any) {
    console.log("ajax 로딩 중~~~~~");
    return fetch(url, option).then((res) => res.json());
  }
  
  window.onload= replylist();
  
  
  // 검색 폼 제출 시 호출되는 함수
  function replylist() {
    console.log("전송되었습니다");
    let form: HTMLFormElement | null = document.getElementById("searchform");
  
    if (form) {
        let formData = new FormData(form);
  
       
        ajax("/api/boardList", {
            method: "POST",
            body: formData,
        }).then((json) => {
            console.log(json);
  
            let boards: HTMLElement | null = document.querySelector("#boards");
            let template: HTMLTemplateElement | null = document.querySelector("#boards template");
  
        
           
            // 기존의 게시글 목록을 지우고 새로운 검색 결과를 표시
            if (template) {
                boards.innerHTML = "";
  
                if (json.data.length === 0) {
                  alert("일치하는 결과가 없습니다. 리스트로 돌아갑니다.");
                  location.reload(); // 페이지를 강제로 다시 로드
                  return;
              }
             
  
              for (let data of json.data) {
                template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
                
                template.content.querySelector(".title").innerHTML = data.title;
               
                template.content.querySelector(".mainContents").innerHTML = data.mainContents;
                template.content.querySelector(".userNickname").innerHTML = data.userNickname;
                template.content.querySelector(".hitCount").innerHTML = data.hitCount;
                template.content.querySelector(".regDate").innerHTML = data.regDate;
              
                
                let a: HTMLElement | null = document.createElement("div");
                
                a.innerHTML = template.innerHTML;
                if (boards) {
                    boards.appendChild(template);
                    boards.appendChild(a);
                }
            }
  
 
            }
  
        
  
        });
    }
  }
  

  
  
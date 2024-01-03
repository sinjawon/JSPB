//@ts-nocheck
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
      template.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
      template.content.querySelector(".title").innerHTML = data.title;
      template.content.querySelector(".userNickname").innerHTML = data.userNickname;
      template.content.querySelector(".hitCount").innerHTML = data.hitCount;
      template.content.querySelector(".regDate").innerHTML = data.regDate;
      let div: HTMLElement | null = document.createElement("div");
      div.innerHTML = template.innerHTML;
      if (boards) {
        boards.appendChild(div);
      }
    }
  }
});
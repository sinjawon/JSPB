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
    let mainList: HTMLElement | null =
      document.querySelector("#boards mainList");
    if (mainList) {
      for (let data of json.data) {
        mainList.content.querySelector(".boardListNum").innerHTML = data.boardListNum;
        mainList.content.querySelector(".title").innerHTML = data.title;
        mainList.content.querySelector(".UserNickName").innerHTML = data.UserNickName;
        mainList.content.querySelector(".hitCount").innerHTML = data.hitCount
        mainList.content.querySelector(".regDateregDate").innerHTML = data.regDateregDate;
      }
    }
});


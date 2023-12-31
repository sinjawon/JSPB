//@ts-nocheck
console.log("적용했다");
alert("나옴");

let  userIdsArray;
let  userNicknamesArray;

async function loginajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
  }
  let form: FormData = new FormData();
  console.log("만들었다");
  loginajax("http://localhost:8080/api/select/checkapi.jsp",{  
    method: "POST",
    body: form,
  }).then((json) => {  
    console.log(json);   
    userIdsArray = json.userids.map(item => item.userid);
    userNicknamesArray = json.userNicknames.map(item => item.userNickName);
  });
  console.log(userNicknamesArray);
  console.log(userIdsArray);


  async function logincheckID(){
    let inputForUserId = document.querySelector('input[name="userid"]').value;
   let checkID = userIdsArray.find(lang=>lang === inputForUserId);
    if(checkID){
        alert("중복이 있습니다");
    }else{
        alert("사용가능한 이이디입니다");
    }

  }

  async function logincheckName(){
    let inputForUserNickname = document.querySelector('input[name="userNickname"]').value;
   let checkNick = userNicknamesArray.find(lang=>lang === inputForUserNickname);
    if(checkNick){
        alert("중복이 있습니다");
    }else{
        alert("사용가능한 이이디입니다");
    }

  }
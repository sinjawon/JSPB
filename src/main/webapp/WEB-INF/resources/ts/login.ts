//@ts-nocheck

//가입 체크를 위한 변수 
let IdTrue :boolean=false;
let NinameTrue :boolean=false;
let PwTrue :boolean=false;


//기본 패치 아작스 함수
let form: FormData = new FormData();
async function loginajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
  } 

//아이디 중복확인
async function logincheckID(){
  await loginajax("http://localhost:8080/api/select/checkapi.jsp",{  
     method: "POST",
     body: form,
   }).then((json) => {    
     let userIdsArray = json.userids.map(data => data.userId);
     let inputForUserId = document.querySelector("input[name='userid']").value;
     let checkID =  userIdsArray.find(lang=>lang === inputForUserId);
        if(checkID !== undefined){
            alert("동일한 아이디가 있습니다");
        }else{
            alert("사용가능한 이이디입니다");
           IdTrue=ture;
        }
   });
  }


//닉네임중복 확인
  async function logincheckName(){
    await loginajax("http://localhost:8080/api/select/checkapi.jsp",{  
       method: "POST",
       body: form,
     }).then((json) => {    
       let userNicknamesArray = json.userNicknames.map(data=> data.userNickName); 
       let inputForUserNickname = document.querySelector("input[name='nickname']").value;
       let checkID =   userNicknamesArray.find(lang=>lang === inputForUserNickname);
          if(checkID !== undefined){
              alert("동일한 닉네임이  있습니다");
          }else{
              alert("사용가능한 닉네임입니다");
               NinameTrue =true;
          }
     });
    }

     // 비밀번호 일치 여부 확인
    function checkPasswordMatch() {
       
        let password = document.getElementById('password').value;
        let confirmPassword = document.getElementById('passwordcheck').value;
        let passwordMatchStatus = document.getElementById('passwordMatchStatus');

        if (password === confirmPassword) {
            passwordMatchStatus.innerText = '비밀번호 일치';
            passwordMatchStatus.style.color = 'green';
            document.getElementById('signupButton').disabled = false;
        } else {
            passwordMatchStatus.innerText = '비밀번호 불일치';
            passwordMatchStatus.style.color = 'red';
            document.getElementById('signupButton').disabled = true;
        }
    }
  //  document.getElementById('password').addEventListener('input', checkPasswordMatch);
    document.getElementById('passwordcheck').addEventListener('input', checkPasswordMatch);

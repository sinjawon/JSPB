//@ts-nocheck


//가입 체크를 위한 변수
let namecheck= false;
let idcheck= false; 
let pwcheck=false;


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
           idcheck= false;        
            alert("동일한 아이디가 있습니다");
        }else{
           idcheck= true;         
            alert("사용가능한 이이디입니다");
         

        }
   });
  }
//닉네임중복 확인
  async function logincheckName(){
      await loginajax("http://localhost:8080/api/select/checkapi.jsp",{  
       method: "POST",
       body: form,
     }).then((json) => {   
       let userNicknamesArray = json.userNicknames.map(data => data.userNickName); 
       let inputForUserNickname = document.querySelector("input[name='nickname']").value;
       let checkID =   userNicknamesArray.find(lang=>lang === inputForUserNickname);
          if(checkID !== undefined){
            namecheck= false;
              alert("동일한 닉네임이  있습니다");
          }else{
            namecheck= true;   
              alert("사용가능한 닉네임입니다");              
          }
     });
    }

     // 비밀번호 일치 여부 확인
   async  function checkPasswordMatch() {
      let password = document.getElementById('password').value;
      let  confirmPassword = document.getElementById('passwordcheck').value;
      let passwordMatchStatus = document.getElementById('passwordMatchStatus');
      if(password && confirmPassword){
      if (password === confirmPassword) {
          passwordMatchStatus.innerText = '비밀번호 일치';
          passwordMatchStatus.style.color = 'green';     
           pwcheck=true;  
      }
      else {
          passwordMatchStatus.innerText = '비밀번호 불일치';
          passwordMatchStatus.style.color = 'red';
          pwcheck=false;        
      }
    }else{
      passwordMatchStatus.innerText = '';
      pwcheck=false;
    
    }
  }
  

  //닉네임 
  function checkAndDisableButton() {
    let name = document.getElementById('name').value;
      let  nickname = document.getElementById('nickname').value;
    if (name && nickname && (idcheck && namecheck)===true) {
      document.getElementById('signupButton').disabled = true;
    } else {
      document.getElementById('signupButton').disabled = false;
    }
  }

  //올채크
  document.getElementById('signupForm').addEventListener('submit', function(event) {
    
    event.preventDefault();
  
    
    let name = document.getElementById('name').value;
    let nickname = document.getElementById('nickname').value;
   
    if (name && nickname && namecheck && idcheck && pwcheck) {           
      this.submit();
    }  else {   
      let errorMessage="";
      if (!name) {
          errorMessage += '이름이 올바르지 않습니다.\n';
      }

      if (!nickname) {
          errorMessage += '닉네임이 올바르지 않습니다.\n';
      }

      if (!namecheck) {
          errorMessage += '닉네임 중복 체크 해주세요.\n';
      }

      if (!idcheck) {
          errorMessage += '아이디 중복 체크 해주세요.\n';
      }

      if (!pwcheck) {
          errorMessage += '비밀번호 체크가 실패했습니다.\n';
      }

      alert(errorMessage);
    }
  });






  document.getElementById('nickname').addEventListener('input',()=>{namecheck= false;});
  document.getElementById('userid').addEventListener('input', ()=>{idcheck=false;});
    document.getElementById('password').addEventListener('input', checkPasswordMatch);
    document.getElementById('passwordcheck').addEventListener('input', checkPasswordMatch);
    
  
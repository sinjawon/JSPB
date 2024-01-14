//@ts-nocheck

async function messgeajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
   
  } 


async function messgedelet(notenum: String, endpoint: String) {
  let Sendform: FormData = document.querySelector(`#${endpoint}form${notenum}`);
  console.log(Sendform);
  let formData = new FormData(Sendform);
  let jsonData = {
    seenum: formData.get("seenum"),
    notenum: formData.get("notenum"),
    // 다른 필드들 추가
  };
  await messgeajax(`/Deletmessage/${endpoint}`, {  
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(jsonData),
  });
}


async function messgedeletAll(endpoint: String) {
  let Sendform: FormData = document.querySelector(`#${endpoint}form`);
  let formData = new FormData(Sendform);
  let jsonData = {
    seenums: formData.get("seenums"),
    notenums: formData.get("notenums"),
    // 다른 필드들 추가
  };
  await messgeajax(`/Deletmessage/${endpoint}`, {  
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(jsonData),
  });
}


async function sendDelet(notenum:String){

  let summaryElement = document.querySelector(`#sendsum${notenum}`);
    summaryElement.style.display = 'none';
    await messgedelet(notenum,"send");
}

async function recieveDelet(notenum:String){
 
  let summaryElement = document.querySelector(`#receivesum${notenum}`);
    summaryElement.style.display = 'none';
    await messgedelet(notenum,"recieve");
}


async function sendDeletAll(notenumString:String){ 
  let notenumArray = JSON.parse(notenumString);

  // 배열의 각 원소에 대해 반복
  for (let i = 0; i < notenumArray.length; i++) {
      let currentNotenum = notenumArray[i];

      // 작업 수행
      let summaryElement = document.querySelector(`#sendsum${currentNotenum}`);
      if (summaryElement) {
          summaryElement.style.display = 'none';      
      }
  }
    await messgedeletAll("sendAll");
}

async function recieveDeletAll(notenumString:String){ 
  let notenumArray = JSON.parse(notenumString);

  for (let i = 0; i < notenumArray.length; i++) {
      let currentNotenum = notenumArray[i];
      let summaryElement = document.querySelector(`#receivesum${currentNotenum}`);
      if (summaryElement) {
          summaryElement.style.display = 'none';      
      }
  }
    await messgedeletAll("receiveAll");
}

async function writemessage(){
  let writeform: FormData = document.querySelector(`#writemessage`);
  let writeformData = new FormData(writeform);
  let writejsonData = {
    sender: writeformData.get("sender"),
    receiver: writeformData.get("receiver"),
    content: writeformData.get("content")
  };
   messgeajax("/MessageServlet",{  
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(writejsonData),
  });
  console.log("완료");
  location.reload();
}



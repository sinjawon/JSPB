//@ts-nocheck

async function messgeajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());

  } 
  async function SendAjax(notenum:String){
    let Sendform =  document.querySelector(`#sendform${notenum}`); 
    messgeajax("/Deletmessage/Send",{  
      method: "POST",
      body:Sendform,
    });
   } 




function snedDelet(notenum:String){
    event.preventDefault();
    SendAjax(notenum);
    let summaryElement = document.querySelector(`#sendsum${notenum}`);
    summaryElement.style.display = 'none';

}


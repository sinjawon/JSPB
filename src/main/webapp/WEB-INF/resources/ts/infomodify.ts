//@ts-nocheck
function makelment( a:String):Element{
 return document.querySelector(a);
}
function modify(a:String,b:Element ,c:Element){
    document.querySelector(a)?.addEventListener("click",()=>{
        b.style.display= "block";
        c.style.display= "none";
    });
}
modify("label[for=name]",makelment("input#name"),makelment("label[for=name]"));

modify("label[for=email]",makelment("input#email"),makelment("label[for=email]"));

modify("label[for=aniname]",makelment("input#aniname"),makelment("label[for=aniname]"));

modify("label[for=date]",makelment("input#date"),makelment("label[for=date]"));

modify("label[for=gender]",makelment("div.radioBoxWrap"),makelment("label[for=gender]"));

modify("label[for=weight]",makelment("input#weight"),makelment("label[for=weight]"));






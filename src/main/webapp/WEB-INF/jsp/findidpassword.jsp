<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

  <% 
     String results = null;
  	 String checks =null;
    try(DBConnector con = new DBConnector();){
    	UserDao map = con.OpenMap(request, UserDao.class);
     String types = request.getParameter("action");
	if("findId".equals(types)){
		 String email = request.getParameter("email");
		 String realID = null ;
	     realID	= map.getuseridAsEmail(email);
	 	if(realID != null){
	 		checks = "true";
	 		results = "찾으시는 아이디는 : " + realID +" 입니다";
	 	}else{
	 		results = "잘못된아이디";
	 	}
	}else if("findPassword".equals(types)){
		String realpass1 = null ;
		String realpass2 = null ;
		String userid = request.getParameter("userId");
		String email = request.getParameter("email");
	     realpass1 = map.getuserpw(userid).toStringPW();
	     realpass2 = map.getuserNumAsEmail(email).toStringPW();
		if(realpass1.equals(realpass2)){
			checks = "true";
			results = "찾으시는 비밀번호는 : " + realpass1 +" 입니다";
		}else if(realpass1 == null || realpass1 == null){
			checks = "Falls";
			results = "잘못된 아이디나 이메일입니다";
		}else{
			checks = "Falls";
			results = "잘못된 아이디나 이메일입니다";
		}
	}	

	}
	catch(Exception e) {}
    
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>     
  
    <script src="/resources/findidpwd.js" defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
  	let SweetValue = "<%=results%>";
  	let SweetValueCheck = "<%=checks%>";
  	console.log(SweetValue);
    document.addEventListener("DOMContentLoaded", function() {
        // 페이지가 로드될 때 SweetValue 값을 확인하고 SweetAlert을 표시
         sweetValue = "<%=results%>";

        if (sweetValue != null && SweetValueCheck =="true") {
            Swal.fire({
                title: 'Alert가 실행되었습니다.',
                text: sweetValue,
                icon: 'success',
            });
        }else if(sweetValue == null && SweetValueCheck =="Falls" ){
        	Swal.fire({
                title: 'Alert가 실행되었습니다.',
                text: sweetValue,
                icon: 'error',
            });
        }
    });
  </script>  

<link rel="stylesheet" type="text/css" href="/resources/findidpwd.css"> 
<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
</head>
<body>

	<%@include file="../jsp/nav.jsp"%>
    
  

    

   <div class="findbox">
      <h1 class="idpwdtitle">아이디 찾기</h1>

 
     <div class="btnbox">
        <button class="idbtn">아이디 찾기</button>
        <button class="pwdbtn">비밀번호 찾기</button>
      </div>
    
    <div class="findform-box">
    <div class="idsearch">
        <form action="/app/findIdPassword.jsp" method="GET" class="find-form">
          <input
            type="text"
            name="email"
            class="ipid"
            placeholder="이메일을 입력해주세요"
          />
          <input type="hidden" name="action" value="findId" />
          <input type="submit" value="아이디찾기" class="findidbtn" onclick="showAlert();"/>
        </form>
        </div>
        <div class="pwdsearch" style="display:none;">
    <form action="/app/findIdPassword.jsp" method="GET" class="find-form" >
          <input
            type="text"
            name="userId"
            class="ippwd"
            placeholder="아이디를 입력해주세요"
          />
          
           <input
            type="email"
            name="email"
            class="ippwd"
            placeholder="이메일을 입력해주세요"
          />
          
          <input type="hidden" name="action" value="findPassword" />
          <input type="submit" value="비밀번호찾기" class="findpwdbtn" onclick="showAlert();"/>
        </form>
        </div>
      </div>
    </div>

	<%@include file="../jsp/footer.jsp"%>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
    <script src="/resources/findidpwd.js" defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/findidpwd.css"> 
<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
</head>
<body>

	<%@include file="../jsp/nav.jsp"%>
    
    <%
try(DBConnector con = new DBConnector();){
		UserDao map = con.OpenMap(request, UserDao.class);
%>

    <%
        String action = request.getParameter("action");

        if ("findId".equals(action)) {
            // 아이디 찾기 로직
            String email = request.getParameter("email");     
           String foundUserId = "이거다";
    %>
  
           <%--  <p>찾는 아이디: <%= foundUserId %></p> --%>
           <script>
        var id =  <%= foundUserId %>
	    Swal.fire({
	    	  title: "찾는아이디",
	    	  text: id,
	    	  icon: "success",
	    	  
	    	  confirmButtonColor: '#3085d6',
	    	  confirmButtonText: '확인' 
	    	}).then(result => {
	    		//확인 누르면
	    		if(result.isConfirmed) {
	    			window.location.href="/app/login.jsp";
	    		}
	    	});
	    </script>

    <%
        } else if ("findPassword".equals(action)) {
            // 비밀번호 찾기 로직
            String userId = request.getParameter("userId");
            String foundPassword = map.getuserpw(userId).toStringPW();
            
         
    %>
      <script>
	   <%--  var pwd = <%= foundPassword %>
	    alert("찾는비번" + pwd);
	    window.location.href="/app/login.jsp";  --%>
	    var pwd = <%= foundPassword %>
	    
	    Swal.fire({
	    	  title: "찾는비번",
	    	  text: pwd,
	    	  icon: "success",
	    	  
	    	  confirmButtonColor: '#3085d6',
	    	  confirmButtonText: '확인' 
	    	}).then(result => {
	    		//확인 누르면
	    		if(result.isConfirmed) {
	    			window.location.href="/app/login.jsp";
	    		}
	    	});
	    
	 
	    /* 
	    setTimeout(() => window.location.href="/app/login.jsp";, 2000); */
	    
	    
      </script>
         <%--   <p class="findpwd">찾는 비번: <%= foundPassword %></p> --%>

    <%
        } else {
    %>
    
   <div class="findbox">
      <h1 class="idpwdtitle">아이디 찾기</h1>

     

    
     <div class="btnbox">
        <button class="idbtn">아이디 찾기</button>
        <button class="pwdbtn">비밀번호 찾기</button>
      </div>
    
    <div class="findform-box">
    <div class="idsearch">
        <form action="/app/findIdPassword.jsp" method="post" class="find-form">
          <input
            type="text"
            name="email"
            class="ipid"
            placeholder="이메일을 입력해주세요"
          />
          <input type="hidden" name="action" value="findId" />
          <input type="submit" value="아이디찾기" class="findidbtn" />
        </form>
        </div>
        <div class="pwdsearch" style="display:none;">
    <form action="/app/findIdPassword.jsp" method="post" class="find-form" >
          <input
            type="text"
            name="userId"
            class="ippwd"
            placeholder="아이디를 입력해주세요"
          />
          <input type="hidden" name="action" value="findPassword" />
          <input type="submit" value="비밀번호찾기" class="findpwdbtn" />
        </form>
        </div>
      </div>
    </div>

    <%
        }
    %>
    
<% 
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>
    
	<%@include file="../jsp/footer.jsp"%>
   
</body>
</html>
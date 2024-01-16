<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/myreset.css"> 
<link rel="stylesheet" type="text/css" href="/resources/managerpage.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js" defer></script>
<script src="/resources/manager.js" defer></script>
</head>
<body>

<%@include file="../jsp/nav.jsp"%>



 <%
try(DBConnector con = new DBConnector();){
		UserDao map = con.OpenMap(request, UserDao.class);
		
		List<User> userNumNiCk = map.getuserNumNick();
		
		
		
		 
 %>

    <div class="manager-box">
      <h2 class="manager-title">관리자페이지 입니다.</h2>
      <div class="manager-top">
        <h3 class="manager-join">회원유동 그래프</h3>
        <div class="manager">
        <canvas id="bar-chart"></canvas>
        </div>
      </div>

      <div class="document">
        <ul>
          <li>
            <div class="boardDocs">
              <div class="boards">회원수</div>
              <div class="boards-people">sddsds명</div>
            </div>
          </li>
          <li>
            <div class="boardDocs">
              <div class="boards">등록된 게시글 수</div>
              <div class="boards-wrtie">sddsds명</div>
            </div>
          </li>
        </ul>
      </div>

      <div class="manaber-box">
        <div class="manaber-title">회원관리</div>
       
        <table class="manager-membership">
          <tr>
            <th>회원넘버</th>
            <th>닉네임</th>
            <th>가입날짜</th>
            <th></th>
          </tr>
          
             <%for (User user : userNumNiCk){%>
          <tr class="manager-tr">
            <td><%=user.getUserNum()%></td>
            <td><%=user.getUserNickname()%></td>
            <td>회원가입날짜</td>
            <td><button value="<%=user.getUserNum()%>">회원삭제</button></td>
          </tr>
          <%}%>	
        </table> 
      </div>
    </div>
    
      <%	
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>  
    
    
    <%@include file="../jsp/footer.jsp"%>
</body>
</html>
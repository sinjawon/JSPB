<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
</head>
<body>
    <h1>아이디/비밀번호 찾기</h1>
    
    
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

            <p>찾는 아이디: <%= foundUserId %></p>

    <%
        } else if ("findPassword".equals(action)) {
            // 비밀번호 찾기 로직
            String userId = request.getParameter("userId");
            String foundPassword = map.getuserpw(userId).toStringPW();
    %>

            <p>찾는 비번: <%= foundPassword %></p>

    <%
        } else {
    %>

            <form action="/app/findIdPassword.jsp" method="post">
                <label>Email: <input type="text" name="email"></label>
                <input type="hidden" name="action" value="findId">
                <input type="submit" value="아이디찾기">
            </form>

            <form action="/app/findIdPassword.jsp" method="post">
                <label>User ID: <input type="text" name="userId"></label>
                <input type="hidden" name="action" value="findPassword">
                <input type="submit" value="비밀번호찾기">
            </form>

    <%
        }
    %>
    
<% 
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>
    
   
</body>
</html>
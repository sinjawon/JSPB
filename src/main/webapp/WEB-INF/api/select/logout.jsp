<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>


<%  if(request.getParameter("logoutAction").equals("true")) {
	
	session.removeAttribute("UserNum");
	session.removeAttribute("UserNickName");
	session.setMaxInactiveInterval(0);
	
   response.sendRedirect("/app/home.jsp");
}        	 
%>
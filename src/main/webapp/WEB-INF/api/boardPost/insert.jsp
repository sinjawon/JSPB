<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.system.DBConnector"%>


<% 
	try(DBConnector con = new DBConnector();{
		if(!request.getMethod().equalsIgnoreCase("GET")) throw new Exception();
	BoardDAO map = con.OpenMap(request, BoardDAO.class);
	BoardUser user = 
			map.getBoardUserCheck(request.getParameter("id"), request.getParameter("pw"));
		if(user == null) throw new Exception();
		map.insert
}catch{}




%>
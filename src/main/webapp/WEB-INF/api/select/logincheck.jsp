<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>



<%
	try(DBConnector con = new DBConnector();){
		if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();
		UserDao map = con.OpenMap(request, UserDao.class);
		
		String usernumber =request.getParameter("userNum");
		String userid = request.getParameter("userid"); 
		String nopassword = request.getParameter("password");
		
	    String realpassword=map.getuserinfo(userid).toString();
	    
	    if(nopassword.equals(realpassword)){
	    	
	    	session.setAttribute(usernumber,usernumber);
	    	session.setMaxInactiveInterval(60 * 30);	    	
	    request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
	    	
	    }else{
	   request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
	    }
		
		
		
		
		
	}
	catch(Exception e) {
		response.getWriter().write("GET방식이니");
	}
%>
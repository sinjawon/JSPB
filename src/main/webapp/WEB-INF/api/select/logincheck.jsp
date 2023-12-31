<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>



<%            
	  try(DBConnector con = new DBConnector();){
		if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();		
		UserDao map = con.OpenMap(request, UserDao.class);
				
		String userid = request.getParameter("userid"); 
		String realpassword=map.getuserpw(userid).toStringPW();		
		String nopassword = request.getParameter("password");
		
	    
	    
	    if(nopassword.equals(realpassword)){
	    	
	    	String UserNum=map.getuserNum(userid).toStringNum();
	    	
	    	session.setAttribute("UserNum",UserNum);
	    	
	    	session.setMaxInactiveInterval(60 * 30);
	    	
         request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
	    	
	    }else{	        	
	    	
	    	/* response.sendRedirect("/app/login.jsp"); */
	    }
	    

	}
	catch(Exception e) {
		session.setMaxInactiveInterval(0);
		response.sendRedirect("/app/home.jsp");
	}
%>
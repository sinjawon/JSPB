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
		
		if(userid != null && realpassword != null){				    
	        if(nopassword.equals(realpassword)){
	    	
	    	String UserNum=map.getuserNum(userid).toStringNum();
	    	
	    	session.setAttribute("UserNum",UserNum);
	    	
	    	session.setMaxInactiveInterval(60 * 30);
	    	
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
	    	HttpServletRequest newRequest = new HttpServletRequestWrapper(request);
	    	dispatcher.forward(newRequest, response);

	    	
	    }else{	        	
	    	 RequestDispatcher dispatcher = request.getRequestDispatcher("/app/login.jsp");
		     HttpServletRequest newRequest = new HttpServletRequestWrapper(request);
		     newRequest.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다1.");
		     dispatcher.forward(newRequest, response);
		     response.sendRedirect("/app/login.jsp");
	    }
	   
	   }else{			  
		     RequestDispatcher dispatcher = request.getRequestDispatcher("/app/login.jsp");
		     HttpServletRequest newRequest = new HttpServletRequestWrapper(request);
		     newRequest.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다2.");
		     dispatcher.forward(newRequest, response);
		     response.sendRedirect("/app/login.jsp");
	   }
	  }		
	catch(Exception e) {
		response.getWriter().write("오류오류0");
		/* session.setMaxInactiveInterval(0);
		response.sendRedirect("/app/home.jsp"); */
	}
%>
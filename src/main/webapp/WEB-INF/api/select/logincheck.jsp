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
	    	String UserNickName=map.getuserNickName(userid).toStringNick();
	    	//세션에 유저 번호,닉네임 저장
	    	session.setAttribute("UserNum",UserNum);
	    	session.setAttribute("UserNickName",UserNickName);	    	
	    	session.setMaxInactiveInterval(60 * 30);
	    		    		
	    	 response.sendRedirect("/app/home.jsp");   	
	    }else{	        	
	    	session.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다2.");		    
		     response.sendRedirect("/app/login.jsp");
	    }
	   
	   }else{			  
		
		     session.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다2.");		    
		     response.sendRedirect("/app/login.jsp");
	   }
	  }		
	catch(Exception e) {
		response.getWriter().write("오류오류0");
		/* session.setMaxInactiveInterval(0);
		response.sendRedirect("/app/home.jsp"); */
	}
%>
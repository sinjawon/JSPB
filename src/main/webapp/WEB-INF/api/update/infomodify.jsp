<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>



<%      
if(request.getParameter("image") !=null){
	
	  try(DBConnector con = new DBConnector();){
			if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();		
			UserDao map = con.OpenMap(request, UserDao.class);
			UserAnimal map2 =con.OpenMap(request, UserAnimal.class);
			request.getParameter("");
		     String usernum = (String)session.getAttribute("usernum");
		
			  } 
		catch(Exception e) {
			response.getWriter().write("오류오류0");

			  request.setAttribute("userprofile", "");		  
		        // 다른 서블릿으로 포워딩
		        RequestDispatcher dispatcher = request.getRequestDispatcher("/upload");
		        dispatcher.forward(request, response);
		}
	
	
}else{
	
	  try(DBConnector con = new DBConnector();){
			if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();		
			UserDao map = con.OpenMap(request, UserDao.class);
			UserAnimal map2 =con.OpenMap(request, UserAnimal.class);
			request.getParameter("");
		     String usernum = (String)session.getAttribute("usernum");
		
			  } 
		catch(Exception e) {
			response.getWriter().write("오류오류0");
			
		}

}     
		
	
%>
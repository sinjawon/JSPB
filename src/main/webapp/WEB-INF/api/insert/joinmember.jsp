<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>


   
<%
try(DBConnector con = new DBConnector();){
		UserDao map = con.OpenMap(request, UserDao.class);
		UserAnimalDao map2 = con.OpenMap(request, UserAnimalDao.class);
		String name= request.getParameter("name");
		String nickname= request.getParameter("nickname");
		String userid= request.getParameter("userid");
		String password= request.getParameter("password");
		
		map.joinmember(name, nickname, userid, password);
		map2.meberanimal();
		
		
		response.sendRedirect("/app/home.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>


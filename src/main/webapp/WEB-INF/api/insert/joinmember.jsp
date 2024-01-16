<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.util.*, org.json.*,java.sql.Timestamp,java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>


   
<%
try(DBConnector con = new DBConnector();){
		UserDao map = con.OpenMap(request, UserDao.class);
		UserAnimalDao map2 = con.OpenMap(request, UserAnimalDao.class);
		String name= request.getParameter("name");
		String nickname= request.getParameter("nickname");
		String userid= request.getParameter("userid");
		String password= request.getParameter("password");
		System.out.println("확인");
		Date currentDate = new Date();
	    	Timestamp timestamp = new Timestamp(currentDate.getTime());
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    	String dateString = sdf.format(timestamp);
		
		map.joinmember(name, nickname, userid,password,dateString);
		map2.meberanimal();
		
		
		response.sendRedirect("/app/main.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>


<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>


   
<%
try(DBConnector con = new DBConnector();){
	UserDao map = con.OpenMap(request, UserDao.class);
		List<User> userid = map.getuserid();		
		List<User> usernickname =map.getuserNickname();
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("userid", userid);
		result.put("usenickname", usernickname);
		response.getWriter().write(new JSONObject(result).toString());
	}
	catch(Exception e) {
		
	}
%>
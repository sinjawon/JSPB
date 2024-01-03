
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>


<%
	try(DBConnector con = new DBConnector();){
		BoardDao map = con.OpenMap(request, BoardDao.class);
		List<BoardInfo> exec = null;
		
 		if(request.getParameter("searchtype").equalsIgnoreCase("title")){
			exec = map.getBoardInfoByTitle(request.getParameter("title"));
 		}
 		else if(request.getParameter("searchtype").equalsIgnoreCase("title")){
			exec = map.getBoardInfoByTitle(request.getParameter("title"));
 		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", exec);
		response.getWriter().write(new JSONObject(result).toString());
	}
	catch(Exception e) {}
%>
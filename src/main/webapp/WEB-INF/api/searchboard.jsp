<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%

System.out.println("api board data start");
Map<String, Object> result = new HashMap<String, Object>();
Map<String, Object> pagingMap = new HashMap<String, Object>();
List<BoardInfo> exec = new ArrayList<BoardInfo>();
result.put("data", exec);

int pageSize	= 10;
int totalPage	= 0;


	try(DBConnector con = new DBConnector();){
		BoardDao map = con.OpenMap(request, BoardDao.class);
		
		System.out.println("map : " +map);
		 	if(request.getParameter("searchtype") == null 
		 			|| request.getParameter("searchtype").equalsIgnoreCase("all")
		 			) {
		 		System.out.println("no search data start");
		 		int totalCount = map.getBoardInfoAllCnt();
		 		System.out.println("totalCount : " +totalCount);
				exec = map.getBoardInfoAll();
				System.out.println("exec : " +exec);
				System.out.println("no search data end");
				
				pagingMap.put("totalCount", totalCount);
				pagingMap.put("totalPage",	totalPage);
				pagingMap.put("pageSize", pageSize);
		 	} else if(request.getParameter("searchtype").equalsIgnoreCase("userNickname")) {
				exec = map.getBoardInfoByUserNickName(request.getParameter("userNickname"));
		 	} else if(request.getParameter("searchtype").equalsIgnoreCase("title")) {
				exec = map.getBoardInfoByTitle(request.getParameter("title"));		
		 		
				
			}
		 	result.put("paging", pagingMap);
		 	
			result.put("data", exec);
			
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
	response.getWriter().write(new JSONObject(result).toString());
%>
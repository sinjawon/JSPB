<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%
try (DBConnector con = new DBConnector();) {
        if (!request.getMethod().equalsIgnoreCase("POST")) {
            throw new Exception();
        }

        BoardDao map = con.OpenMap(request, BoardDao.class);
        BoardUser user = map.getBoardUserCheck(request.getParameter("id"), request.getParameter("password"));

        if (user == null) {
            throw new Exception();
        }

 
        int postId = Integer.parseInt(request.getParameter("postId"));	// 수정할 글의 ID
        String newTitle = request.getParameter("newTitle"); 			// 수정할 제목
        String newContent = request.getParameter("newContent"); 		// 수정할 내용

        map.updateBoard(request.getParameter("newTitle"), request.getParameter("newContent"), postId);

        response.getWriter().write("Succeed!");
    } catch (Exception e) {
        response.getWriter().write("잘못된 접속이거나 정보를 전달하였습니다.");
    }
%>

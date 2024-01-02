<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%
try(DBConnector con = new DBConnector();) {
        if(!request.getMethod().equalsIgnoreCase("delete")) throw new Exception();
        BoardDAO map = con.OpenMap(request, BoardDAO.class);
        BoardUser user = map.getBoardUserCheck(request.getParameter("id"), request.getParameter("password"));
        if(user == null) throw new Exception();

        map.deleteBoard(Integer.parseInt(request.getParameter("postId")));

        response.getWriter().write("게시글이 삭제되었습니다.");
    } catch(Exception e) {
        response.getWriter().write("게시글 삭제 중 오류가 발생했습니다.");
    }
%>
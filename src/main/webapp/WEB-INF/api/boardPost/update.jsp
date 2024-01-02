<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%
    try(DBConnector con = new DBConnector();) {
        if(!request.getMethod().equalsIgnoreCase("GET")) throw new Exception();
        BoardDAO map = con.OpenMap(request, BoardDAO.class);
        BoardUser user = map.getBoardUserCheck(request.getParameter("id"), request.getParameter("pw"));
        if(user == null) throw new Exception();

        int postId = Integer.parseInt(request.getParameter("postId"));
        String newTitle = request.getParameter("newTitle");
        // 수정할 내용에 따라 필요한 파라미터들을 받아옴
        // ...

        map.updateBoard(newTitle, postId); // 수정할 내용을 이용하여 게시글을 업데이트함

        response.getWriter().write("게시글이 수정되었습니다.");
    } catch(Exception e) {
        response.getWriter().write("게시글 수정 중 오류가 발생했습니다.");
    }
%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector" %>
<%@ page import="org.json.*" %>

<%
    
    int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
    JSONObject result = new JSONObject();

    try (DBConnector dbConnector = new DBConnector();){
        
        BoardDao boardDao = dbConnector.OpenMap(request, BoardDao.class);

        // 게시물 ID에 해당하는 정보를 DB에서 가져옴 , 메서드는 따로 추가했음
        BoardInfo post = boardDao.getBoardInfoById(boardListNum);

        // 가져온 정보를 JSON 형태로 전송
        result.put("success", true);
        result.put("post", new JSONObject(post));
    } catch (Exception e) {
        e.printStackTrace();
        result.put("success", false);
        result.put("message", "게시글 조회에 실패했습니다.");
    }

    response.getWriter().write(result.toString());
%>

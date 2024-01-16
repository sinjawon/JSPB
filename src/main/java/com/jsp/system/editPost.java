package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.jsp.dao.BoardDao;
import com.jsp.dto.BoardInfo;

@WebServlet("/api/editPost")
public class editPost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
    	
    	
       String userNickname = request.getParameter("userNickname");
       int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
       System.out.println(boardListNum);
       
        String title = request.getParameter("title");
       System.out.println(title);

        String mainContents = request.getParameter("mainContents");
       System.out.println(mainContents);

        try (DBConnector con = new DBConnector();){
        	String userNickname = request.getParameter("userNickname");
        	
        	BoardDao map = con.OpenMap(request, BoardDao.class);
        	System.out.println("map이 안되니");

            int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
            String title = request.getParameter("title");
            String mainContents = request.getParameter("mainContents");
        	
        	map.updateBoardInfo(title, mainContents,boardListNum);
            System.out.println("보드에 들어갔나요?");
        } catch(Exception e) {
        	System.out.println("editPost api 에러");
        }
        
        response.setContentType("text/plain");
        response.sendRedirect("/app/boardList.jsp");
    	
    	
    }
}

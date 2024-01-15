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

@WebServlet("/api/showPost")
public class showPost extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
     	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	
    	JSONObject result = new JSONObject();
    	
    	try (DBConnector con = new DBConnector();) {
    		int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
    		BoardDao map = con.OpenMap(request, BoardDao.class);

    		
    		// 게시물 ID에 해당하는 정보를 DB에서 가져옴 , 메서드는 따로 추가했음
    		BoardInfo post = map.getBoardInfoById(boardListNum);

          // 가져온 정보를 JSON 형태로 전송
          result.put("success", true);
          result.put("post", new JSONObject(post));
          
          result.put("userNickname", post.getUserNickname());
          result.put("title", post.getTitle());
          result.put("mainContents", post.getMainContents());
          
          System.out.println(post.getUserNickname());

    		
    	} catch (Exception e) {
    		e.printStackTrace();
    		result.put("success", false);
    		result.put("message", "게시글 조회에 실패했습니다.");
    	}
//    	response.setContentType("text/plain");
    	response.setContentType("application/json");
    	response.getWriter().write(result.toString());
    }
}

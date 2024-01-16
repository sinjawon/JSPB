package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.jsp.dao.*;
import com.jsp.dto.*;
import com.jsp.system.DBConnector;

@WebServlet("/api/showPost2")
public class showPost2 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
     	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	
    	JSONObject result = new JSONObject();
    	
    	try (DBConnector con = new DBConnector();) {
    		int boardListNum2 = Integer.parseInt(request.getParameter("boardListNum2"));
    		BoardDao2 map = con.OpenMap(request, BoardDao2.class);

    		
    		// 게시물 ID에 해당하는 정보를 DB에서 가져옴 , 메서드는 따로 추가했음
    		BoardInfo2 post2 = map.getBoardInfoById2(boardListNum2);

          // 가져온 정보를 JSON 형태로 전송
          result.put("success", true);
          result.put("post2", new JSONObject(post2));
          
          result.put("userNickname2", post2.getUserNickname2());
          result.put("title2", post2.getTitle2());
          result.put("mainContents2", post2.getMainContents2());
          
          System.out.println(post2.getUserNickname2());

    		
    	} catch (Exception e) {
    		e.printStackTrace();
    		result.put("success", false);
    		result.put("message", "게시글 조회에 실패했습니다.");
    	}
//    	response.setContentType("text/plain");
    	response.setContentType("application/json");
    	response.getWriter().write(result.toString());
    }
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}

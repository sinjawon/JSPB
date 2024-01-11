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
        
    	String userNickname = request.getParameter("userNickname");
    	
    	int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
    	System.out.println("글번호" + boardListNum);
    	
        String title = request.getParameter("title");
    	System.out.println("제목" + title);

        String mainContents = request.getParameter("mainContents");
    	System.out.println("내용"+ mainContents);

        try (DBConnector con = new DBConnector();){
        	System.out.println("수정 되냐");
        	BoardDao map = con.OpenMap(request, BoardDao.class);
        	System.out.println("map이 안되니");

        	map.updateBoardInfo(title, mainContents,boardListNum);
            System.out.println("보드에 들어갔나요?");
        } catch(Exception e) {
        	System.out.println("editPost.java 에러");
        }
        response.sendRedirect("/boardList.jsp");
    	
    	
    	
    	
    	
    	
//    	JSONObject result = new JSONObject();
//
//        try (DBConnector con = new DBConnector();) {
//    		int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
//    		BoardDao map = con.OpenMap(request, BoardDao.class);
//            
//    		
//    		BoardInfo post = map.getBoardInfoById(boardListNum);
//    		result.put("success", true);
//    		result.put("post", new JSONObject(post));
//    		
//    		result.put("userNickname", post.getUserNickname());
//    		result.put("title", post.getTitle());
//    		result.put("mainContents", post.getMainContents());
//    		
//    		
//    		
//            //String userNickname = request.getParameter("userNickname");
//            //유저네임 쓰나?
//            String title = request.getParameter("title");
//            String mainContents = request.getParameter("mainContents");
//
//            
//            
//            
//      
//            result.put("success", true);
//            result.put("message", "게시글이 성공적으로 수정되었습니다.");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            result.put("success", false);
//            result.put("message", "게시글 수정에 실패했습니다.");
//        }
//
//       
//        response.getWriter().write(result.toString());
    }
}

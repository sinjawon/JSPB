package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jsp.dao.BoardDao;

@WebServlet("/api/newPost")
@MultipartConfig(
		fileSizeThreshold=1024*1024*2, // 2MB
		maxFileSize=1024*1024*10,      // 10MB
		maxRequestSize=1024*1024*50)   // 50MB
public class InsertNewPost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	String userNickname = request.getParameter("userNickname");  	
        String title = request.getParameter("title");
        String mainContents = request.getParameter("mainContents");
        
    	
    	String[] images = new String[4];
        for (int i = 0; i < 4; i++) {
            String imgName = "image" + (i + 1);
            images[i] = request.getParameter(imgName);
        }
        
        try (DBConnector con = new DBConnector();){
        	System.out.println("con 만들기");
        	BoardDao map = con.OpenMap(request, BoardDao.class);
        	
            String[] imageArray = new String[4];
             

            map.insertNewBoard(userNickname, title, mainContents, images);
            
            
            
            
            System.out.println("보드에 들어갔나요?");
        } catch(Exception e) {
        	System.out.println("등록 오류");
        }
        response.sendRedirect("/boardList.jsp");
    }
}


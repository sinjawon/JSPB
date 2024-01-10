package com.jsp.system;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dao.*;


@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	/* private static final long serialVersionUID = 1L; */

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   
 	   
 	  
 	   try(DBConnector con = new DBConnector();){
 		  
 		    response.setCharacterEncoding("UTF-8");
 		   response.setContentType("text/html;charset=UTF-8");
 		    
 			UserNoteDao map = con.OpenMap(request, UserNoteDao.class);
 			UserNoteSeeDao map2 = con.OpenMap(request, UserNoteSeeDao.class);
 			response.getWriter().println("진행중이야1");
 			
 			Date currentDate = new Date();
 	    	Timestamp timestamp = new Timestamp(currentDate.getTime());
 	    	response.getWriter().println("진행중이야2");
 	    	
 	        String sender = request.getParameter("sender");
 	        String receiver = request.getParameter("receiver");
 	        String content = request.getParameter("content");
 	       response.getWriter().println(sender);
 	      response.getWriter().println(receiver);
 	        response.getWriter().println(content);
 	        map.insertUserNote(sender, receiver, content, timestamp);
 	        map2.insertUserNoteSee();
 			/* response.sendRedirect("messages.jsp"); */
 		}
 		catch(Exception e) {
 			e.printStackTrace();
 			response.getWriter().println("아슈바 오류");
 		}
    }
   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
}
    
    
}
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
 		  
 		   //인코딩 아닌거 중요하네  받고 도출 방법을 이렇게 해야하는데 내가 어디서 꼬인 코드를 만들었나봐
 		   request.setCharacterEncoding("UTF-8");
 		    response.setCharacterEncoding("UTF-8");
 		   response.setContentType("text/html;charset=UTF-8");
 		    
 			UserNoteDao map = con.OpenMap(request, UserNoteDao.class);
 			UserNoteSeeDao map2 = con.OpenMap(request, UserNoteSeeDao.class);
 			response.getWriter().println("진행중이야1");
 			
 			Date currentDate = new Date();
 	    	Timestamp timestamp = new Timestamp(currentDate.getTime());
 	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 	    	String dateString = sdf.format(timestamp);
 	    	
 	    	response.getWriter().println("진행중이야2");
 	    	
 	        String sender = request.getParameter("sender");
 	        String receiver = request.getParameter("receiver");
 	        String content = request.getParameter("content");
 	       response.getWriter().println(sender+receiver+content);
 	       
			/*
			 * DateWrap dates =new DateWrap(timestamp); String s = dates.toString();
			 * 
			 * response.getWriter().println(dates);
			 */
 	        
 	       response.getWriter().println("시작"+timestamp+"\n" +"이거 다음 적용 \n");

			/* response.getWriter().println(s); */
 	       
 	        map.insertUserNote(sender, receiver, content, dateString);
 	      
 	        map2.insertUserNoteSee();
 	        
 	       
 			response.sendRedirect("app/messagebox.jsp");
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
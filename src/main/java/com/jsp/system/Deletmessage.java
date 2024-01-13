

package com.jsp.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dao.*;
import com.jsp.dto.UserNoteSee;

@WebServlet("/Deletmessage/*")
public class Deletmessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		this.doGet(request, response);
    } 
    @Override
    protected void doGet(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
    		throws ServletException, IOException {
    	 try (DBConnector con = new DBConnector()) {
    		 UserNoteSeeDao map = con.OpenMap(req,  UserNoteSeeDao.class);
        
    	
    	
    	 String action = req.getPathInfo();
    	 
    	 if ("/Send".equals(action)) {
		    	 String seenum = req.getParameter("seenum");
		    	 String notenum = req.getParameter("notenum");
		    	 if(seenum.equals("3")) {
		    		 seenum = "1";
		    	 }
		    	 else if(seenum.equals("2")){
		    		 seenum = "4";
		    	 }
		    	 map.SetcanSee(notenum, seenum);
    		 
         }else if("/Receive".equals(action)){
	        	 String seenum = req.getParameter("seenum");
	        	 String notenum = req.getParameter("notenum");
	        	 if(seenum.equals("3")) {
	        		 seenum = "2";
	        	 }else if(seenum.equals("1")){
	        		 seenum = "4";
	        	 }
	        	 map.SetcanSee(notenum, seenum);
	        	 
         }else if ("/SendAll".equals(action)) {
        String a =  req.getParameter("seenums");
        
        resp.getWriter().println(a);	
        
		}else if ("/ReceiveAll".equals(action)) {
			
			
		}
    	 
    	 
    	//트라이케치 
    	 } catch (Exception e) {
    		 
    		 resp.getWriter().println("오류");
         } 
    	//트라이케치  
    	
    }
    
}

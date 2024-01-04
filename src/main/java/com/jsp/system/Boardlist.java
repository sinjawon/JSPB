
package com.jsp.system;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.jsp.dao.BoardDao;
import com.jsp.dto.*;

	@WebServlet("/api/boardlist")
	public class Boardlist extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    	response.setCharacterEncoding("utf-8");
	    	response.setContentType("application/json");
	    	 
	    
//	    	int limit = Integer.parseInt(request.getParameter("limit"));
//	        int page = Integer.parseInt(request.getParameter("page"));
	    	
	    	try(DBConnector con = new DBConnector();){
	    		BoardDao map = con.OpenMap(request, BoardDao.class);
	    		List<BoardInfo> exec = null;
	    		
	     		if(request.getParameter("searchtype") == null || 
	    			request.getParameter("searchtype").equalsIgnoreCase("all"))
	     			exec = map.getBoardInfoAll();
	     		else if(request.getParameter("searchtype").equalsIgnoreCase("userNickname")) {
		     		System.out.println("userNickname in");
		     		exec = map.searchByUserNickname("%"+request.getParameter("search")+"%");
		     		System.out.println(exec);
		     		System.out.println("userNickname out");
		     		}
		    	else if(request.getParameter("searchtype").equalsIgnoreCase("title")) {
		    		System.out.println("title in");
		    		exec = map.searchByTitle("%"+request.getParameter("search")+"%");
		    		System.out.println(exec);
		    		System.out.println("title out");
		    		}
		    	else {response.sendRedirect("/BoardList.jsp");}
	    		Map<String, Object> result = new HashMap<String, Object>();
	    		result.put("data", exec);
	    		System.out.println(new JSONObject(result).toString());
	    		response.getWriter().write(new JSONObject(result).toString());
	    	}
	    	catch(Exception e) {}
	    }
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			this.doPost(req, resp);
		}
	}


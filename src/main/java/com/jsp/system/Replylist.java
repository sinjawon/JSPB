//댓글보기
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

import com.jsp.dao.ReplyDao;
import com.jsp.dto.ReplyInfo;

@WebServlet("/api/replylist")
public class Replylist extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	 
	 request.setCharacterEncoding("UTF-8");
     response.setCharacterEncoding("UTF-8");
     response.setContentType("application/json");

     
     int boardListNum = Integer.parseInt(request.getParameter("boardListNum"));
     List<ReplyInfo> reply = null;
     
     try (DBConnector con = new DBConnector();) {
         ReplyDao map = con.OpenMap(request, ReplyDao.class);
 
         int replycount=  map.getReplyInfoAllCnt(boardListNum);
         
         if(replycount>0) {
         	reply = map.searchByBoardListNum(boardListNum);
         }
         Map<String, Object> result = new HashMap<String, Object>();
         result.put("data", reply);
         request.setAttribute("replyList", reply); // JSP로 전달
         getServletContext().getRequestDispatcher("/postView.jsp").forward(request, response);

     }catch(Exception e) {}
 }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
}



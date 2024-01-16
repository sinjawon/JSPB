package com.jsp.system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.jsp.dao.*;
import com.jsp.dto.*;
import com.jsp.system.DBConnector;

@WebServlet("/api/deleteReply3")
public class DeleteReply3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	JSONObject result = new JSONObject();
    	  
    	try (DBConnector con = new DBConnector();) {
    		int replyNum3 = Integer.parseInt(request.getParameter("replyNum3"));
            ReplyDao3 rmap = con.OpenMap(request, ReplyDao3.class);


            // 댓글 삭제
            rmap.deleteReplyInfo3(replyNum3);
            result.put("success", true);
            result.put("message", "게시글 삭제 성공");
           
        } catch (Exception e) {
        	 e.printStackTrace();
             result.put("success", false);
             result.put("message", "게시글 삭제 실패");
        }
    	 response.getWriter().write(result.toString());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}

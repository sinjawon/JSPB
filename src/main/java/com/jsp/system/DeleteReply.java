//삭제
package com.jsp.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.jsp.dao.ReplyDao;
import com.jsp.dto.ReplyInfo;

@WebServlet("/api/deleteReply")
public class DeleteReply extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	JSONObject result = new JSONObject();

    	

        try (DBConnector con = new DBConnector()) {
        	int replyNum = Integer.parseInt(request.getParameter("replyNum"));
            ReplyDao map = con.OpenMap(request, ReplyDao.class);

            // 댓글 삭제
            map.deleteReplyInfo(replyNum);

            result.put("success", true);
            result.put("message", "게시글 삭제 성공");

            // 성공 여부를 JSON으로 응답
//            response.setContentType("application/json");
//            response.getWriter().write("{\"success\": true}");
        } catch (Exception e) {
            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            result.put("success", false);
            result.put("message", "게시글 삭제 실패");
        }
	  response.getWriter().write(result.toString());
    }
}

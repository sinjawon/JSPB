package com.jsp.board2;

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

@WebServlet("/api/updateReply2")
public class UpdateReply2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		int replyNum2 = Integer.parseInt(request.getParameter("replyNum2"));
		String updatedContents2 = request.getParameter("updatedContents2");

		System.out.println(request.getParameter("replyNum2"));
		System.out.println(replyNum2);
		System.out.println(request.getParameter("updatedContents2"));
		System.out.println(updatedContents2);

		try (DBConnector con = new DBConnector();) {
			ReplyDao2 rmap = con.OpenMap(request, ReplyDao2.class);

			// 댓글 수정
			rmap.updateReplyInfo2(updatedContents2, replyNum2);

		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("success", true);
		response.getWriter().write(jsonResponse.toString());
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
}

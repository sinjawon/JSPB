package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.jsp.dao.BoardDao;

@WebServlet("/api/editPost")
public class editPost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject result = new JSONObject();

        try (DBConnector dbConnector = new DBConnector();) {
            String boardListNum = request.getParameter("boardListNum");
            String userNickname = request.getParameter("userNickname");
            //유저네임 쓰나?
            String title = request.getParameter("title");
            String mainContents = request.getParameter("mainContents");

            
            
           
            BoardDao boardDao = dbConnector.OpenMap(request, BoardDao.class);
            boardDao.updateBoardInfo(title, mainContents, boardListNum);

            result.put("success", true);
            result.put("message", "게시글이 성공적으로 수정되었습니다.");

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "게시글 수정에 실패했습니다.");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result.toString());
    }
}

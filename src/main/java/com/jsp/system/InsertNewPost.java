//여기가 아닌거 같은데...

package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dao.BoardDao;

@WebServlet("/api/newPost")
public class InsertNewPost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String mainContents = request.getParameter("mainContents");
        String userNickname = request.getParameter("userNickname");

        try(DBConnector con = new DBConnector()){
            BoardDao map = con.OpenMap(request, BoardDao.class);
            map.insertNewBoard(title, mainContents, userNickname);
        } catch(Exception e) {
            System.out.println("오류");
        }
        response.sendRedirect("/boardList.jsp");
    }
}


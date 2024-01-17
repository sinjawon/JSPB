package com.jsp.board2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.jsp.dao.*;
import com.jsp.system.DBConnector;


// ImageUploads 서블릿에 이미지 경로 가져옴DB에 그냥 경로를 저장할까?
@WebServlet(urlPatterns = { "/api/getImagePaths2" })
public class GetImage2 extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int boardListNum2 = Integer.parseInt(req.getParameter("boardListNum2"));
        try (DBConnector con = new DBConnector();) {
            PostImageDao2 map = con.OpenMap(req, PostImageDao2.class);
            List<String> imagePaths2 = map.getImagePaths2(boardListNum2);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            JSONObject obj = new JSONObject();
            JSONArray array = new JSONArray();
            obj.put("paths2", array);
            for(String path2 : imagePaths2) {
            	array.put(path2);
            	System.out.println(array);
            }
            
//	            StringBuilder build= new StringBuilder("[");
//	            for (int i = 0; i < imagePaths.size(); i++) {
//	                build.append("\"").append(imagePaths.get(i)).append("\"");
//	                if (i < imagePaths.size() - 1) {
//	                    build.append(",");
//	                }
//	            }
//	            build.append("]");

            resp.getWriter().write(obj.toString());
            System.out.println("오브젝트" + obj.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



// 이지수 작성
// 글을 작성하고 확인 버튼 눌렀을 때 데이터가 전송되도록 만듬
// 지금은 db대신 json형식으로 텍스트 파일이 저장되게 만듬
package com.jsp.system;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;


@WebServlet("/api/savePostData")
public class BoardPostSave extends HttpServlet {

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String postData = sb.toString();
        System.out.println("됐냐?");

        // 받은 JSON 데이터 parse
        JSONObject jsonObject = new JSONObject(postData);
        String title = jsonObject.getString("title");
        String content = jsonObject.getString("mainContents");
        String userNickname = jsonObject.getString("userNickname");
        String createDate = jsonObject.getString("createDate");
        int recommended = jsonObject.getInt("recommended");
        
        // 필요한 데이터는 추가로 파싱
        
       
        try {
            // DB 연결 
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.101:1521:xe", "roh", "1234");
            String query = "INSERT INTO BoardInfo (title, content, author, create_date, recommended) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, title);
            pst.setString(2, content);
            pst.setString(3, userNickname);
            pst.setString(4, createDate);
            pst.setInt(5, recommended);
            
            //DB는 제목, 내용, 작성자, 작성시간, 
            
            
            pst.executeUpdate();
            
            // DB 작업 성공 시 클라이언트에 성공 응답 전송
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println("{ \"message\": \"데이터가 성공적으로 저장되었습니다.\" }");

            
        } catch (Exception e) {
            e.printStackTrace();
            
            System.out.println("DB 작업 중 오류가 발생했습니다.");
        }
    }
}
   
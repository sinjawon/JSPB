//미완성 코드
// 이지수 작성
// 글을 작성하고 확인 버튼 눌렀을 때 데이터가 전송되도록 만듬
// 지금은 db대신 json형식으로 텍스트 파일이 저장되게 만듬
package com.jsp.system;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/api/savePostData")
public class boardPostSave extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // JSON 데이터 받아옴
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder sb = new StringBuilder();
        //한줄씩 읽을거
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String postData = sb.toString();

        
        System.out.println("전송된 데이터: " + postData);

        // JSON 형식으로 보냄
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("{ \"message\": \"데이터가 성공적으로 저장되었습니다.\" }");
    }
}

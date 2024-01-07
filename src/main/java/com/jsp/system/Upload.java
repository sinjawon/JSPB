package com.jsp.system;

import java.io.IOException;
import java.util.Collection;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {
	"/upload/*"
})
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 5,
	maxFileSize = 1024 * 1024 * 100,
	maxRequestSize = 1024 * 1024 * 500
)
public class Upload extends HttpServlet{
	
	   private static final long serialVersionUID = 1L;
	   
	   @Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			this.doPost(req, resp);
		}
	   @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	
	    	
	    	response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");

	        // 업로드된 파일을 저장할 디렉토리 경로 이건 내가 집에서 한건데 서버에서 들어온 친구로 하고싶거든
	        String uploadPath = "C:\\eclip\\workspace\\JSPB\\src\\main\\webapp\\WEB-INF\\resources\\img\\userprofile";
	        
	     
	        try {
	            // Part를 이용해 업로드된 파일 정보를 가져옴
	            Collection<Part> parts = request.getParts();
	            for (Part part : parts) {
	                if (part.getSubmittedFileName() != null) {
	                    String fileName = getFileName(part);
	                    String filePath = uploadPath + File.separator + fileName;

	                    // 파일을 지정된 경로로 복사
	                    try (InputStream in = part.getInputStream()) {
	                        Files.copy(in, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
	                    }

	                    response.getWriter().println("이미지 업로드 성공<br>");
	                    response.getWriter().println("파일 경로: " + filePath);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("이미지 업로드 실패: " + e.getMessage());
	        }
	    }

	    private String getFileName(Part part) {
	        for (String content : part.getHeader("content-disposition").split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return null;
	    }
}














package com.jsp.system;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jsp.dao.*;
import com.jsp.system.DBConnector;
import com.jsp.system.RandomStringGenerator;

@WebServlet(urlPatterns = { "/api/image/upload4" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 20, maxFileSize = 1024 * 1024 * 100, maxRequestSize = 1024 * 1024
		* 500)
public class ImageUploads4 extends HttpServlet {


	
	
	protected Part getParameter(Collection<Part> parts, String key) {
		for (Part part : parts) {
			if (part.getName().equalsIgnoreCase(key))
				return part;
		}
		return null;
	}
	
//확장자 토큰으로 반환해줌
	protected String getSignature(Part part) {
		String header = part.getHeader("Content-Disposition");
		String[] headers = header.split(";");
		for (String head : headers) {
			head = head.trim();
			if (head.startsWith("filename")) {
				String filename = head.split("=")[1];

				String token = filename.substring(filename.lastIndexOf('.'));
				token = token.substring(0, token.length() - 1);
				// 드랍존 오류인지 꼬랑지에 ;를 달고다님 잘라줬음

				return token;
			}
		}
		return "";
	}
	

//	private String[] imageOrder = new String[4];	//배열 미리 만들어놓기
//	
//	protected String[] nameContainer() {
//	    // 이미 배열 있으면 새로만들기 x
//	    if (imageOrder[0] == null) {
//	        for (int i = 0; i < 4; i++) {
//	            imageOrder[i] = RandomStringGenerator.generateRandomString(10);
//	        }
//	        Arrays.sort(imageOrder);
//	    }
//
//	    // 이미지 순서 배열 출력
//	    for (int i = 0; i < 4; i++) {
//	        System.out.println(i + "번째 이미지 이름 : " + imageOrder[i]);
//	    }
//
//	    return imageOrder;
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Collection<Part> parts = req.getParts();

		Part part = getParameter(parts, "boardImage");
		
		String token = getSignature(part);

		
		if (!Files.exists(Paths.get(getServletContext().getRealPath(
				String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day"))))))
			Files.createDirectories(Paths.get(getServletContext().getRealPath(
					String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day")))));
		System.out.println(Paths.get(getServletContext().getRealPath(
				String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day")))));


		while (true)
			try {
				String imageName4 = RandomStringGenerator.generateRandomString(10);
				
				Files.copy(part.getInputStream(), Paths.get(getServletContext().getRealPath(
						String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day"))
								+ "/" + imageName4 + token)));
				//이미지 저장
				
				try (DBConnector con = new DBConnector();) {
					// DB에 이미지 이름, 순서, 작성글 id 저장
					PostImageDao4 map = con.OpenMap(req, PostImageDao4.class);
					int boardListNum4 = map.getNewlyInsertedBoardId4();

					
					System.out.println("이미지가 가져오는 게시글 넘버 : " + boardListNum4);
					System.out.println(imageName4);
					
					 map.saveImage4(String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day"),imageName4 +token), boardListNum4);
						
					 
					 System.out.println(String.join("/", req.getParameter("year"), req.getParameter("month"), req.getParameter("day"),imageName4)+token);

					
				} catch (Exception e) {
				    e.printStackTrace();
					System.out.println("게시글 넘버 못받아옴");
				}
				break;
				
			} catch (Exception e) {

			}
	}
}

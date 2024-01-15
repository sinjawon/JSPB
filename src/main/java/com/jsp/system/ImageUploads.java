package com.jsp.system;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.ibatis.annotations.Select;

import com.jsp.dao.BoardDao;
import com.jsp.dao.PostImageDao;

@WebServlet(urlPatterns = {
	"/api/image/upload"
})
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 10,
	maxFileSize = 1024 * 1024 * 100,
	maxRequestSize = 1024 * 1024 * 500
)
public class ImageUploads extends HttpServlet{
	
	protected Part getParameter(Collection<Part> parts, String key) {
		for(Part part : parts) {
			if(part.getName().equalsIgnoreCase(key)) return part; 
		}
		return null;
	}
	
	protected String getSignature(Part part) {
		String header = part.getHeader("Content-Disposition");
		String[] headers = header.split(";");
		for(String head : headers) {
			head = head.trim();
			if(head.startsWith("filename")) {
				String filename = head.split("=")[1];

				String token = filename.substring(filename.lastIndexOf('.'));
				token = token.substring(0, token.length() - 1);
				//드랍존 오류인지 꼬랑지에 ;를 달고다님 잘라줬음

				return token;
			}
		}
		return "";
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Collection<Part> parts = req.getParts();
		Part part = getParameter(parts, "boardImage");
		String token = getSignature(part);
		
		
		int imageNum = 0;
		////////////////////////////////////////////////////////////////////
		String imageName = RandomStringGenerator.generateRandomString(10);//랜덤 이름용
		for(int i =0; i<imageNum; i++) {
		System.out.println(imageName);
		//리스트에 담고 이름 순으로 저장
		
		
		}
		
	    String imageOrder = req.getHeader("imageOrder");
	    System.out.println("이미지 숫자 : " +imageOrder);
	    
	    
	    // 비어있으면 안돼
	    if (imageOrder != null && !imageOrder.isEmpty()) {
	    	imageNum = Integer.parseInt(imageOrder);
		    System.out.println("몇번째 이미지인가 : " + imageNum);

	    }else {
	    	System.out.println("이미지 숫자가 안들어갔어요");
	    }
	
	    
        try (DBConnector con = new DBConnector();){
        	BoardDao map = con.OpenMap(req, BoardDao.class);
        	//최근에 추가된 id값 돌려줌            
        	int boardListNum = map.getNewlyInsertedBoardId();
        	System.out.println("최신 글을 받아왔는가" + boardListNum);
        	
        	//DB에 이미지 이름, 순서, 작성글 id 저장        	
        	PostImageDao map2 = con.OpenMap(req, PostImageDao.class);
            map2.saveImage(imageName, boardListNum, imageNum);
            
        } catch(Exception e) {
        	System.out.println("게시글 넘버 못받아옴");
        }
        
        
        
        
		if(!Files.exists(Paths.get(getServletContext().getRealPath(String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day"))))))
			Files.createDirectories(Paths.get(getServletContext().getRealPath(String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day")))));
		System.out.println(Paths.get(getServletContext().getRealPath(String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day")))));
		
		while(true) {
			try {
				Files.copy(part.getInputStream(), Paths.get(getServletContext().getRealPath(
					String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day")) + "/" + imageName + token
				)));
				break;
			}
			catch(Exception e) {
				System.out.println("이게 이름이 겹쳐?");
			}
		}
	}
}














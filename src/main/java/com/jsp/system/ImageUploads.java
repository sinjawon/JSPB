package com.jsp.system;

import java.io.IOException;
import java.nio.file.CopyOption;
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
		int i = 1; // 랜덤 이름용
		if(!Files.exists(Paths.get(getServletContext().getRealPath(String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day"))))))
			Files.createDirectories(Paths.get(getServletContext().getRealPath(String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day")))));
		while(true) {
			try {
				Files.copy(part.getInputStream(), Paths.get(getServletContext().getRealPath(
					String.join("/",req.getParameter("year"),req.getParameter("month"),req.getParameter("day")) + "/" + Integer.toString(i) + token
				)));
				break;
			}
			catch(Exception e) {++i;}
		}
	}
}














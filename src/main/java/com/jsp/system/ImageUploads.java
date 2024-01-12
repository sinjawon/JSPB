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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			String header = part.getHeader("Content-Disposition");
			String[] headers = header.split(";");
			for(String head : headers) {
				head = head.trim();
				if(head.startsWith("filename")) {
					String filename = head.split("=")[1];
					String token = filename.substring(filename.lastIndexOf('.'));
					token = token.substring(0, token.length() - 1);
					Files.copy(part.getInputStream(), Paths.get(getServletContext().getRealPath("1" + token)));
					break;
				}
			}
		}
	}
}














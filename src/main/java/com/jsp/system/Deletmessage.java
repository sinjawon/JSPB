

package com.jsp.system;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dao.*;

@WebServlet("/Deletmessage")
public class Deletmessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		this.doGet(request, response);
    } 
    @Override
    protected void doGet(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
    		throws ServletException, IOException {
    	req.getParameter("");
    	
    }
    
}

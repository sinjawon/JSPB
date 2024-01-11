<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지함</title>
</head>
<body>



<%  try(DBConnector con = new DBConnector();){
	
        		UserNoteDao note = con.OpenMap(request, UserNoteDao.class);
        		
        		UserNoteSeeDao cansee = con.OpenMap(request, UserNoteSeeDao.class);
        		
        	    String userNickName = (String)session.getAttribute("UserNickName");

        	    response.getWriter().write(userNickName);
        	    
        	    List<UserNote> ReceiveNotes = note.NoteReceiver(userNickName);
        	    response.getWriter().write("이건받았나");
        	    List<UserNote> SendNotes = note.NoteSender(userNickName);

        		 %>
	 <div id="sender">	
	 	<h2>발신목록</h2>
		<% for(UserNote ReceiveNote : ReceiveNotes) { %> 
		  <details> 
		     <summary><div><%=ReceiveNote.getNotetime()%></div>  <div><%=ReceiveNote.getSender()%></div></summary>
		       
		       <p><%=ReceiveNote.getNotecontent()%></p>
		        <p>나와나와라용요ㅛ</p>
		      
		     </details> 
		<% } %>
	 </div> 
 
  <div id="receiver">
  	 <h2>수신목록</h2>
	<% for(UserNote SendNote : SendNotes) { %> 
		  <details> 
		     <summary><div><%=SendNote.getNotetime()%></div>  <div><%=SendNote.getSender()%></div></summary>
		       
		       <p><%=SendNote.getNotecontent()%></p>
		        <p>나와나와라용요ㅛ</p>
		      
		     </details> 
		<% } %>
	 </div> 
 </div> 
 
 
 
 <%
}
        	catch(Exception e) {
        		e.printStackTrace();
        		response.getWriter().write("오류오류0");
        	} %>
</body>
</html>
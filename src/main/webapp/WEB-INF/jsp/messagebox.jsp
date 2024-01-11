<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
<!DOCTYPE html>
<html>
<head>

 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    
    <script src="/resources/modal.js" defer></script>
    
    <link rel="stylesheet" type="text/css" href="/resources/main.css" />
    
    <link rel="stylesheet" type="text/css" href="/resources/myreset.css" />
    <meta charset="UTF-8">
    <title>쪽지함</title>
</head>
<body>
<i class="fa-solid fa-circle-exclamation" style="color: #ff0000"></i> 
     <div type="button" class="main-note" id="open-modal">
      <i class="fa-regular fa-comments"></i>
    </div>

<%  try(DBConnector con = new DBConnector();){
	
        		UserNoteDao note = con.OpenMap(request, UserNoteDao.class);
        		
        		UserNoteSeeDao cansee = con.OpenMap(request, UserNoteSeeDao.class);
        		
        	    String userNickName = (String)session.getAttribute("UserNickName");

        	    response.getWriter().write(userNickName);
        	    
        	    List<UserNote> ReceiveNotes = note.NoteReceiver(userNickName);
        	    response.getWriter().write("이건받았나");
        	    List<UserNote> SendNotes = note.NoteSender(userNickName);

        		 %>
       <div id="modal" class="modal-content">
      <div class="modal">
        <h2>쪽지함</h2>
      	<div id="receiver" class="note-reception">
        <div class="note-title">받은쪽지</div>
	<% for(UserNote SendNote : SendNotes) { %> 
		  <details> 
		     <summary class="note-content"><div class="note-content-detail"><%=SendNote.getNotetime()%></div>  
		     								<div class="note-content-writer"><%=SendNote.getSender()%></div></summary>
		    
		       <p><%=SendNote.getNotecontent()%></p>
		        <p>나와나와라용요ㅛ</p>
		      
		     </details> 
		<% } %>
	 </div>  
 
	 <div id="sender">	
	 	<h2>발신목록</h2>
		<% for(UserNote ReceiveNote : ReceiveNotes) { %> 
		  <details> 
		     <summary><div><%=ReceiveNote.getNotetime()%></div>  <div><%=ReceiveNote.getSender()%></div></summary>
		       
		       <p><%=ReceiveNote.getNotecontent()%></p>
		        <p>나와나와라용요ㅛ</p>
		      
		     </details> 
		     <!-- x버ㅏ튼 추가하기 -->
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
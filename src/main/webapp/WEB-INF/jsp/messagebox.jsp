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
    
    <link rel="stylesheet" type="text/css" href="/resources/messagebox.css" />
    
    <link rel="stylesheet" type="text/css" href="/resources/myreset.css" />
    <meta charset="UTF-8">
    <title>쪽지함</title>
</head>
<body>
<i class="fa-solid fa-circle-exclamation" style="color: #ff0000"></i> 
     <div type="button" class="main-note" id="open-modal">
      <i class="fa-regular fa-comments"></i>
    </div>


<% 
  if(session.getAttribute("UserNickName") != null){
try(DBConnector con = new DBConnector();){
	
        		UserNoteDao note = con.OpenMap(request, UserNoteDao.class);
        		
        		UserNoteSeeDao cansee = con.OpenMap(request, UserNoteSeeDao.class);
        		
        	    String userNickName = (String)session.getAttribute("UserNickName");

        	    List<UserNote> ReceiveNotes = note.NoteReceiver(userNickName);
        	    
        	    List<UserNote> SendNotes = note.NoteSender(userNickName);

        		 %>
       <div id="modal" class="modal-content">
      <div class="modal">
        <h2>쪽지함</h2>
        
        <button type="button">sdsdsd</button>
        <button type="button">sdsdsd</button>
        <button type="button">sdsdsd</button>
       
        
      	<div id="receiver" class="note-reception">
        <div class="note-title">받은쪽지</div><%if(session.getAttribute("UserNickName") != null){%>
         
		<% for(UserNote ReceiveNote : ReceiveNotes) {
			
			String notenum = ReceiveNote.getNotenum();
			
			String seenum = cansee.GetcanSee(notenum);
			
			if("1".equals(seenum) || "3".equals(seenum)){
				
			%> 
		  <details> 
		     <summary class="note-content"><div class="note-content-detail"><%=ReceiveNote.getNotetime()%></div>  
		     								<div class="note-content-writer"><%=ReceiveNote.getSender()%></div></summary>
		    
		       <p class="note-content-div"><%=ReceiveNote.getNotecontent()%></p>
		      
		     </details> 
		      <form action="/deletmessege">
				    <input type="button" value="메세지삭제" name=<%=seenum %>>
				</form> 
				
			<%}%>
			<%}%>
			
<% }else{ %> <div>로그인을 해주세요</div>
	  <%}%>
	 </div> 
 
	 <div id="sender">	
        <div class="note-title2">보낸쪽지</div>
        <%if(session.getAttribute("UserNickName") != null){%>
         
		<% for(UserNote SendNote : SendNotes) { 
			
			String notenum = SendNote.getNotenum();
			
			String seenum = cansee.GetcanSee(notenum);
			 
			if("2".equals(seenum) || "3".equals(seenum)) {
			%> 
			  <details> 
			     <summary><div><%=SendNote.getNotetime()%></div>  <div><%=SendNote.getSender()%></div></summary>
			       <p><%=SendNote.getNotecontent()%></p>
			     </details>    
			     <form action="/deletmessege">
				    <input type="button" value="메세지삭제" name=<%=seenum%>>
				</form> 
			<%}%>
		<%}%>
<% }else{ %>
		 <div>로그인을 해주세요</div>
	  <%}%>
	 </div> 
	 
	 
 </div>
 
  <%
}
        	catch(Exception e) {
        		e.printStackTrace();
        		response.getWriter().write("오류오류0");
        	} 
}else{       	
        	%>
        <div>로그인을 해주세요<div>	
     <% }%> 
     
   <!--   setInterval(function() {
    // 주기적으로 실행할 코드
    let req5 = new XMLHttpRequest();
    req5.open("GET", "http://localhost:4885/app/messages.jsp", true);
    req5.send();
}, 5000); // 1000 밀리초마다 실행 (1초마다)  	 -->
        	
      
 

 
 
 
</body>
</html>
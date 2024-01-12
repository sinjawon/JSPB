<%@page import="org.w3c.dom.html.HTMLTableRowElement"%>
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



<% 
  if(session.getAttribute("UserNickName") != null){
try(DBConnector con = new DBConnector();){
	
        		UserNoteDao note = con.OpenMap(request, UserNoteDao.class);
        		
        		UserNoteSeeDao cansee = con.OpenMap(request, UserNoteSeeDao.class);
        		
        	    String userNickName = (String)session.getAttribute("UserNickName");

        	    response.getWriter().write(userNickName);
        	    
        	    List<UserNote> ReceiveNotes = note.NoteReceiver(userNickName);
        	    
        	    List<UserNote> SendNotes = note.NoteSender(userNickName);

        		 %>
	 <div id="sender">	
	 	<h2>발신목록</h2>
<%if(session.getAttribute("UserNickName") != null){%>
         
		<% for(UserNote ReceiveNote : ReceiveNotes) {
			
			String notenum = ReceiveNote.getNotenum();
			
			String seenum = cansee.GetcanSee(notenum);
			
			if("1".equals(seenum) || "3".equals(seenum)){
				
			%> 
			  <details> 
			     <summary><div><%=ReceiveNote.getNotetime()%></div>  <div><%=ReceiveNote.getSender()%></div></summary>
			       <p><%=ReceiveNote.getNotecontent()%></p>
			     </details>    
			     <form action="/deletmessege">
				    <input type="button" value="메세지삭제" name=<%=seenum %>>
				</form> 
				
			<%}%>
		<%}%>
<% }else{ %>
		 <div>로그인을 해주세요</div>
	  <%}%>
	 </div> 
 
  <div id="receiver">
  	 <h2>수신목록</h2>
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
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



<% 
  if(session.getAttribute("UserNickName") != null){
try(DBConnector con = new DBConnector();){
	
        		UserNoteDao note = con.OpenMap(request, UserNoteDao.class);
        		
        		UserNoteSeeDao cansee = con.OpenMap(request, UserNoteSeeDao.class);
        		
        	    String userNickName = (String)session.getAttribute("UserNickName");

        	    
        	    List<UserNote> ReceiveNotes = note.NoteReceiver(userNickName);
        	    
        	    List<UserNote> SendNotes = note.NoteSender(userNickName);
        	    
        	    List<String> Sended = new ArrayList<>();
        	    List<String> Received = new ArrayList<>();
        	    

        		 %>



<!-- 
    <i class="fa-solid fa-circle-exclamation" style="color: #ff0000"></i> -->
    <div type="button" class="main-note" id="open-modal">
      <i class="fa-regular fa-comments"></i>
    </div>

    <div id="modal" class="modal-content">
      <div class="modal">
        <h2>쪽지함</h2>
        <div class="notebtn-box">
          <button type="button" class="notebtn1">받은쪽지</button>
          <button type="button" class="notebtn2">보낸쪽지</button>
          <button type="button" class="notebtn3">쪽지쓰기</button>
        </div>
        
        <div id="sender" class="note-sendview">
          <div class="note-title">보낸쪽지</div>
          <%if(session.getAttribute("UserNickName") != null){%>
         
		<% for(UserNote ReceiveNote : ReceiveNotes) {
			
			String notenum = ReceiveNote.getNotenum();
			
			String seenum = cansee.GetcanSee(notenum);
			
			if("1".equals(seenum) || "3".equals(seenum)){
				Sended.add(notenum);
			%> 

          <details>
            <summary class="note-content">
              <div class="note-content-box">
                <div class="note-content-detail"><%=ReceiveNote.getNotetime()%></div>
                <div class="note-content-writer"><%=ReceiveNote.getSender()%></div>
              </div>
              <div class="note-xbtn">
                <form action="/deletmessege">
				   	<input type="hidden" name="seenum" value="<%=seenum%>">
			     	<input type="hidden"  name ="notenum" value="<%=notenum%>">
                  <button type="submit" class="deletebtn">
                    <i class="fa-solid fa-xmark fa-x"></i>
                  </button>
                </form>
              </div>
            </summary>

            <p class="note-content-div"><%=ReceiveNote.getNotecontent()%></p>
          </details>
          	
			<%}%>
		<%}%>
<% }else{ %>
		 <div>로그인을 해주세요</div>
	  <%}%>
	  
	  <% 
	   JSONArray jsonArray = new JSONArray(Sended); 
	 	String yesstt =	jsonArray.toString();	  
	  %>
	         <form action="/deletmessege">		  
			       <input type="text"  name ="SenddAll" value="<%=yesstt%>">
			       <input type="text"  name ="SendDeletAll" value="<%=Sended%>">
				   <button type="submit">보낸 메시지 모두삭제</button>
			  </form> 
	 </div> 
        
        
        <div id="receiver" class="note-reception">
          <div class="note-title">받은쪽지</div>
          <%if(session.getAttribute("UserNickName") != null){%>
         		
		<% for(UserNote SendNote : SendNotes) { 
			
			String notenum = SendNote.getNotenum();
			
			String seenum = cansee.GetcanSee(notenum);
			 
			if("2".equals(seenum) || "3".equals(seenum)) {
				Received.add(notenum);
			%> 
          <details>
            <summary class="note-content">
              <div class="note-content-box">
                <div class="note-content-detail"><%=SendNote.getNotetime()%></div>
                <div class="note-content-writer"><%=SendNote.getSender()%></div>
              </div>
              <div class="note-xbtn">
                <form action="/deletmessege">
			     	<input type="hidden" name="seenum" value="<%=seenum%>">
			     	<input type="hidden"  name ="notenum" value="<%=notenum%>">
                  <button type="submit" class="deletebtn"  >
                    <i class="fa-solid fa-xmark fa-x"></i>
                  </button>
                </form>
              </div>
            </summary>

            <p class="note-content-div"><%=SendNote.getNotecontent()%></p>
          </details>
          <%}%>
		<%}%>
<% }else{ %>
		 <div>로그인을 해주세요</div>
	  <%}%>
	  
	  <% 
	   JSONArray jsonArray2 = new JSONArray(Received);
	 	String yesstt2 = jsonArray.toString();	  
	  %>
	         <form action="/deletmessege">		  
			       <input type="text"  name ="SenddAll" value="<%=yesstt2%>">
			       <input type="text"  name ="SendDeletAll" value="<%=Received%>">
				   <button type="submit" class="showmessage">받은 메시지 모두삭제</button>
			  </form>
	
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
        
        

     
        <div class="note-write">
          <h2 class="note-title3">쪽지 작성</h2>
          <div class="note-write-form"> 
          <form action="/MessageServlet" method="POST" accept-charset="UTF-8">
            <input type="text" name="sender"  class="note-sender" value="<%=session.getAttribute("UserNum") %> " required/><br />
            <input
              type="text"
              name="receiver"
              placeholder="받는사람"
              class="note-receiver" 
              required><br />
            	<textarea name="content" placeholder="내용"  class="notereceiver-content" required></textarea
            ><br />
                <input type="submit" value="전송" class="write-btn"/>
            </div>
          </form>
        </div>

        <button id="close-modal">
          <i class="fa-solid fa-xmark fa-2x"></i>
        </button>
		</div>
    </div>

    

    

</body>
</html>
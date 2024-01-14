

package com.jsp.system;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.dao.*;
import com.jsp.dto.UserNoteSee;

@WebServlet("/Deletmessage/*")
public class Deletmessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		this.doGet(request, response);
    } 
    @Override
    protected void doGet(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
    		throws ServletException, IOException {
    	
    	 try (DBConnector con = new DBConnector()) {
    		 UserNoteSeeDao map = con.OpenMap(req,  UserNoteSeeDao.class);
    		
    	 String action = req.getPathInfo();
    	 req.setCharacterEncoding("UTF-8");
    	 resp.setCharacterEncoding("UTF-8");
    	 
    	 if ("/Send".equals(action)) {
    		 System.out.println("어 나왔어222");
		    	 String seenum = req.getParameter("seenum");
		    	 System.out.println("이게번호야"+seenum);
		    	 String notenum = req.getParameter("notenum");
		    	 if(seenum.equals("3")) {
		    		 seenum = "2";
		    	 }
		    	 else if(seenum.equals("1")){
		    		 seenum = "4";
		    	 }
		    	 map.SetcanSee(notenum, seenum);
		    	 resp.getWriter().println("발신삭제 완료"+notenum+","+seenum);
         }else if("/Receive".equals(action)){
	        	 String seenum = req.getParameter("seenum");
	        	 String notenum = req.getParameter("notenum");
	        	 if(seenum.equals("3")) {
	        		 seenum = "1";
	        	 }else if(seenum.equals("2")){
	        		 seenum = "4";
	        	 }
	        	 map.SetcanSee(notenum, seenum);
	        	 resp.getWriter().println("수신삭제 완료"+notenum+","+seenum);
 }else if ("/SendAll".equals(action)) {
        
        //문자열받고
        String a =  req.getParameter("seenums");
        String b =  req.getParameter("notenums");
        //다시 배열로 담고
        String[] anumStrings = a.replaceAll("[\\[\\]\\s]", "").replaceAll(",\\s*", ",").split(",");
        String[] bnumStrings = b.replaceAll("[\\[\\]\\s]", "").replaceAll(",\\s*", ",").split(",");
        String[] amodifiedArray = new String[anumStrings.length];
        //see 넘버 3->1 ,1->4 로 바꾸고
        for (int i = 0; i < anumStrings.length; i++) {
            String value = anumStrings[i];
            amodifiedArray[i] = "3".equals(value) ? "2" : "1".equals(value) ? "4" : value;
        }

        Map<String, String> myMap = createMap(bnumStrings, amodifiedArray);
        
        for (Map.Entry<String, String> entry : myMap.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            
            // map.setcansee 메서드를 사용하여 (키, 값) 추가
            map.SetcanSee(key, value);
        }
        resp.getWriter().println("발신 모두삭제 완료"+myMap);

}else if ("/ReceiveAll".equals(action)) {
			//문자열받고
	        String a =  req.getParameter("seenums");
	        String b =  req.getParameter("notenums");
	        //다시 배열로 담고
	        String[] anumStrings = a.replaceAll("[\\[\\]\\s]", "").replaceAll(",\\s*", ",").split(",");
	        String[] bnumStrings = b.replaceAll("[\\[\\]\\s]", "").replaceAll(",\\s*", ",").split(",");
	        String[] amodifiedArray = new String[anumStrings.length];
	        //see 넘버 3->2 ,2->4 로 바꾸고
	        for (int i = 0; i < anumStrings.length; i++) {
	            String value = anumStrings[i];
	            amodifiedArray[i] = "3".equals(value) ? "1" : "2".equals(value) ? "4" : value;
	        }

	        Map<String, String> myMap = createMap(bnumStrings, amodifiedArray);
	        
	        for (Map.Entry<String, String> entry : myMap.entrySet()) {
	            String key = entry.getKey();
	            String value = entry.getValue();
	            
	            // map.setcansee 메서드를 사용하여 (키, 값) 추가
	            map.SetcanSee(key, value);
	        }
	        resp.getWriter().println("수신 모두삭제 완료"+myMap);
		}
    	 
    	 
    	//트라이케치 
    	 } catch (Exception e) {
    		 
    		 resp.getWriter().println("오류");
         } 
    	//트라이케치  
    	
    }
    ///연숩
    public static Map<String, String> createMap(String[] keys, String[] values) {
        Map<String, String> resultMap = new HashMap<>();

        // 두 배열의 길이가 같은지 확인
        if (keys.length == values.length) {
            // 배열의 각 인덱스에 해당하는 값을 맵에 넣어주기
            for (int i = 0; i < keys.length; i++) {
                addKeyValue(resultMap, keys[i], values[i]);
            }
        } else {
            // 배열의 길이가 다르면 예외 처리 또는 다른 방법을 선택할 수 있음
            throw new IllegalArgumentException("두 배열의 길이가 일치하지 않습니다.");
        }

        return resultMap;
    }

    public static void addKeyValue(Map<String, String> map, String key, String value) {
        map.put(key, value);
    }
   //연슨 
}

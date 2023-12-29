<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
		<%-- 임시로 보기 좋으라고 --%>
        table {
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color:gray;
        }
    </style>
</head>
<body>

<h1>Board List</h1>
		
		<%-- 안에 채워진 건 다 임시로 보여주기용이다 실제가 아니다 --%>
		
		<%-- db에서 등록된 글을 가져오고 한페이지에 몇개를 보여줄까?
		한페이지에 글이 10개고 마지막 페이지에 글이 5개 라면 
		리스트 칸이 5개로 줄어드나? 아님 10개 칸 유지하고 밑에 5개 빈공간으로 보여줄까?
		다른 페이지로 이동하는 번호는 몇개씩 보여주지? 
		사진은 리스트에 보여줄건가 아님 텍스트만 보여줄건가?
		사진이 없는 글은 디폴트 이미지를 넣어주나?  --%>
        <table class="listArea">
           <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
           </thead>
           <tbody>
    		<tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
            </tr>
           </tbody>
           <tfoot>
           	<tr>
           		<td></td>
           		<td></td>
           		<td>임시 1,2,3,4,5 페이지 번호</td>
           		<td></td>
           		<td></td>
           	</tr>
           </tfoot>
        </table>
        
	<div class="searchBar">
   		<form action="</boardList" method="GET">
        	<label for="search">Search</label>
        		<input type="text" id="search" name="search">
        		<button type="submit">검색</button>
    			<a href="/writeBoard">글쓰기</a>
		 
   		</form>
	</div>



</body>
</html>
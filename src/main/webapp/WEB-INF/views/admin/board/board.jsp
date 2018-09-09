<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판</title>
<style>	
 		.btn_area {text-align:center;}
 		.btn {height: 35px; text-align:center;}
 		.table_form {height:150px; width: 500px; margin:100px auto; 
 					border:1px solid #444444; border-collapse: collapse;}
 		.table_form tfoot {text-align: center;}
 		th, td{
 			border: 1px solid #444444;
 			padding:10px;
 		}
 		.cap {padding: 10px;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function goBoardReg(){
	
	$("#board_list").attr("action", "goBoardReg");
	$("#board_list").submit();
}

function goBoardDel(){
	$("#board_list").attr("action", "goBoardDel");
	$("#board_list").submit();
}


</script>
</head>
<body>
<form id ="board_list" name="board_list" method="post">
<input type="hidden" name="b_no" id="b_no">
	<table class="table_form">
	<caption class="cap">게시판 리스트</caption>
	<thead>
			<tr>
				<th>  </th>
				<th>NO</th>
			    <th>제목</th>
			    <th>내용</th>
			    <th>작성자</th>
			</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${boardList}">
			<tr>
				<td><input type="checkbox" name="del_check" value="${item.b_no}">
			    <td>${item.b_no}</td>
			    <td>${item.b_title}</td>
			    <td>${item.b_content}</td>
			    <td>${item.e_name}</td>
		    </tr>
	 	</c:forEach>
	 
	</tbody>
	</table>
    <div class="btn_area">
    	<input type="submit" id="reg_btn" class="btn" value="등록" onclick="goBoardReg(); return false;">
    	<input type="submit" id="del_btn" class="btn" value="삭제 " onclick="goBoardDel(); return false;"> 
    </div>
</form>
</body>
</html>
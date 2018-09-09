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
 		.wdp_200 {width: 200px;}
 		.wdpht_200 {width: 200px; height:50px;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function goBoardInsert(){
		
		var formBoardList = $("form[name=boardRegForm]").serialize();

		$.ajax({
			type : "POST",
			url : "goBoardInsert",
			data : formBoardList,
			async: false,
			success : function(data){
			    if(data=='success'){
			    	alert("등록되었습니다.");
			    	location.href= "goBackboard";
			    }else{
			    	alert('등록 실패');
			    }
			},
			error : function(data){
				alert('등록 실패');
			}
		});
	}
	
	
	function goBackBoard(){
		location.href="goBackboard";
	}
</script>
</head>
<body>
<form id ="boardRegForm" name="boardRegForm" method="post" action="${path}/admin/board/userBoardReg/goBoardInsert.do">
<table class="table_form">
	<caption class="cap">게시글 작성</caption>
	<thead></thead>
	<tbody>
		<tr>
		<th scope="row">제목</th>
		<td><input type="text" id="b_title" name="b_title" class="wdp_200"></td>
		</tr>
		<tr>
		<th scope="row">내용</th>
		<td><input type="text" id="b_content" name="b_content" class="wdpht_200"></td>
		</tr>
	</tbody>
	</table>
    <div class="btn_area">
    	<button type="button" onclick="goBoardInsert(); return false;">등록</button> 
    	<input type="button" class="btn" value="취소"  onclick="goBackBoard();"> 
    </div>
    </form>
</body>
</html>
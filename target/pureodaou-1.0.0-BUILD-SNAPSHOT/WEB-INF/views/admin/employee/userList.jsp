<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
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

	function goReg(){
		
		var values = document.getElementsByName("del_check");
		
		for(var i=0;i < values.length;i++){
			if(values[i].checked == true){
				alert('체크박스가 클릭되어 등록페이지 이용이 제한됩니다.');
				return;
			}
		}
		$("#user_list").attr("action", "goReg");
		$("#user_list").submit();
	}
	
	function goDel(){
		var values = document.getElementsByName("del_check");
		var list =  new Array();
		
		for(var i=0;i < values.length;i++){
			if(values[i].checked == true){
				list[i] = values[i].value;
			}
		}
		$.ajax({
			type : "POST",
			url : "goDel",
			data :  {"list" : list},
			async: false,
			success : function(data){
			    if(data=='success'){
			    	alert("삭제되었습니다.");
			    	location.href= "goBackUser";
			    }else{
			    	alert('삭제 실패하였습니다.');
			    }
			},
			error : function(data){
				alert('삭제 실패하였습니다.');
			}
		});
	}
	
	function goUptForm(e_id){
		$("#e_id").val(e_id);
		document.user_list.submit();
	}
</script>

</head>
<body>
<form id ="user_list" name="user_list" method="post" action="goUptForm">
<input type="hidden" name="e_id" id="e_id">
	<table class="table_form">
	<caption class="cap">사용자 리스트</caption>
	<thead>
			<tr>
				<th>  </th>
				<th>ID</th>
			    <th>이름</th>
			    <th>부서</th>
			    <th>전화번호</th>
			    <th>비밀번호</th>
			</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${memberList}">
			<tr>
				<td><input type="checkbox" name="del_check" value="${item.e_id}">
			    <td><a href="#" onclick="goUptForm('${item.e_id}');">${item.e_id}</a></td>
			    <td>${item.e_name}</td>
			    <td>
			    ${item.e_dep}
			    </td>
			    <td>${item.e_tel}</td>
			    <td>${item.e_pw}</td>
		    </tr>
	 	</c:forEach>
	 
	</tbody>
	</table>
    <div class="btn_area">
    	<input type="submit" id="reg_btn" class="btn" value="등록" onclick="goReg(); return false;">
    	<input type="submit" id="del_btn" class="btn" value="삭제 " onclick="goDel(); return false;"> 
    </div>
</form>
</body>
</html>
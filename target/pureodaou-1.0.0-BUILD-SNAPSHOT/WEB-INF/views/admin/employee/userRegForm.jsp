<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<style>	
 		.btn_area {text-align:center;}
 		.btn {height: 35px; text-align:center;}
 		.table_form {height:100px; width: 500px; margin:100px auto; 
 					border:1px solid #444444; border-collapse: collapse;}
 		.table_form tfoot {text-align: center;}
 		th, td{
 			border: 1px solid #444444;
 			padding:10px;
 		}
 		.cap {padding: 10px;}
 		.wdp {width:90px;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function goInsert(){
		
		var formDataList = $("form[name=regForm]").serialize();

		$.ajax({
			type : "POST",
			url : "goInsert",
			data : formDataList,
			async: false,
			success : function(data){
			    if(data=='success'){
			    	alert("등록되었습니다.");
			    	location.href= "goBackUser";
			    }else{
			    	alert('등록 실패, 이미 존재하는 사번입니다!');
			    }
			},
			error : function(data){
				alert('등록 실패, 이미 존재하는 사번입니다!');
			}
		});
	}
	
	
	function goBackUser(){
		
		location.href="goBackUser";
	}
</script>

</head>
<body>
<form id ="regForm" name="regForm" method="post" action="${path}/admin/employee/userReg/goInsert.do">
<table class="table_form">
	<caption class="cap">사용자 등록</caption>
	<thead></thead>
	<tbody>
		<tr>
		<th scope="row">ID</th>
		<td><input type="text" id="e_id" name="e_id" class="wdp_90"></td>
		</tr>
		<tr>
		<th scope="row">이름</th>
		<td><input type="text" id="e_name" name="e_name" class="wdp_90"></td>
		</tr>
		<tr>
		<th scope="row">부서</th>
		<td>
		
		

		<select id="e_dep" name="e_dep" class="wdp_90">
			<c:forEach var="item" items="${deptList}">
				<option value="${item.dept_no}">${item.dept_name}</option>
			</c:forEach>
		</select>
	
		
		
		</td>
		</tr><tr>
		<th scope="row">전화전호</th>
		<td><input type="text" id="e_tel" name="e_tel" class="wdp_90"></td>
		</tr>
	</tbody>
	</table>
    <div class="btn_area">
    	<button type="button" onclick="goInsert(); return false;">등록</button> 
    	<input type="button" class="btn" value="취소"  onclick="goBackUser();"> 
    </div>
    </form>
</body>
</html>
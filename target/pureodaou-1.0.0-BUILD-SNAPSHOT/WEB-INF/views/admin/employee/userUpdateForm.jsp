<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 수정</title>
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
	
	function goUpdate(){
		var formDataList = $("form[name=uptForm]").serialize();

		$.ajax({
			type : "POST",
			url : "goUpdate",
			data : formDataList,
			async: false,
			success : function(data){
			    if(data=='success'){
			    	alert("수정되었습니다.");
			    	location.href= "goBackUser";
			    }else{
			    	alert('수정 실패!');
			    }
			},
			error : function(data){
				alert('수정 실패!');
			}
		});
	}

	function goBackUser(){
		location.href="goBackUser";
	}
</script>

</head>
<body>
<form id ="uptForm" name="uptForm" method="post" action="${path}/admin/employee/upadte/goUpdate.do">
<table class="table_form">
	<caption class="cap">사용자 수정</caption>
	<thead></thead>
	<tbody>

	<tr>
		<th scope="row">사번</th>
		<td>
			<input type="hidden" id="e_id" name="e_id" value="${memberView.e_id}" class="wdp_90" >
			<label>${memberView.e_id}</label> 
		</td>
		</tr>
		<tr>
		<th scope="row">이름</th>
		<td><input type="text" id="e_name" value="${memberView.e_name}" name="e_name" class="wdp_90"></td>
		</tr>
		
		<tr>
		<th scope="row">부서</th>
		<td>
			<select id="e_dep" name="e_dep" class="wdp_90">
				<c:forEach var="item" items="${deptList}">
					<option value="${item.dept_no}" <c:if test="${memberView.e_dep == item.dept_no}"> selected </c:if>>${item.dept_name}</option>
			 	</c:forEach>
			</select>
		</td>
		</tr>
		
		
		<tr>
		<th scope="row">전화전호</th>
		<td><input type="text" id="e_tel" value="${memberView.e_tel}" name="e_tel" class="wdp_90"></td>
		</tr>
	
	</tbody>
	</table>
    <div class="btn_area">
    	<button type="button" onclick="goUpdate();">수정</button> 
    	<input type="button" class="btn" value="취소"  onclick="goBackUser();"> 
    </div>
    </form>
</body>
</html>
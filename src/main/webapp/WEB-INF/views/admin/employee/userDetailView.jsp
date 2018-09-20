<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<%@ include file="../common/import.jsp"%>
<head>
	<style>
		.table {
			width: 90%;
			padding: 30px;
			margin-left: 30px;
			margin-bottom: 30px;
		}
		
		.btn {
			margin-right: 10px;
		}
		
		.btn_area {
			float: right;
			margin-top: 10px;
			margin-right: 10%;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
				<%@ include file="../common/lnb.jsp"%>
			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-left: 15px">
					<span class="span-font">Home > 회원관리</span>
				</h4>
				<hr>
				<br>
				<h2>
					<span class="span-font">회원 정보 상세보기</span>
				</h2>
				<p>
					<span class="span-font">풀어다우 서비스의 회원 리스트 입니다.</span> <br></br>
				<form id="user_list" name="user_list" method="post" action="employeeUpdtForm.daou">
					<input type="hidden" name="emp_id" id="emp_id">
					<table class="table">
						<thead>
							<tr>
							
								<th>ID</th>
								<th>이름</th>
								<th>부서</th>
								<th>직급</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${memberViewAll.emp_id}</td>
									<td>${memberViewAll.emp_name}</td>
									<td>${memberViewAll.d_quiz_cfg_code_name}</td>
									<td>${memberViewAll.g_quiz_cfg_code_name}</td>
									<td>${memberViewAll.emp_tel}</td>
								</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<button type="button" class="btn btn-default" onclick="goUpdtForm('${memberViewAll.emp_id}');">수정</button>	 
						<input type="button" class="btn btn-default" value="취소"
							onclick="goBackUser();">
					</div>
				</form>
				</div>
			</div>
		</div>
				<%@ include file="../common/footer.jsp"%>
					
	<script type="text/javascript">
	
		function goUpdtForm(emp_id) {
			$("#emp_id").val(emp_id);
			document.user_list.submit();
		}
	
		function goBackUser() {
			location.href = "employeeList.daou";
		}
	</script>
				
</body>
</html>
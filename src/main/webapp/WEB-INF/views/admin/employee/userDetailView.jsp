<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/admin.js"></script>

<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function goUpdtForm(emp_id) {
		$("#emp_id").val(emp_id);
		document.user_list.submit();
	}

	function goBackUser() {
		location.href = "employeeList.daou";
	}
</script>
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
			<div class="col-sm-4 sidenav">
				<div align="center">
					<img src="../resources/img/logo2.png" width="235px"
						style="padding-top: 20px;" />
				</div>
				<hr style="height: 2px; background-color: white">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#" onclick="goList('problemList');"
						id="problem_li">문제관리</a></li>
					<li><a href="#" id="exam_li">문제출제</a></li>
					<li><a href="#" onclick="goList('employeeList');"
						id="member_li">회원관리</a></li>
					<li><a href="#" id="write_li">기록관리</a></li>
					<li><a href="#" onclick="goList('boardList');" id="board_li">게시판관리</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-left: 15px">
					<span class="span-font">Home > 회원관리</span>
				</h4>
				<hr>
				<br>
				<h2>
					<span class="span-font">회원 리스트</span>
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
		
	<footer class="container-fluid">
		<p>
			개인정보처리방침 | 개인정보무단수집거부 | 이메일주소무단수집거부 | 윤리경영우)16878 경기도 용인시 수지구 디지털벨리로 81 다우디지털스퀘어 6층   대표전화 : 070-8707-1000   사업자등록번호 : 220-81-02810   대표이사: 김윤덕ⓒ 2018 DAOU Tech., INC. All rights reserved. </p>
		  
		<p>다우기술 인턴 과제 : 풀어다우</p>
	</footer>

</body>
</html>
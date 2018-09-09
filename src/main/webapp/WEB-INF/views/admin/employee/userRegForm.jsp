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


<script type="text/javascript">
	function goInsert() {
		var input_check = true;

		if ($("#e_id").val() == '') {
			input_check = false;
			alert("아이디는 필수 입력사항 입니다.");
			return;
		}
		if ($("#e_name").val() == '') {
			input_check = false;
			alert("이름은 필수 입력사항 입니다.");
			return;
		}
		if ($("#e_dep").val() == '') {
			input_check = false;
			alert("부서는 필수 입력사항 입니다.");
			return;
		}
		if ($("#e_tel").val() == '') {
			input_check = false;
			alert("전화번호는 필수 입력사항 입니다.");
			return;
		}
		if ($("#check_result").val() != 'success') {
			input_check = false;
			alert("아이디 중복확인을 해주세요.");
			return;
		}

		if (input_check == true) {
			var formDataList = $("form[name=regForm]").serialize();

			$.ajax({
				type : "POST",
				url : "employeeReg",
				data : formDataList,
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("등록되었습니다.");
						location.href = "employeeList";
					} else {
						alert('등록 실패하였습니다.');
					}
				},
				error : function(data) {
					alert('등록 실패하였습니다.');
				}
			});
		} else {
			return;
		}
	}

	function goBackUser() {
		location.href = "employeeList";
	}

	function duplicateCheck() {
		var id = $("#e_id").val();
		if ($("#e_id").val() == '') {
			alert('아이디를 입력해주세요.');
		} else {
			$.ajax({
				type : "POST",
				url : "employeeIdCheck",
				data : $("#e_id"),
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("가입할 수 있는 아이디 입니다.");
						$("#check_result").val('success');
					} else if (data == 'error') {
						alert('이미 가입한 아이디가 존재합니다.');
						return;
					}
				},
				error : function(data) {
					alert('이미 가입한 아이디가 존재합니다.');
				}
			});
		}
	}
</script>

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
				<form id="regForm" name="regForm" method="post">
					<table class="table">
						<thead></thead>
						<tbody>
							<tr>
								<th scope="row">ID</th>
								<td>
									<div>
										<input type="text" id="e_id" name="e_id" class="form-control"
											style="width: 1000px; margin-right: 10px; display: inline-block">
										<input type="button" id="btn_id_check" name="btn_id_check"
											class="btn btn-default" onclick="duplicateCheck();"
											value="중복확인"> <input type="hidden" id="check_result"
											name="check_result">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" id="e_name" name="e_name"
									class="form-control"></td>
							</tr>
							<tr>
								<th scope="row">부서</th>
								<td><select id="e_dep" name="e_dep" class="form-control">
										<c:forEach var="item" items="${deptList}">
											<option value="${item.dept_no}">${item.dept_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">전화전호</th>
								<td><input type="text" id="e_tel" name="e_tel"
									class="form-control"></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<button type="button" class="btn btn-default"
							onclick="goInsert(); return false;">등록</button>
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
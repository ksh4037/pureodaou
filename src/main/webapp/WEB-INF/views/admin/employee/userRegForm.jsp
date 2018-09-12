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

		if ($("#emp_id").val() == '') {
			input_check = false;
			alert("아이디는 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_name").val() == '') {
			input_check = false;
			alert("이름은 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_dept").val() == '') {
			input_check = false;
			alert("부서는 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_grade").val() == '') {
			input_check = false;
			alert("직급은 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_tel").val() == '') {
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
			if ($("#check_result").val() != 'success') {
				input_check = false;
				alert("아이디 중복확인을 해주세요.");
				return;
			}
			$.ajax({
				type : "POST",
				url : "employeeReg.daou",
				data : formDataList,
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("등록되었습니다.");
						location.href = "employeeList.daou";
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
		location.href = "employeeList.daou";
	}

	function duplicateCheck() {
		var id = $("#emp_id").val();
		if ($("#emp_id").val() == '') {
			alert('아이디를 입력해주세요.');
		} else {
			$.ajax({
				type : "POST",
				url : "employeeIdCheck.daou",
				data : $("#emp_id"),
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
				<%@ include file="../common/lnb.jsp"%>

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
										<input type="text" id="emp_id" name="emp_id" class="form-control"
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
								<td><input type="text" id="emp_name" name="emp_name"
									class="form-control"></td>
							</tr>
							<tr>
								<th scope="row">부서</th>
								<td><select id="emp_dept" name="emp_dept" class="form-control">
										<c:forEach var="item" items="${deptList}">
											<option value="${item.quiz_cfg_code}">${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">직급</th>
								<td><select id="emp_grade" name="emp_grade" class="form-control">
										<c:forEach var="item" items="${gradeList}">
											<option value="${item.quiz_cfg_code}">${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">전화전호</th>
								<td><input type="text" id="emp_tel" name="emp_tel"
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

	<%@ include file="../common/footer.jsp"%>

</body>
</html>
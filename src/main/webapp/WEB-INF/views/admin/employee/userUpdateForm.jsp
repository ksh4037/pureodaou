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
	function goUpdate() {
		var input_check = true;

		if ($("#emp_name").val() == '') {
			input_check = false;
			alert("이름은 필수 입력사항 입니다.");
			return;
		}
		if ($("#emp_dep").val() == '') {
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

		if (input_check == true) {
			var formDataList = $("form[name=uptForm]").serialize();
			$.ajax({
				type : "POST",
				url : "employeeUpdt.daou",
				data : formDataList,
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("수정되었습니다.");
						location.href = "employeeList.daou";
					} else {
						alert('수정 실패!');
					}
				},
				error : function(data) {
					alert('수정 실패!');
				}
			});
		} else {
			return;
		}
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
				<form id="uptForm" name="uptForm" method="post">
					<table class="table">
						<thead></thead>
						<tbody>
							<tr>
								<th scope="row">사번</th>
								<td><input type="hidden" id="emp_id" name="emp_id"
									value="${memberView.emp_id}" class="form-control"> <label>${memberView.emp_id}</label>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" id="emp_name"
									value="${memberView.emp_name}" name="emp_name" class="form-control"></td>
							</tr>

							<tr>
								<th scope="row">부서</th>
								<td><select id="emp_dept" name="emp_dept" class="form-control">
										<c:forEach var="item" items="${deptList}">
											<option value="${item.quiz_cfg_code}"
												<c:if test="${memberView.emp_dept == item.quiz_cfg_code}"> selected </c:if>>${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">직급</th>
								<td><select id="emp_grade" name="emp_grade" class="form-control">
										<c:forEach var="item" items="${gradeList}">
											<option value="${item.quiz_cfg_code}"
												<c:if test="${memberView.emp_grade == item.quiz_cfg_code}"> selected </c:if>>${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">전화전호</th>
								<td><input type="text" id="e_tel"
									value="${memberView.emp_tel}" name="emp_tel" class="form-control"></td>
							</tr>

						</tbody>
					</table>
					<div class="btn_area">
						<button type="button" class="btn btn-default"
							onclick="goUpdate();">수정</button>
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
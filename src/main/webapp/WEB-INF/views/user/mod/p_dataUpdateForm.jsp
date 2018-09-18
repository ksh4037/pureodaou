<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../mod/import.jsp"%>
<link href="./resources/css/user.css" rel="stylesheet" type="text/css">


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

	<div class="row content">
		<div class="content-header">
			<h4 style="color: #fff">Home</h4>
			<hr>

		</div>
		<div class="content-body">
			<h2>
				<span class="body-font"><%=session.getAttribute("emp_id")%>님
					환영합니다!</span>
			</h2>
			<h5></h5>
			<h4>
				<span class="body-font">풀어다우 서비스 메뉴 입니다.</span>
			</h4>
			<form id="updtForm" name="updtForm" method="post" class="form-body">
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
							<td><select id="emp_dep" name="emp_dep" class="form-control">
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
							<td><input type="text" id="emp_tel"
								value="${memberView.emp_tel}" name="emp_tel" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" id="emp_pw"
								 name="emp_pw" class="form-control"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" id="emp_pw_check" name="emp_pw_check"
								class="form-control"></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_area">
					<button type="button" class="btn btn-default" onclick="userUpdt();">수정</button>
					<input type="button" class="btn btn-default" value="취소"
						onclick="backUserMain();">
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="../mod/footer.jsp"%>
	
	<script type="text/javascript">
		function userUpdt() {
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
			if ($("#emp_pw").val() == '') {
				input_check = false;
				alert("패스워드는 필수 입력사항 입니다.");
				return;
			}
			if ($("#emp_pw").val() != $("#emp_pw_check").val()) {
				input_check = false;
				alert("패스워드가 일치하지 않습니다.");
				return;
			}
	
			if (input_check == true) {
				var formDataList = $("form[name=updtForm]").serialize();
				$.ajax({
					type : "POST",
					url : "userUpdt.daou",
					data : formDataList,
					async : false,
					success : function(data) {
						if (data == 'success') {
							alert("수정되었습니다.");
							location.href = "userMain.daou";
						} else {
							alert('1.수정 실패!');
						}
					},
					error : function(data) {
						alert('2.수정 실패!');
					}
				});
			} else {
				return;
			}
		}
	
		function backUserMain() {
			location.href = "userMain.daou";
		}
	</script>
</body>
</html>
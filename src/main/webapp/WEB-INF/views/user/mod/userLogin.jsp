<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="./resources/css/login.css" rel="stylesheet" type="text/css"></link>

<title>Login</title>

<script type="text/javascript">
	function goUserLogin() {
		if ($("#e_id").val().length < 1) {
			alert("사원번호를 입력해주세요.");
		} else if ($("#e_pw").val().length < 1) {
			alert("비밀번호를 입력해주세요.");
		} else {
			var formDataList = $("form[name=login]").serialize();

			$.ajax({
				type : "POST",
				url : "goUserLogin",
				data : formDataList,
				async : false,
				success : function(data) {
					if (data == 'success') {
						alert("로그인되었습니다.");
						location.href = "userMain";
					} else if (data == 'IDfail') {
						alert("등록되지 않은 사원번호입니다.");
					} else {
						alert('틀린 패스워드입니다.');
					}
				},
				error : function(data) {
					alert('로그인 실패하였습니다.');
				}
			});
		}
	}
</script>

</head>
<body style="background-color: #114a9b">
	<div class="container">
		<img src="./resources/img/logo2.png" width="325px"
			style="padding-top:  20px;" />
		<form id="login" name="login" method="post" class="form-horizontal">
			<table>
				<thead></thead>
				<tbody>
					<tr>
						<td><label class="control-label col-sm-2" for="e_id">아이디:</label></td>
						<td><input type="text" class="form-control" id="e_id"
							placeholder="사원번호를 입력하세요." name="e_id" size=100></td>
					</tr>
					<tr>
						<td><label class="control-label col-sm-2" for="e_pw">패스워드:</label></td>
						<td><input type="password" class="form-control" id="e_pw"
							placeholder="비밀번호를 입력하세요." name="e_pw" size=100></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="form-group">
			<input type="submit" id="login_btn" class="btn btn-default"
				value="로그인" onclick="goUserLogin();">
		</div>
		<div class="fix">
			<h5>
				**ID는 사원번호 입니다.<br></br> **초기 PW는 daou사원번호 입니다.
			</h5>
		</div>
	</div>
</body>
</html>



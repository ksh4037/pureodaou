<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <%
	if (session.getAttribute("e_id") == null) {
		response.sendRedirect("/pureodaou/");
	}
%> --%>
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
<script type="text/javascript" src="../../resources/js/admin.js"></script>

<link href="../../resources/css/admin.css" rel="stylesheet"
	type="text/css">

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
	function goExamMain() {
		$("#menu").attr("action", "user/examMain.do");
		$("#menu").submit();
	}
	function goExamRecord() {
		$("#menu").attr("action", "examRecord");
		$("#menu").submit();
	}

	function goUserBoard() {
		$("#menu").attr("action", "userBoard");
		$("#menu").submit();
	}
	function goUserLogout() {
		location.href = "goBackUserMain";
	}
	function goUserUpdate() {
		$("#menu").attr("action", "userUpdate");
		$("#menu").submit();
	}
</script>


</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-left: 15px">
					<span class="span-font">Home</span>
				</h4>
				<hr>
				<br>
				<h2>
					<span class="span-font">회원 리스트</span>
				</h2>
				<p>
					<span class="span-font">풀어다우 서비스의 회원 리스트 입니다.</span> <br></br>
				<form id="menu" name="menu" method="post">
					<div>
						<h3><%=session.getAttribute("e_id")%>님 환영합니다!
						</h3>
					</div>
					<div>
						<input class="form-control" type="submit" id="logout_btn"
							value="로그아웃" onclick="goUserLogout();">
					</div>
					<div>
						<input class="form-control" type="submit" id="userUpdt_btn"
							value="개인정보 수정" onclick="goUserUpdate();">
					</div>
					<div class="btn_area">
						<input class="form-control" type="submit" id="examMain_btn"
							class="btn" value="시험 보기" onclick="goExamMain();">
					</div>
					<br></br>
					<div class="btn_area">
						<input class="form-control" type="submit" id="examRecord_btn"
							class="btn" value="기록 보기" onclick="goExamRecord();">
					</div>
					<br></br>
					<div class="btn_area">
						<input class="form-control" type="submit" id="userBoard_btn"
							class="btn" value="게시판" onclick="goUserBoard();">
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
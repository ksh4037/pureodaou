<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	if (session.getAttribute("e_id") == null) {
		response.sendRedirect("UserLogout");
	}
%>
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

<link href="./resources/css/user.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	
		function goExamMain(){
			$("#menu").attr("action", "user/examMain.do");
			$("#menu").submit();
		}
		function goExamRecord(){
			$("#menu").attr("action", "examRecord");
			$("#menu").submit();
		}
	
		function goUserBoard(){
			$("#menu").attr("action", "userBoard");
			$("#menu").submit();
		}
		function goUserLogout(){
			location.href="userLogout";
		}
		function userUptForm(){
			$("#userUpdt_btn").val("e_id")
			 $("#userUpdt_btn").attr("action", "userUpdtForm");
			 $("#userUpdt_btn").submit();
		}
			
	</script>
</head>
<body>
	<div class="row content">
		<div class="content-header">
			<h4 style="color: #fff">Home</h4>
			<hr>
			<input class="btn btn-default" type="submit" id="logout_btn"
				value="로그아웃" onclick="goUserLogout();"> <input
				class="btn btn-default" type="submit" name="userUpdt_btn"
				id="userUpdt_btn" value="개인정보 수정"
				onclick="userUptForm(<%=session.getAttribute("e_id")%>);">
		</div>
		<div class="content-body">
			<h2>
				<span class="body-font"><%=session.getAttribute("e_id")%>님
					환영합니다!</span>
			</h2>
			<h5></h5>
			<h4>
				<span class="body-font">풀어다우 메인페이지 입니다.</span>
			</h4>
			<form id="menu" name="menu" method="post" class="form-body">
				<input class="form-control" type="submit" id="examMain_btn"
					value="시험 보기" onclick="goExamMain();"><br></br> <input
					class="form-control" type="submit" id="examRecord_btn"
					value="기록 보기" onclick="goExamRecord();"> <br></br> <input
					class="form-control" type="submit" id="userBoard_btn" value="게시판"
					onclick="goUserBoard();">
			</form>
		</div>
	</div>
	<div>
		<footer class="container-fluid">
			<p>개인정보처리방침 | 개인정보무단수집거부 | 이메일주소무단수집거부 | 윤리경영우)16878 경기도 용인시 수지구
				디지털벨리로 81 다우디지털스퀘어 6층 대표전화 : 070-8707-1000 사업자등록번호 : 220-81-02810
				대표이사: 김윤덕ⓒ 2018 DAOU Tech., INC. All rights reserved.</p>
			<p>다우기술 인턴 과제 : 풀어다우</p>
		</footer>
	</div>
</body>
</html>
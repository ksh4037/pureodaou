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

</head>
<body>
	<div class="row content">
		<div class="content-header">
			<h4 style="color: #fff">Home</h4>
			<hr>
			<input class="btn btn-default" type="submit" id="logout_btn" value="로그아웃" onclick="goUserLogout();">
			<form id="user_list" name="user_list" method="post" action="userUpdtForm.daou"> 
				<input type="hidden" name="emp_id" id="emp_id">
				<button type="button" class="btn btn-default" onclick="userUptForm(${sessionScope.emp_id});">개인정보 수정</button>	 
			</form>

		</div>
		<div class="content-body">
			<h2>
				<span class="body-font"><%=session.getAttribute("user_emp_id")%>님
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
					value="기록 보기" onclick="goExamRecord();"> <br></br> 
			</form>
		</div>
	</div>
	
	<%@ include file="../mod/footer.jsp"%>
		
	<script type="text/javascript">
			function goExamMain(){
				$("#menu").attr("action", "user/exam/examlist.daou");
				$("#menu").submit();
			}
			function goExamRecord(){
				$("#menu").attr("action", "/user/exam/recordList.daou");
				$("#menu").submit();
			}
			function goUserLogout(){
				location.href="userLogout.daou";
			}
			function userUptForm(emp_id){
				$("#emp_id").val(emp_id);
				document.user_list.submit();
			}
	</script>
</body>
</html>
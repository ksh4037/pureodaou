<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	if (session.getAttribute("emp_id") == null) {
		response.sendRedirect("login.daou");
	}
%>

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
					<input style="float: right" type="submit" id="logout_btn"
						class="btn btn-default" value="로그아웃"
						onclick="goLogout(); return false;"> <br>
					<hr>
					<br>
					<h2>
						<span class="span-font">회원 리스트</span>
					</h2>
					<p>
					<span class="span-font">풀어다우 서비스의 회원 리스트 입니다.</span> <br></br>
						
					<form id="user_list" name="user_list" method="post" action="userDetailView.daou">
						<input type="hidden" id="emp_id" name ="emp_id">
						<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>이름</th>
									<th>부서</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${memberList}">
									<tr>
										<td><input type="checkbox" name="del_check" value="${item.emp_id}">
										<td>
											<a href="#" onclick="userDetailView('${item.emp_id}');">${item.emp_id}</a>
										</td>
										<td>${item.emp_name}</td>
										<td>${item.d_quiz_cfg_code_name}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="btn_area">
							<input type="submit" id="reg_btn" class="btn btn-default"
								value="등록" onclick="goReg(); return false;"> 
							<input type="submit" id="del_btn" class="btn btn-default" value="삭제 "
								onclick="goDel(); return false;">
						</div>
					</form>
	
	
				</div>
			</div>
		</div>
	
		<%@ include file="../common/footer.jsp"%>
		
		<script type="text/javascript">
			function goReg() {
		
				var values = document.getElementsByName("del_check");
		
				for (var i = 0; i < values.length; i++) {
					if (values[i].checked == true) {
						alert('체크박스가 클릭되어 등록페이지 이용이 제한됩니다.');
						return;
					}
				}
				$("#user_list").attr("action", "employeeRegForm.daou");
				$("#user_list").submit();
			}
		
			function goDel() {
				var values = document.getElementsByName("del_check");
				var list = new Array();
		
				for (var i = 0; i < values.length; i++) {
					if (values[i].checked == true) {
						list[i] = values[i].value;
					}
				}
				$.ajax({
					type : "POST",
					url : "employeeDlt.daou",
					data : {
						"list" : list
					},
					async : false,
					success : function(data) {
						if (data == 'success') {
							alert("삭제되었습니다.");
							location.href = "employeeList.daou";
						} else {
							alert('삭제 실패하였습니다.');
						}
					},
					error : function(data) {
						alert('삭제 실패하였습니다.');
					}
				});
			}
		
			function userDetailView(emp_id) {
				
				$("#emp_id").val(emp_id);
				$("#user_list").submit();			
			}
		
			function goLogout() {
				location.href = "login.daou";
			}
		</script>
	
	</body>
</html>

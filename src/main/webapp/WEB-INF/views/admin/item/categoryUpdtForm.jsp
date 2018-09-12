<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<%@ include file="import.jsp"%>
<body>
	<div class="container">
		<h2 style="color: #5bc0de">카테고리 등록 페이지</h2>
		<p class="span-font">카테고리 등록 페이지 입니다.</p>
		<form name="clistForm" method="post" action="catgoryUpdt">
			<input type="hidden" id="c_seq" name="c_seq" value="${categoryDetail.c_seq}">
			<table class="table table-hover">
				<tr>
					<td>
						<div class="form-group">
							<label for="inputdefault">카테고리명 </label> 
							<input type="text" class="form-control" id="c_name" name="c_name" placeholder="카테고리명을 입력해주세요." value="${categoryDetail.c_name}" />
						</div>
					</td>
				</tr>
			</table>

			<table class="table table-hover">
				<tr>
					<td>
						<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
						<input type="button" value="수정" onclick="goUpdt(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script type="text/javascript">
		function goList() {
			location.href = "categoryList";
		}

		function goUpdt() {
			var queryString = $("form[name=clistForm]").serialize();

			$.ajax({
				type : "POST",
				url : "categoryUpdt",
				data : queryString,
				async : false,
				success : function(data) {
					if (data == "success") {
						alert("수정되었습니다.");
						location.href = "categoryList";
					} else if (data == "error") {
						alert("수정에 실패하였습니다.");
						return;
					}
				},
				error : function(data) {
					alert("수정에 실패하였습니다.");
					return;
				}
			});

		}
	</script>
</body>
</html>
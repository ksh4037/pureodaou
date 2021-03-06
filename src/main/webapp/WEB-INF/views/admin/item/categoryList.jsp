<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<%@ include file="../common/import.jsp"%>
<body>

	<div class="container">
		<h2>
			<span style="color: #5bc0de">카테고리 관리</span>
		</h2>
		<p>
			<span class="span-font">풀어다우 서비스의 문제 카테고리 정보입니다.</span>
		</p>

		<form name="clistForm" id="clistForm" method="post" action="categoryDetail.daou">
			<input type="hidden" name="category_no" id="category_no" /> 
			<input type="hidden" name="caller" value="detail" />
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck" onclick="allChk(this,'category');" /></th>
						<th>No.</th>
						<th>카테고리명</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${!empty categoryList}">
						<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
							<tr>
								<td><input type="checkbox" name="del_check" id="del_check"value="${categoryList.category_no}"></td>
								<td>${status.index+1}</td>
								<td><a href="javascript:void(0);" onclick="goDetail('${categoryList.category_no}');">${categoryList.category_name}</a></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty categoryList}">
						<tr>
							<td colspan="5"><center>등록된 카테고리 정보가 없습니다.</center></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</form>

			<input type="button" value="삭제" onclick="goDel();" class="btn btn-default" style="float: right" /> 
			<input type="button" value="카테고리 등록" onclick="goCtgRegForm();" class="btn btn-default" style="float: right; margin-right: 5px" />
	</div>



	<script type="text/javascript">
		function goDetail(category_no) {
			$("#category_no").val(category_no);
			document.clistForm.submit();
		}

		function goCtgRegForm() {
			location.href = "categoryRegForm.daou";
		}

		function goDel() {

			var chk = document.getElementsByName("del_check"); // 체크박스객체를 담는다
			var len = chk.length; //체크박스의 전체 개수
			var checkRow = ''; //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0; //체크된 체크박스의 개수
			var checkLast = ''; //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = ''; //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;

			for (var i = 0; i < len; i++) {
				if (chk[i].checked == true) {
					checkCnt++; //체크된 체크박스의 개수
					checkLast = i; //체크된 체크박스의 인덱스
				}
			}

			for (var i = 0; i < len; i++) {
				if (chk[i].checked == true) { //체크가 되어있는 값 구분
					checkRow = chk[i].value;

					if (checkCnt == 1) { //체크된 체크박스의 개수가 한 개 일때,
						rowid += "" + checkRow + ""; //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					} else { //체크된 체크박스의 개수가 여러 개 일때,
						if (i == checkLast) { //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += "" + checkRow + ""; //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						} else {
							rowid += "" + checkRow + ","; //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}

					cnt++;
					checkRow = ''; //checkRow초기화.
				}
			}

			if (rowid == '') {
				alert("삭제할 요소가 선택되지 않았습니다.");
			} else {
				$.ajax({
					type : "POST",
					url : "deleteChkCategory.daou",
					data : {
						"rowid" : rowid
					},
					async : false,
					success : function(data) {
						if (data == "success") {
							alert("삭제되었습니다.");
							location.href = location.href;
						} else if (data == "error") {
							alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
							return;
						}
					},
					error : function(data) {
						alert("삭제 실패하였습니다. \n다시 시도해주세요.");
						return;
					}
				});
			}
		}

	</script>

</body>
</html>
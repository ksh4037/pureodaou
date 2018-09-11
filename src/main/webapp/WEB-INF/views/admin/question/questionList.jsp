<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<%@ include file="import.jsp"%>
<body>
	<div class="container-fluid">
		<div class="row content">

			<%@ include file="lnb.jsp"%>

			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-bottom: 15px">
					<span class="span-font">Home > 문제관리</span>
				</h4>
				<hr>
				<br>
				<div class="container">
					<h2>
						<span class="span-font">문제리스트</span>
					</h2>
					<p>
						<span class="span-font">풀어다우 서비스의 전체 문제 정보입니다.</span>
					</p>

					<form name="listForm" id="listForm" method="post">
						<input type="hidden" name="q_seq" id="q_seq" />
						<table class="table">
							<thead>
								<tr>
									<th align="center"><input type="checkbox" id="allCheck" onclick="allChk(this);" /></th>
									<th align="center">No.</th>
									<th align="center" width="35%">문제내용</th>
									<th><center>문제유형</center></th>
									<th align="center"><center>카테고리</center></th>
									<th><center>등록자</center></th>
									<th><center>등록일</center></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty questionList}">
									<c:forEach items="${questionList}" var="questionList" varStatus="status">
										<tr>
											<td><input type="checkbox" name="del_check" id="del_check" value="${questionList.q_seq}"></td>
											<td align="left">${status.index+1}</td>
											<td><a href="#" onclick="goDetail('${questionList.q_seq}');">${questionList.q_contents}</a></td>
											
											<td align="center">
												<c:if test="${questionList.q_type == 1}"><span style="color: red">O/X</span></c:if>
												<c:if test="${questionList.q_type == 2}"><span style="color: red">객관식</span></c:if>
											</td>
											
											<td align="center">
												<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
													<c:if test="${questionList.c_seq == categoryList.c_seq}">
														<span style="color: red">${categoryList.c_name}</span>
													</c:if>
												</c:forEach>
											</td>
											
											<td align="center">${questionList.reg_id}</td>
											<td align="center">${fn:substring(questionList.reg_date,0,10)}</td>
										</tr>
									</c:forEach>
								</c:if>
								
								<c:if test="${empty questionList}">
									<tr>
										<td colspan="6"><center>등록된 문제 정보가 없습니다.</center></td>
									</tr>
								</c:if>

							</tbody>
						</table>
					</form>

					<input type="button" value="카테고리 관리" onclick="goCtgList();" class="btn btn-default" /> 
					<input type="button" value="삭제" onclick="goDel(); return false;" class="btn btn-default" style="float: right" /> 
					<input type="button" value="문제등록" onclick="goReg();" class="btn btn-default" style="float: right; margin-right: 5px" />
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
	
		function goDetail(q_seq) { //상세보기 페이지 이동
			$("#q_seq").val(q_seq);
			$("#listForm").attr("action", "questionDetail");
			$("#listForm").submit();
		}

		function goReg() { // 등록페이지 이동
			location.href = "questionRegForm";
		}


		function goDel() {  //삭제

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
					url : "deleteChkQuestion",
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

		function allChk(obj) {  //라디오버튼 전체선택
			var chkObj = document.getElementsByName("del_check");
			var rowCnt = chkObj.length - 1;
			var check = obj.checked;
			if (check) {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox")
						chkObj[i].checked = true;
				}
			} else {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox") {
						chkObj[i].checked = false;
					}
				}
			}
		}

		
		function goCtgList() { // 카테고리관리 페이지 이동 (팝업창 띄우기)
			var popUrl = "categoryList"; //팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no, ,scrollbars=yes"; //팝업창 옵션(optoin)

			window.open(popUrl, "", popOption);
		}
		
	</script>
</body>
</html>
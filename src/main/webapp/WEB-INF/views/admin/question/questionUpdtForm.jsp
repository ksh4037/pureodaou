<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

				<c:if test="${questionDetail.q_type == '1' }">
					<form name="ox_writeForm" id="ox_writeForm" method="post">
						<input type="hidden" name="q_seq" value="${questionDetail.q_seq}" /> 
						<input type="hidden" name="q_type" value="1" />
						<div class="container">
							<h2 class="span-font">O/X 문제 수정 페이지</h2>
							<p class="span-font">풀어다우 O/X 문제 수정 페이지 입니다.</p>

							<table class="table table-hover">

								<tr>
									<td width="7%">문제유형</td>
									<td>
										<span style="color: red">O/X</span>
									</td>
								</tr>

								<tr>
									<td width="7%">문제</td>
									<td>
										<textarea id="q_contents" name="q_contents" class="form-control" rows="20" cols="200">${questionDetail.q_contents}</textarea>
									</td>
								</tr>

								<tr>
									<td width="7%">카테고리</td>
									<td>
										<select name="c_seq" id="c_seq" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
												<option value="${categoryList.c_seq}" <c:if test="${questionDetail.c_seq == categoryList.c_seq}">selected</c:if>>${categoryList.c_name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>


								<tr>
									<td>정답</td>
									<td>
										<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
											<input type="radio" value="O" name="o_contents" <c:if test="${optionDetail.o_contents == 'O' }">checked</c:if> /> O
					        				<input type="radio" value="X" name="o_contents" <c:if test="${optionDetail.o_contents == 'X' }">checked</c:if> /> X
					        			</c:forEach>
					        		</td>
								</tr>
							</table>

							<table class="table table-hover">
								<tr>
									<td>
										<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
										<input type="button" value="수정" onclick="goUpdt('ox'); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</c:if>



				<c:if test="${questionDetail.q_type == '2' }">
					<form name="ch_writeForm" id="ch_writeForm" method="post">
						<input type="hidden" name="q_seq" value="${questionDetail.q_seq}" /> 
						<input type="hidden" name="answer_no" id="answer_no" /> 
						<input type="hidden" name="q_type" value="${questionDetail.q_type}" />
						
						<div class="container">
							<h2 class="span-font">객관식 문제 수정 페이지</h2>
							<p class="span-font">풀어다우 객관식 문제 수정 페이지 입니다.</p>

							<table class="table table-hover">
								<tr>
									<td width="7%">문제유형</td>
									<td>
										<span style="color: red">객관식</span>
									</td>
								</tr>

								<tr>
									<td width="7%">문제</td>
									<td>
										<textarea id="q_contents" name="q_contents" class="form-control" rows="20" cols="200">${questionDetail.q_contents}</textarea>
									</td>
								</tr>

								<tr>
									<td width="7%">카테고리</td>
									<td>
										<c:if test="${!empty categoryList}">
											<select name="c_seq" id="c_seq" class="form-control" style="width: 200px; height: 40px;">
												<option value="">카테고리 선택</option>
												<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
													<option value="${categoryList.c_seq}"<c:if test="${questionDetail.c_seq == categoryList.c_seq}">selected</c:if>>${categoryList.c_name}</option>
												</c:forEach>
											</select>
										</c:if> 
										
										<c:if test="${empty categoryList}">
											<select name="c_seq" id="c_seq" class="form-control" style="width: 200px; height: 40px;">
												<option value="">카테고리 정보가 없습니다.
												<option>
											</select>
										</c:if>
									</td>
								</tr>
							</table>

							<table class="table table-hover">
								<tr>
									<td>
										<a class="btn btn-fault" style="float: right;"><span style="color: red">정답여부</span></a> 
										<a href="javascript:void(0);" onclick="addOption();" class="btn btn-info" style="float: right; margin-right: 5px">보기추가</a>
									</td>
								</tr>
							</table>


							<table id="option" class="table table-hover">
								<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
									<tr>
										<td width="5%">보기 :</td>
										<td>
											<input type="text" class="form-control"id="o_contents" name="o_contents" value="${optionDetail.o_contents}" />
										</td>
										
										<td>
											<a href="javascript:void(0);" onclick="delOption(this);" class="btn btn-info">보기삭제</a>			
										</td>
										
										<td>
											<input type="radio" id="answer_seq" name="answer_seq" style="float: right; margin-right:35px"<c:if test="${optionDetail.answer_yn == 'Y'}">checked</c:if>>
										</td>
									</tr>
								</c:forEach>
							</table>

							<table class="table table-hover">
								<tr>
									<td>
										<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right; margin-right: 5px" /> 
										<input type="button" value="수정" onclick="goUpdt('choice'); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>


	<script type="text/javascript">
		// 문항추가버튼 클릭시
		function addOption() {
			var cell = '';
			cell += '<tr><td width="5%"> 보기 : </td>';
			cell += '<td><input type="text" class="form-control" id="o_contents" name="o_contents" /></td>';
			cell += '<td><a href="javascript:void(0);" onclick="delOption(this)" class="btn btn-info chDel">보기삭제</a></td>';
			cell += '<td><input type="radio" id="answer_seq" name="answer_seq" style="float:right;margin-right:35px"></td></tr>';

			$("#option").append(cell);

		}

		// 취소 삭제버튼 클릭시
		function delOption(obj) {

			mytable = document.getElementById('option');

			if (mytable.rows.length < 5) {
				alert("객관식 문항은 최소 4개 이상 이어야 합니다.");
				return;
			} else {
				var tr = $(obj).parent().parent();
				tr.remove();

			}
		}

		function goUpdt(form_type) {

			var input_check = goInputCheck(form_type);

			if (input_check == true) {

				if (form_type == 'choice') {

					$("#answer_no").val($('input[id="answer_seq"]:checked').index('input[id="answer_seq"]'));

					var queryString = $("form[name=ch_writeForm]").serialize();

					var option_contents = new Array();

					for (var i = 0; i < document.getElementsByName('o_contents').length; i++) {
						option_contents[i] = document.getElementsByName('o_contents')[i].value;
					}

					$.ajax({
						type : "POST",
						url : "questionUpdt",
						data : queryString,
						async : false,
						success : function(data) {
							if (data == "success") {
								alert("수정되었습니다.");
								location.href = "questionList";
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

				if (form_type == 'ox') {

					var queryString = $("form[name=ox_writeForm]").serialize();

					$.ajax({
						type : "POST",
						url : "questionUpdt",
						data : queryString,
						async : false,
						success : function(data) {
							alert("수정되었습니다.");
							location.href = "questionList";

						},
						error : function(data) {
							alert("수정에 실패하였습니다.");
						}
					});

				}
			} else {
				return;
			}
		}


		function goInputCheck(form_type) {

			var input_check = true;

			if (form_type == 'choice') {

				if ($('#ch_writeForm [name="q_contents"]').val().trim() == "") {
					alert("문제가 입력되지 않았습니다.");
					input_check = false;
				}

				if (input_check == true) {
					if ($('#ch_writeForm [name="c_seq"]').val() == '') {
						alert("카테고리가 선택되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}

				if (input_check == true) {
					for (var i = 0; i < $('#ch_writeForm [name="o_contents"]').length; i++) {
						if ($('#ch_writeForm [name="o_contents"]')[i].value == '') {
							alert((i + 1) + "번째 보기가 입력되지 않았습니다.");
							input_check = false;
							return input_check;
						}
					}
				}

				if (input_check == true) {
					var chkRadio = document.getElementsByName('answer_seq');
					var chk_cnt = 0;

					for (var i = 0; i < chkRadio.length; i++) {
						if (chkRadio[i].checked == true)
							chk_cnt++;
					}

					if (chk_cnt < 1) {
						alert("정답이 체크되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}

			}

			if (form_type == 'ox') {

				if ($('#ox_writeForm [name="q_contents"]').val().trim() == "") {
					alert("문제가 입력되지 않았습니다.");
					input_check = false;
				}

				if (input_check == true) {
					if ($('#ox_writeForm [name="c_seq"]').val() == '') {
						alert("카테고리가 선택되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}

				if (input_check == true) {
					if ($(':radio[name="o_contents"]:checked').length < 1) {
						alert('O/X 정답을 선택해주세요');
						input_check = false;
						return input_check;
					}
				}
			}

			return input_check;
		}
		
		function goList() {
			location.href = "questionList";
		}
	</script>
</body>
</html>
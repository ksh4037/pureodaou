<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
	<%@ include file="../common/import.jsp"%>
<body>

	<div class="container-fluid">
		<div class="row content">
			<%@ include file="../common/lnb.jsp"%>

			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-bottom: 15px">
					<span class="span-font">Home > 문제관리</span>
				</h4>
				<hr>
				<br>

				<div class="container">
					<span style="color: red">문제유형을 선택해주세요.</span>
					<br><br> 
					<input type="radio" name="type" onclick="typeChange('1');"> O/X &nbsp;&nbsp;&nbsp; 
					<input type="radio" name="type" onclick="typeChange('2');"> 객관식 &nbsp;&nbsp;&nbsp; 
					<input type="radio" name="type" onclick="typeChange('3');"> 주관식 
				</div>

				<form name="ox_writeForm" id="ox_writeForm" method="post" style="display: none">
					<input type="hidden" name="item_type" value="1" />
					<div class="container">
						<h2 class="span-font">O/X 문제 등록 페이지</h2>
						<p class="span-font">풀어다우 O/X 문제 등록 페이지 입니다.</p>

						<table class="table table-hover">

							<tr>
								<td width="7%">문제</td>
								<td><textarea class="form-control" id="item_title" name="item_title" rows="10" cols="170"> </textarea></td>
							</tr>
			
			
							<tr>
								<td width="7%">보충자료</td>
								<td><textarea class="form-control summernote" id="item_contents" name="item_contents" rows="20" cols="170"> </textarea></td>
							</tr>
							
							<tr>
								<td width="7%">카테고리</td>
								<td>
								
									<c:if test="${!empty categoryList}">
										<select name="category_no" id="category_no" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
												<option value="${categoryList.category_no}">${categoryList.category_name}</option>
											</c:forEach>
										</select>
									</c:if> 
									
									<c:if test="${empty categoryList}">
										<select name="category_no" id="category_no" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 정보가 없습니다.<option>
										</select>
									</c:if>
									
								</td>
							</tr>

							<tr>
								<td>정답</td>
								<td>
									<input type="radio" value="O" name="option_contents" /> O 
									<input type="radio" value="X" name="option_contents" /> X
								</td>
							</tr>
						</table>

						<table class="table table-hover">
							<tr>
								<td>
									<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
									<input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
								</td>
							</tr>
						</table>
					</div>
				</form>


				<form name="ch_writeForm" id="ch_writeForm" method="post" style="display:none">
					<input type="hidden" name="item_type" value="2" /> 
					<input type="hidden" name="answer_no" id="answer_no" />
					
					<div class="container">
						<h2 class="span-font">객관식 문제 등록 페이지</h2>
						<p class="span-font">풀어다우 객관식 문제 등록 페이지 입니다.</p>


						<table class="table table-hover">
							<tr>
								<td width="7%">문제</td>
								<td><textarea class="form-control" id="item_title" name="item_title" rows="10" cols="170"> </textarea></td>
							</tr>
			
			
							<tr>
								<td width="7%">보충자료</td>
								<td><textarea class="form-control summernote" id="item_contents" name="item_contents" rows="20" cols="170"> </textarea></td>
							</tr>
							

							<tr>
								<td width="7%">카테고리</td>
								<td>
									<c:if test="${!empty categoryList}">
										<select name="category_no" id="category_no" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
												<option value="${categoryList.category_no}">${categoryList.category_name}</option>
											</c:forEach>
										</select>
									</c:if> 
									
									<c:if test="${empty categoryList}">
										<select name="category_no" id="category_no"class="form-control" style="width: 200px; height: 40px;">
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
							<tr>
								<td width="5%">보기 :</td>
								<td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
								<td><a href="javascript:void(0);" onclick="delOption(this);" class="btn btn-info">보기삭제</a></td>
								<td><input type="radio" id="answer_seq" name="answer_seq" style="float: right; margin-right: 35px"></td>
							</tr>
							
							<tr>
								<td>보기 :</td>
								<td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
								<td><a href="javascript:void(0);" onclick="delOption(this);" class="btn btn-info">보기삭제</a></td>
								<td><input type="radio" id="answer_seq" name="answer_seq" style="float: right; margin-right: 35px"></td>
							</tr>
							
							<tr>
								<td>보기 :</td>
								<td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
								<td><a href="javascript:void(0);" onclick="delOption(this);" class="btn btn-info">보기삭제</a></td>
								<td><input type="radio" id="answer_seq" name="answer_seq" style="float: right; margin-right: 35px"></td>
							</tr>
							
							<tr>
								<td>보기 :</td>
								<td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>
								<td><a href="javascript:void(0);" onclick="delOption(this);" class="btn btn-info">보기삭제</a></td>
								<td><input type="radio" id="answer_seq" name="answer_seq" style="float: right; margin-right: 35px"></td>
							</tr>
						</table>

						<table class="table table-hover">
							<tr>
								<td>
									<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
									<input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</form>
				
				<form name="short_writeForm" id="short_writeForm" method="post" style="display:none">
					<input type="hidden" name="item_type" value="3" />
					<div class="container">
						<h2 class="span-font">주관식 문제 등록 페이지</h2>
						<p class="span-font">풀어다우 주관식 문제 등록 페이지 입니다.</p>

						<table class="table table-hover">

							<tr>
								<td width="7%">문제</td>
								<td><textarea class="form-control" id="item_title" name="item_title" rows="7" cols="170"> </textarea></td>
							</tr>
			
			
							<tr>
								<td width="7%">보충자료</td>
								<td><textarea class="form-control summernote" id="item_contents" name="item_contents" > </textarea></td>
							</tr>
							
							<tr>
								<td width="7%">카테고리</td>
								<td>
								
									<c:if test="${!empty categoryList}">
										<select name="category_no" id="category_no" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 선택</option>
											<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
												<option value="${categoryList.category_no}">${categoryList.category_name}</option>
											</c:forEach>
										</select>
									</c:if> 
									
									<c:if test="${empty categoryList}">
										<select name="category_no" id="category_no" class="form-control" style="width: 200px; height: 40px;">
											<option value="">카테고리 정보가 없습니다.<option>
										</select>
									</c:if>
									
								</td>
							</tr>

							<tr>
								<td>정답</td>
								<td>
									<textarea class="form-control" id="option_contents" name="option_contents" rows="10" cols="170"></textarea>
								</td>
							</tr>
						</table>

						<table class="table table-hover">
							<tr>
								<td>
									<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
									<input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
								</td>
							</tr>
						</table>
					</div>
				</form>

			</div>
		</div>
	</div>

<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		// 문항추가버튼 클릭시
		function addOption() {
			var cell = '';
			cell += '<tr><td width="60px">보기 : </td>';
			cell += '<td><input type="text" class="form-control" id="option_contents" name="option_contents" /></td>';
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

		function typeChange(type) {
			if (type == '1') {
				document.ch_writeForm.reset();
				document.short_writeForm.reset();
				$("#ch_writeForm").css('display', 'none');
				$("#short_writeForm").css('display', 'none');
				$("#ox_writeForm").css('display', 'block');
			}

			if (type == '2') {
				document.ox_writeForm.reset();
				document.short_writeForm.reset();
				$("#ox_writeForm").css('display', 'none');
				$("#short_writeForm").css('display', 'none');
				$("#ch_writeForm").css('display', 'block');
			}
			
			if (type == '3') {
				document.ox_writeForm.reset();
				document.ch_writeForm.reset();
				$("#ox_writeForm").css('display', 'none');
				$("#ch_writeForm").css('display', 'none');
				$("#short_writeForm").css('display', 'block');
			}
			
		}

		function goReg() {
			var input_check = goInputCheck();

			if (input_check == true) {

				if ($("#ch_writeForm").css('display') == 'block') {

					$("#answer_no").val($('input[id="answer_seq"]:checked').index('input[id="answer_seq"]'));

					var queryString = $("form[name=ch_writeForm]").serialize();
					var option_contents = new Array();

					for (var i = 0; i < document.getElementsByName('option_contents').length; i++) {
						option_contents[i] = document.getElementsByName('option_contents')[i].value;
					}
					

					$.ajax({
						type : "POST",
						url : "itemReg.daou",
						data : queryString,
						async : false,
						success : function(data) {
							if (data == "success") {
								alert("등록되었습니다.");
								location.href = 'itemList.daou';
							} else if (data == "error") {
								alert("등록에 실패하였습니다.");
								return;
							}
						},
						error : function(data) {
							alert("등록에 실패하였습니다.");
							return;
						}
					});
				}

				if ($("#ox_writeForm").css('display') == 'block') {

					var queryString = $("form[name=ox_writeForm]").serialize();

					$.ajax({
						type : "POST",
						url : "itemReg.daou",
						data : queryString,
						async : false,
						success : function(data) {
							if (data == "success") {
								alert("등록되었습니다.");
								location.href = "itemList.daou";
							} else if (data == "error") {
								alert("등록에 실패하였습니다.");
								return;
							}
						},
						error : function(data) {
							alert("등록에 실패하였습니다.");
						}
					});
				} 
				
				if ($("#short_writeForm").css('display') == 'block') {

					var queryString = $("form[name=short_writeForm]").serialize();

					$.ajax({
						type : "POST",
						url : "itemReg.daou",
						data : queryString,
						async : false,
						success : function(data) {
							if (data == "success") {
								alert("등록되었습니다.");
								location.href = "itemList.daou";
							} else if (data == "error") {
								alert("등록에 실패하였습니다.");
								return;
							}
						},
						error : function(data) {
							alert("등록에 실패하였습니다.");
						}
					});
				} 
				
				
			} else {
				return;
			}
		}

		function goList() {
			location.href = "itemList.daou";
		}

		function goInputCheck() {

			var input_check = true;

			if ($("#ch_writeForm").css('display') == 'block') {

				if ($('#ch_writeForm [name="item_title"]').val().trim() == "") {
					alert("문제가 입력되지 않았습니다.");
					input_check = false;
				}

				if (input_check == true) {
					if ($('#ch_writeForm [name="category_no"]').val() == '') {
						alert("카테고리가 선택되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}

				if (input_check == true) {
					for (var i = 0; i < $('#ch_writeForm [name="option_contents"]').length; i++) {
						if ($('#ch_writeForm [name="option_contents"]')[i].value == '') {
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

			else if ($("#ox_writeForm").css('display') == 'block') {

				if ($('#ox_writeForm [name="item_title"]').val().trim() == '') {
					alert("문제가 입력되지 않았습니다.");
					input_check = false;
				}

				if (input_check == true) {
					if ($('#ox_writeForm [name="category_no"]').val() == '') {
						alert("카테고리가 선택되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}

				if (input_check == true) {
					if ($(':radio[name="option_contents"]:checked').length < 1) {
						alert('O/X 정답을 선택해주세요');
						input_check = false;
						return input_check;
					}
				}

			}

			
			
			else if ($("#short_writeForm").css('display') == 'block') {

				if ($('#short_writeForm [name="item_title"]').val().trim() == '') {
					alert("문제가 입력되지 않았습니다.");
					input_check = false;
				}

				if (input_check == true) {
					if ($('#short_writeForm [name="category_no"]').val() == '') {
						alert("카테고리가 선택되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}
				
				if (input_check == true) {
					if ($('#short_writeForm [name="option_contents"]').val() == ''){
						alert("정답이 입력되지 않았습니다.");
						input_check = false;
						return input_check;
					}
				}
			}
			
			
			return input_check;
		}
		
	
	</script>

</body>
</html>
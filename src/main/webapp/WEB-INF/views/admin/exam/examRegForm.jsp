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
				<h4 class="s_title" style="padding-top:25px; padding-bottom:15px">
					<span class="span-font">Home > 출제관리 </span>
				</h4>
				<hr><br>

				<form name="exam_reg_form" id="exam_reg_form" method="post">
					<div class="container">
						<h2 class="span-font">출제하기 페이지</h2>
						<p class="span-font">풀어다우 출제 등록 페이지 입니다.</p>

						<table class="table table-hover">

							<tr>
								<th scope="row" width="15%">카테고리 설정</th>
								<td>
									<select id="exam_category"  name="exam_category" class="form-control" style="float:left; width:25%;">
									<option value="">카테고리를 선택하세요. </option>
										<c:forEach var="item" items="${categoryList}">
											<option value="${item.category_no}">${item.category_name}</option>
										</c:forEach>
									</select>
								</td>						
							</tr>
							
			
							<tr>
								<th scope="row">시험기간 설정</th>
								<td>
									<input type="text" name="exam_start_date" id="exam_start_date" class="form-control"  placeholder="시작일자를 지정하세요." style="float:left; width:20%; margin-right:15px;" readonly> 
									<input type="text" name="exam_end_date" id="exam_end_date" class="form-control"  placeholder="종료일자를 지정하세요."style="float:left; width:20%; margin-right:15px;" readonly> 		
								</td>
							
							</tr>

							<tr>
								<th scope="row">합격 커트라인 점수</th>
								<td>
									<input type="text" name="exam_pass_score" id="exam_pass_score" class="form-control" name="score" style="width:5%;float:left" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="3"/> &nbsp;&nbsp;점 
								</td>
							</tr>
							
							
							<tr style="height:70px">
								<th scope="row">부서</th>
								<td>
									<input type="checkbox" onclick="allChk(this, 'dept');" > 전체&nbsp;&nbsp;
									<c:forEach var="item" items="${deptList}">
										<input type="checkbox" name="emp_dept" id="emp_dept" value="${item.quiz_cfg_code}"> ${item.quiz_cfg_code_name} &nbsp;&nbsp;
									</c:forEach>
								</td>
							</tr>
							
							
							<tr style="height:70px">
								<th scope="row">직급</th>
								<td>
									<input type="checkbox" onclick="allChk(this, 'grade');"> 전체&nbsp;&nbsp;
									<c:forEach var="item" items="${gradeList}">
										<input type="checkbox" name="emp_grade" id="emp_grade" value="${item.quiz_cfg_code}" > ${item.quiz_cfg_code_name} &nbsp;&nbsp;
									</c:forEach>
								</td>
							</tr>

							
							<tr>
								<th scope="row">유형별 문제 수<br>(총 20문항)<br>(문제당 5점)</th>
								<td>
								<div style="float:left"><p style="margin-left:20%">O/X</p> <input type="text" name="exam_ox_num" id="exam_ox_num" class="form-control" name="score" style="width:50%" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="2"/></div>
								<div style="float:left"><p style="margin-left:15%">객관식</p> <input type="text" name="exam_obj_num" id="exam_obj_num" class="form-control" name="score" style="width:50%" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="2"/></div>
								<div style="float:left"><p style="margin-left:15%">주관식</p> <input type="text" name="exam_short_num" id="exam_short_num" class="form-control" name="score" style="width:50%" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="2"/></div>
								</td>
							</tr>
						</table>

						<table class="table table-hover">
							<tr>
								<td>
									<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
									<input type="button" value="출제" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
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
	
		$(document).ready(function() {  //datepicker 설정
		    $("#exam_start_date").datepicker();
		    $("#exam_end_date").datepicker();
		});
	
		function goList(){
			location.href="examList.daou";
		}
		
		function goReg(){
			
			if($("#exam_category").val() == ''  || $("#exam_category").val() == undefined){
				alert('카테고리가 선택되지 않았습니다.');
				return;
			}
			
			if($("#exam_start_date").val() == ''  || $("#exam_start_date").val() == undefined){
				alert('시작일자가 설정되지 않았습니다.');
				return;
			}
			
			if($("#exam_end_date").val() == ''  || $("#exam_end_date").val() == undefined){
				alert('종료일자가 설정되지 않았습니다.');
				return;
			}
			
			
			if($("#exam_pass_score").val() == ''  || $("#exam_pass_score").val() == undefined){
				alert('합격 점수가 입력되지 않았습니다.');
				return;
			}
			
			if(parseInt($("#exam_pass_score").val()) > 100){
				alert('총점은 100점 기준입니다.');
				return;
			}
			
			if($("input[name=emp_dept]:checked").val() == '' || $("input[name=emp_dept]:checked").val() == undefined){
				alert('부서가 선택되지 않았습니다.');
				return;
			}
			
			if($("input[name=emp_grade]:checked").val() == '' || $("input[name=emp_grade]:checked").val() == undefined){
				alert('직급이 선택되지 않았습니다.');
				return;
			}
	
			if($("#exam_ox_num").val() == ''  || $("#exam_ox_num").val() == undefined){
				alert('O/X 문제 개수가 입력되지 않았습니다.');
				return;
			}
			
			if($("#exam_obj_num").val() == ''  || $("#exam_obj_num").val() == undefined){
				alert('객관식 문제 개수가 입력되지 않았습니다.');
				return;
			}
			
			if($("#exam_short_num").val() == ''  || $("#exam_short_num").val() == undefined){
				alert('주관식 문제 개수가 입력되지 않았습니다.');
				return;
			}
			
			if(parseInt($("#exam_ox_num").val()) + parseInt($("#exam_obj_num").val()) + parseInt($("#exam_short_num").val()) != 20){
				alert('문제의 총 개수는 총 20문항 이어야 합니다.\유형별 문제 수를 다시 입력해주세요.');
				return;
			}
			

			if(parseInt($("#exam_short_num").val()) < 1){
				alert('주관식 문제는 반드시 1개이상 출제되어야 합니다.');
				return;
			}

			var queryString = $("form[name=exam_reg_form]").serialize();

			$.ajax({
				type : "POST",
				url : "examReg.daou",
				data : queryString,
				async : false,
				success : function(data) {
					if (data == "success") {
						alert("출제되었습니다.");
						location.href = "examList.daou";
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
		
	</script>
	
	
</body>
</html>
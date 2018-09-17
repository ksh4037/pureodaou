<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<%@ include file="../common/import.jsp"%>
	<head>
	    <title></title>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	    <script src="../resources/js/Chart.min.js"></script>
	    <script src="../resources/js/Chart.StackedBar.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row content">
				<%@ include file="../common/lnb.jsp"%>
				<div class="col-sm-9">
					<h4 class="s_title" style="padding-top: 25px; padding-left: 15px">
						<span class="span-font">Home > 현황보기</span>
					</h4>
					<hr>
					<br>
					<h2>
						<span class="span-font">시험 현황</span>
					</h2>
					<p>
						<span class="span-font">풀어다우 서비스의 시험 현황 입니다.</span> <br></br>
					<div>
					<form id="examSelectForm" name="examSelectForm" method="post">
						<table class="table">
							<tr>
								<th scope="row">회차 : </th>
								<td><select id="exam_degree" name="exam_degree" class="form-control">
										<c:forEach var="item" items="${degreeList}">
											<option value="${item.exam_degree}">${item.exam_degree}</option>
										</c:forEach>
								</select></td>
								<th scope="row">부서 : </th>
								<td><select id="dept_scType" name="dept_scType" class="form-control">
										<option value="all">전체</option>
										<c:forEach var="item" items="${deptList}">
											<option value="${item.quiz_cfg_code}">${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
								<th scope="row">직급 : </th>
								<td><select id="grade_scType" name="grade_scType" class="form-control">
										<option value="all">전체</option>
										<c:forEach var="item" items="${gradeList}">
											<option value="${item.quiz_cfg_code}">${item.quiz_cfg_code_name}</option>
										</c:forEach>
								</select></td>
								<td><button type="button" class="btn btn-default" onclick="search(); return false;">검색</button></td>
							</tr>
						</table>
					</form>
					</div>
					<div>
						<table class="table" style="width:300px; margin-left:20px; margin-top:20px">
							<tr>
								<th scope="row" style="width:120px">응시율</th><th style="width:10px"> </th>
								<td style="width:30px"><input type="text" id="examPercent" style="border:0px; text-align:right; width:40px"></td>
								<th style="width:20px">%</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">통과율</th><th style="width:10px"> </th>
								<td style="width:30px"><input type="text" id="passPercent" style="border:0px; text-align:right; width:40px"></td>
								<th style="width:20px">%</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">응시대상자</th><th style="width:5px">총</th>
								<td style="width:30px"><input type="text" id="examTargetAll" style="border:0px; text-align:right; width:40px"></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">현재응시자</th><th style="width:10px"> </th>
								<td style="width:30px"><input type="text" id="examTargetDo" style="border:0px; text-align:right; width:40px"></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">통과자</th><th style="width:10px"> </th>
								<td style="width:30px"><input type="text" id="passTarget" style="border:0px; text-align:right; width:40px"></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th>부서별 평균</th><th style="width:10px"> </th><td><input type="text" id="deptAverage" style="border:0px; text-align:right; width:40px"></td>
								<th>점</th>
							</tr>
							<tr>
								<th>직급별 평균</th><th style="width:10px"> </th><td><input type="text" id="gradeAverage" style="border:0px; text-align:right; width:40px"></td>
								<th>점</th>
							</tr>
						</table>
					</div>
					
					
					<div>
					<!--  
					<table class="table" style="width:400px; margin-left:20px; margin-top:20px">
					<tr>
						<td><button type="button" class="btn btn-default" onclick="deptAvg(); return false;">부서별 평균 보기</button></td>
						<th>회차별 부서별 평균</th><td><input type="text" id="deptAverage" style="border:0px; text-align:right; width:40px"></td>
						<th>점</th>
					</tr>
					<tr>
						<td><button type="button" class="btn btn-default" onclick="gradeAvg(); return false;">직급별 평균 보기</button></td>
						<th>회차별 직급별 평균</th><td><input type="text" id="gradeAverage" style="border:0px; text-align:right; width:40px"></td>
						<th>점</th>
					</tr>
					</table>-->
					
					<br>
					<button type="button" class="btn btn-default" onclick="wrongPercent(); return false;">오답률 보기</button>
						<table class="table" style="margin-top:30px; margin-left:20px">
							<thead>
								<tr>
									<th>순위</th>
									<th>문제번호</th>
									<th>문제</th>
									<th>오답률</th>
									<th>출제 횟수</th>
								</tr>
							</thead>
							<tbody>
							<tr>
							<td><input type="text" id="img"></td>
							<td><input type="text" id="result_table"></td>
							</tr>
								<c:forEach var="item" items="${wrongPercentNo}">
									<input type="text" id="wrongPercentNo">
								</c:forEach>
							<c:forEach var="i" begin="1" end="10">
									<tr>
										<td><c:set var="rankNum" value="0"/>
												<c:if test="${i ne 0}">
												 <c:set var = "sum" value="${rankNum+i}"/>${sum}
												</c:if>
										</td>
										<div id="textappend">
										
										</div>
										<!--  <td>
										</td>
										<td>${item.emp_name}</td>
										<td>${item.d_quiz_cfg_code_name}</td>-->
										<td><input type="text" id="setCount" style="border:0px; text-align:right; width:40px"></td>
									</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	  
		<%@ include file="../common/footer.jsp"%>
		<script>
			function search() {
				var formDataList = $("form[name=examSelectForm]").serialize();
				$.ajax({
					type : "POST",
					url : "examPercent.daou",
					data : formDataList,
					async : false,
					success : function(data) {
						console.log(data);
						if(data == "none"){
							alert("응시 대상자가 등록되어 있지 않습니다.");							
						}else if(data == "anybody"){
							alert("응시 대상자 중 시험에 응시한 사람이 없습니다.");	
						}else{
					   		$("#examPercent").val(data.examPercent);
					   		$("#examTargetAll").val(data.examTargetAll);
					   		$("#examTargetDo").val(data.examTargetDo);
					   		$("#passTarget").val(data.passTarget);
					   		$("#passPercent").val(data.passPercent);
					   		$("#setCount").val(data.setCount);
					   		$("#deptAverage").val(data.deptAverage);
					   		$("#gradeAverage").val(data.gradeAverage);
						}
					},
					error : function(data) {
						alert("에러 발생!");	
					}
				});
			}
			function wrongPercent() {
				var formDataList = $("form[name=examSelectForm]").serialize();
				$.ajax({
					type : "POST",
					url : "wrongPercent.daou",
					data : formDataList,
					dataType : "json",
					async : false,
					success : function(data) {
						console.log(data);
						for(var i = 0 ; i<data.length; i++){
							$("#textappend").append('<td>'+data[i].item_no+'</td>');
							
						}
					},
					error : function(data) {
						alert("에러 발생!");	
					}
				});
			}
		</script>
	</body>
</html>
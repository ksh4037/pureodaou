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
					<div class="col-sm-9">
					<div id="barchart_DOvalues" style="width:400px; height:100px; float:right"></div>
					<div style="width:370px; height: 500px; float:left">
						<table class="table" style="width:320px; margin-left:20px; margin-top:20px">
							<tr>
								<th scope="row" style="width:120px">응시율</th><th style="width:10px"> </th>
								<td style="width:50px"><input type="text" id="examPercent" style="border:0px; text-align:right; width:50px" disable></td>
								<th style="width:20px">%</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">통과율</th><th style="width:10px"> </th>
								<td style="width:50px"><input type="text" id="passPercent" style="border:none; text-align:right; width:50px" disable></td>
								<th style="width:20px">%</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">응시대상자</th><th style="width:5px">총</th>
								<td style="width:50px"><input type="text" id="examTargetAll" style="border:none; text-align:right; width:50px" disable></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">현재응시자</th><th style="width:10px"> </th>
								<td style="width:50px"><input type="text" id="examTargetDo" style="border:none; text-align:right; width:50px" disable></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th scope="row" style="width:120px">통과자</th><th style="width:10px"> </th>
								<td style="width:50px"><input type="text" id="passTarget" style="border:none; text-align:right; width:50px" disable></td>
								<th style="width:20px">명</th>
							</tr>
							<tr>
								<th>부서별 평균</th><th style="width:10px"> </th><td><input type="text" id="deptAverage" style="border:none; text-align:right; width:50px" disable></td>
								<th>점</th>
							</tr>
							<tr>
								<th>직급별 평균</th><th style="width:10px"> </th><td><input type="text" id="gradeAverage" style="border:none; text-align:right; width:50px" disable></td>
								<th>점</th>
							</tr>
						</table>
					</div></div>
					
					<div class="col-sm-9" style="margin-top:20px; margin-bottom:20px">
						<button type="button" class="btn btn-default" onclick="wrongPercent(); return false;">오답률 TOP10 보기</button>
					</div>
				
					<div>
						<table class="table" style="margin-top:30px; margin-left:20px; width:420px">
							<thead>
								<tr>
									<th style="text-align:center; width:60px">순위</th>
									<th style="text-align:center; width:100px">문제번호</th>
									<th style="text-align:center; width:100px">오답률</th><th> </th>
									<th style="text-align:center; width:100px">출제 횟수</th><th></th>
								</tr>
							</thead>
							<tbody id="textappend">
							
	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	  
		<%@ include file="../common/footer.jsp"%>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(search);
		</script>
		<script>
			function search() {
				$("#textappend").empty();
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
					   		
					   		var dataDo = google.visualization.arrayToDataTable([
						        ['examPercent', '도달 비율', '남은 비율',{ role: 'annotation' } ],
						        [$("#exam_degree").val()+'회차 응시율', Number($("#examPercent").val()), (100 - $("#examPercent").val()),''],
						        [$("#exam_degree").val()+'회차 통과율', Number($("#passPercent").val()), (100 - $("#passPercent").val()),'']
						      ]);
					   		
					   		
							var viewDo = new google.visualization.DataView(dataDo);
							viewDo.setColumns([0, 1,
					                       { calc: "stringify",
					                         sourceColumn: 1,
					                         type: "string",
					                         role: "annotation" }, 2]);

							 var options = {
							          isStacked: 'percent',
							          width: 600,
							          height: 300,
							          legend: {position: 'top', maxLines: 3},
							          hAxis: {
							            minValue: 0,
							            ticks: [0,.2,.4,.6,.8,1]
							          }
							        };
							var chartDo = new google.visualization.BarChart(document.getElementById('barchart_DOvalues'));
							chartDo.draw(viewDo, options);			
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
						  $.each(data,function(index,item){
								  var cell= '';
									cell += '<tr><td width="60px">'+(index+1)+'</td>';
									cell += '<td width="100px"><input style="border:none; text-align:center" type="text" class="form-control" id="item_no" name="item_no" value="'+item.item_no+'" disable/></td>';
									cell += '<td width="100px"><input style="border:none; text-align:right" type="text" class="form-control" id="result" name="result" value="'+item.result*100+'" disable/></td><th width="30px">%</th>';
									cell += '<td width="100px"><input style="border:none; text-align:right" type="text" class="form-control" id="total_count" name="total_count" value="'+item.total_cnt+'" disable/></td><th>번</th></tr>';
									 $("#textappend").append(cell);
						  });
					},
					error : function(data) {
						alert("에러 발생!");	
					}
				});
			}
		</script>
		
	</body>
</html>
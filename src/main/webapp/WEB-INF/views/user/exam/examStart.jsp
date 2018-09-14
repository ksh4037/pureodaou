<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.topbox {
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
}

td, th {
	text-align: center;
}

th {
	background-color: #EEEEEE;
}

table {
	border-color: #999999;
}
</style>
<script>
var startexam = function(degree,ox,obj,short_num, exam_category, exam_no){
	location.href="${pageContext.request.contextPath}/user/exam/getExam.daou?degree="+degree+"&ox_num="+ox+"&obj_num="+obj+"&short_num="+short_num+"&category="+exam_category+"&examNo="+exam_no;
}
</script>
</head>
<body>
	<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;">
		<div class="topbox"
			style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px; text-align: center;">
			평가 과제 안내</div>
		<div class="midbox"
			style="border-style: solid; border-width: 1px; padding: 25px; text-align: center;">
			<table class="table table-bordered">
				<tr>
					<th>카테고리</th>
					<td>${intro.category_name }</td>
				</tr>
				<tr>
					<th>제출상태</th>
					<td>${intro.uservo.exam_status }</td>
				</tr>
				<tr>
					<th>점수</th>
					<td></td>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>
					<th colspan="2">평가유형</th>
					<th>문항수</th>
					<th>배점</th>
					<th>총점</th>
					<th>비고</th>
				</tr>
				<tr>
					<th rowspan="3">과제</th>
					<th>OX형</th>
					<td>${intro.exam_ox_num }</td>
					<td>10</td>
					<td rowspan="3">100</td>
					<td rowspan="3">각 과제의 총점이 60점 미만(100점 만점 기준)의 경우 불합격</td>
				</tr>
				<tr>
					<th>객관식</th>
					<td>${intro.exam_obj_num }</td>
					<td>10</td>
				</tr>
				<tr>
					<th>주관식</th>
					<td>${intro.exam_short_num }</td>
					<td>10</td>
				</tr>
			</table>
			<div
				style="border-style: solid; border-width: 1px; margin-bottom: 20px;">
				<ul style="list-style: decimal;">
					<li>문제은행 방식을 채택, 과제 확인시 문항이 학습자마다 랜덤으로 배분됩니다.</li>
					<li>복사(Ctrl+V), 붙여넣기(Ctrl+V)기능이 차단 됩니다.</li>
					<li>중간저장 기능 제공합니다.</li>
					<li>최종제출 버튼을 클릭하셔야 과제 제출이 완료 됩니다.</li>
				</ul>
			</div>
			<input class="btn btn-primary" type="button" value="평가 시작하기"
				onclick="javascript:startexam(${intro.exam_degree},${intro.exam_ox_num },${intro.exam_obj_num },${intro.exam_short_num }, ${intro.exam_category}, ${intro.uservo.exam_no })">
		</div>
	</div>
</body>
</html>
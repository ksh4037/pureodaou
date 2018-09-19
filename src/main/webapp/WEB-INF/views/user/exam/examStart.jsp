<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="examheader.jsp" />
<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;">
	<div class="topbox"
		style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px; text-align: center;">
		평가 과제 안내</div>
	<div class="midbox"
		style="border-style: solid; border-width: 1px; padding: 25px; text-align: center;">
		<table class="table table-bordered">
			<tr>
				<th>과목</th>
				<td>${intro.category_name }</td>

			</tr>
			<tr>
				<th>제출상태</th>
				<td>${intro.uservo.status_name}</td>
			</tr>
			<tr>
				<th>남은시간</th>
				<td>${intro.uservo.exam_left_time }</td>
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
		<form method="post" action="/user/exam/getExam.daou">
			<input type="hidden" name="degree" value="${intro.exam_degree}">
			<input type="hidden" name="ox_num" value="${intro.exam_ox_num }">
			<input type="hidden" name="obj_num" value="${intro.exam_obj_num }">
			<input type="hidden" name="short_num"
				value="${intro.exam_short_num }"> <input type="hidden"
				name="category" value="${intro.exam_category}"> <input
				type="hidden" name="examNo" value="${intro.uservo.exam_no }">
			<input type="hidden" name="categoryName"
				value="${intro.category_name }"> <input type="hidden"
				name="exam_status" value="${intro.uservo.exam_status }"> <input
				type="submit" class="btn btn-primary" value="평가 시작하기">
		</form>
	</div>
</div>
<c:import url="examfooter.jsp" />
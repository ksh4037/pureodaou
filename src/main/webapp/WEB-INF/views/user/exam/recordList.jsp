<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="examheader.jsp" />
<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;">
	<div class="topbox"
		style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px;">
		<ul>
			<li>${id }님의과제목록입니다.</li>
			<li>각 평가의 점수와 답안을 확인 가능합니다</li>
			<li>각 평가당 총점 60점 이상(100점 만점 기준)이어야 수료입니다.</li>
		</ul>
	</div>
	<div class="midbox"
		style="border-style: solid; border-width: 1px; padding: 25px;">
		<table class="table table-hover">
			<tr style="background-color: #DDDDDD">
				<th>회차</th>
				<th>재시험회차</th>
				<th>과목</th>
				<th>점수</th>
				<th>합격여부</th>
				<th>오답노트</th>
			</tr>
			<c:forEach items="${rList }" var="r">
				<tr>
					<td>${r.exam_degree }회</td>
					<td><c:choose>
							<c:when test="${r.exam_retake_degree >0}">
								${r.exam_retake_degree }차
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose></td>
					<td>${r.category_name }</td>
					<td>${r.exam_score }점</td>
					<c:choose>
						<c:when test="${r.exam_status == 'status05'}">
							<td style="color: red;">불합격</td>
						</c:when>
						<c:when test="${r.exam_status == 'status04' }">
							<td style="color: blue;">합격</td>
						</c:when>
						<c:when test="${r.exam_status == 'status03' }">
							<td style="color: green;">채점중</td>
						</c:when>
					</c:choose>
					<td><c:choose>
							<c:when test="${r.exam_status == 'status03' }">
						-
					</c:when>
							<c:otherwise>
								<input class="btn btn-primary" id="${r.exam_no }" type="button"
									value="오답노트" onclick="javascript:go(${r.exam_no})">
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
	var go = function(examNo) {
		location.href = "${pageContext.request.contextPath}/user/exam/wrongAnswerNote.daou?examNo="+examNo;
	}
	</script>
<c:import url="examfooter.jsp" />
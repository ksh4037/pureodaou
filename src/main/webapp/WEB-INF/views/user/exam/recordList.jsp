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
</style>

</head>
<body>
	<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;">
		<div class="topbox"
			style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px;">
			<ul>
				<li>각 평가의 점수와 답안을 확인 가능합니다</li>
				<li>각 평가당 총점 60점 이상(100점 만점 기준)이어야 수료입니다.</li>
				<li>특이사항 혹은 오류에 관해서는 문의게시판 이용 부탁드립니다.</li>
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
						<td>${r.exam_score }</td>
						<c:choose>
							<c:when test="${r.exam_status == 'status04'}">
								<td style="color: red;">불합격</td>
							</c:when>
							<c:when test="${r.exam_status == 'status05' }">
								<td style="color: blue;">합격</td>
							</c:when>
						</c:choose>
						<td><input class="btn btn-primary" id="${r.exam_no }"
							type="button" value="오답노트" onclick="javascript:go(${r.exam_no})"></td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
	var go = function(examNo) {
		location.href = "${pageContext.request.contextPath}/user/exam/wrongAnswerNote.daou?type="+examNo;
	}
	</script>
</body>
</html>
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
<script type="text/javascript">
	/* $('.btn').on.click(function(){
		
	}) */
	var go = function(degree) {
		location.href = "";
	}
</script>
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
					<th>카테고리</th>
					<th>본 날짜</th>
					<th>유형</th>
					<th>점수</th>
					<th>오답노트</th>
				</tr>
				<c:forEach items="${elist }" var="e">
					<tr>
						<td>$</td>
						<td>정보보안</td>
						<td></td>
						<td>평가</td>
						<td>100</td>
						<c:choose>
							<c:if test="">
								<td>미완료</td>
							</c:if>
							<c:otherwise>
								<td><input class="btn btn-primary" id="${e.exam_test_no }"
									type="button" value="" onclick="javascript:go()"></td>
							</c:otherwise>
						</c:choose>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
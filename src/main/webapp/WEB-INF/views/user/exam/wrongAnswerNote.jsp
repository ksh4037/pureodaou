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

input[type=radio] {
	margin-right: 10px;
}
</style>
</head>
<body>
	<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;"
		oncontextmenu="return blockRightClick()">
		<div class="topbox"
			style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px;">
			<ul>
				<li>회차 : ${info.degree }</li>
				<li>과목 : ${info.categoryName}</li>
			</ul>
		</div>
		<form id="f">
			<div class="midbox"
				style="border-style: solid; border-width: 1px; padding: 25px; margin-bottom: 60px;">
				<%-- <c:set property="mlist" var="m"/> --%>
				<c:forEach items="${ilist }" var="item" varStatus="status">
					<div>
						<div style="border-style: solid; border-width: 1px; padding: 20px">
							<span style="font-size: 30px; color: orange;">${status.count }</span>
							<div style="display: inline-block;">
								<div
									style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">OX형
									: 10점</div>
							</div>
							<div style="padding-left: 20px;">${item.item_title }</div>
							<c:if test="${!item.item_contents == ''}">
								<div class="item_contents"
								style="padding: 20px; border-style: solid; border-width: 1px; width: 100%;">
								${item.item_contents }</div>
							</c:if>
						</div>
						<c:choose>
						<c:when test="${mlist[status.count-1].correct_yn=='N' }">
						<div style="padding: 20px; color: red;">틀렸습니다!</div>
						<div style="padding: 20px; width:100%; color: red;">제출 : ${mlist[status.count-1].exam_detail_answer }</div>
						</c:when>
						<c:when test="${mlist[status.count-1].correct_yn=='Y' }">
						<div style="padding: 20px; color: blue;">정답입니다!</div>
						</c:when>
						</c:choose>
						<div style="padding: 20px; width:100%; color: blue;">정답 : ${mlist[status.count-1].exam_detail_correct }</div>
						<c:if test="${!empty mlist[status.count].exam_detail_comment }">
						<div style="padding: 20px; width:100%;">해설 : ${mlist[status.count-1].exam_detail_comment }</div>
						</c:if>
					</div>
					<hr>
				</c:forEach>
			</div>
		</form>
	</div>
</body>
</html>
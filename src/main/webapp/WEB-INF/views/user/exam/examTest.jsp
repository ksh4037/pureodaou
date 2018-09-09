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

.footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 50px;
	width: 100%;
	background: #EEEEEE;
	text-align: right;
	padding: 10px;
}
</style>
<script>
	function blockRightClick() {
		alert("복사 방지를 위해 오른쪽 버튼은 사용하실 수 없습니다.");
		return false;
	}
	
	function LockF5(e) {
		var key = (e) ? e.keyCode : event.keyCode;
		if ((key == 67 && event.ctrlKey) || (key == 86 && event.ctrlKey)) {
			window.alert('복사 방지를 위해 ctrl+c, ctrl+v는 사용하실 수 없습니다.')
			event.keyCode = 0;
			event.returnValue = false;
		} else if (key == 85 && event.ctrlKey) {
			window.alert('소스 보기 기능을 사용하실 수 없습니다')
			event.keyCode = 0;
			event.returnValue = false;
		} else if (key == 8 || key == 116 || key == 78 || key == 82) {
			if (e) { //표준
				console.log('f5');
				e.preventDefault();
			} else { //익스용
				event.keyCode = 0;
				event.returnValue = false;
			}
		}
	}
	document.onkeydown = LockF5;
	
	var submitFunction = function(degree) {
		if($('.mark').html()<10){
			alert('아직 모든 문제를 풀지 않으셨습니다');
			return false;
		}
		alert('제출');
		var answer = new Array();
		$('input[type=radio]:checked').each(function(){
			data = new Object();
			data['problem'] = $(this).attr('id');
			data['answer'] = $(this).val();
			data['degree'] = degree;
			answer.push(data);
		});
		/* data = new Object();
		data['type'] = degree;
		answer.push(data); */
		var jsonEncode = JSON.stringify(answer);
		 $.ajax({
			url : '${pageContext.request.contextPath}/user/exam/regist.do',
			datatype:'json',
			method : 'post',
			data : jsonEncode,
			processData : true,
			contentType :'application/json; charset=UTF-8',
			success : function(data) {
				if(data=='success'){
					alert('제출 성공했습니다');
					location.href="${pageContext.request.contextPath}/"
				}else if(data=='fail'){
					alert('제출에 실패샜습니다 답안 수룰 확인햐주세요');
				}else{
					alert('오류');
				}
			},
			error : function() {
				alert('제출 실패');
			}
		});
	}

	$(function(){
		$('input[type=radio]').change(function() {
			var cnt = 0;
			$('input[type=radio]:checked').each(function(){
				cnt++;
			});
			$('.mark').html(cnt);
		});
	});
</script>
</head>
<body>
	<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;"
		oncontextmenu="return blockRightClick()">
		<div class="topbox"
			style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px;">
			<ul>
				<li>${map.exam_test_no }회차과제</li>
				<li>카테고리 : 정보보안</li>
				<li>기간 : 2018-09-01 ~ 2018-09-10</li>
			</ul>
		</div>
		<form id="f">
			<div class="midbox"
				style="border-style: solid; border-width: 1px; padding: 25px; margin-bottom: 60px;">

				<c:forEach items="${pList }" var="pVO" varStatus="status">
					<c:choose>
						<c:when test="${pVO.type eq '1'}">
							<div>
								<div
									style="border-style: solid; border-width: 1px; padding: 20px">
									<span style="font-size: 30px; color: orange;">${status.count }</span>
									<div style="display: inline-block;">
										<div
											style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">OX형
											: 10점</div>
									</div>
									<div style="padding-left: 20px;">${pVO.problem }</div>
								</div>
								<div style="padding: 20px;">
									<input id="${pVO.problem_seq }" type="radio"
										name="${status.count }" value="O">O<br> <input
										id="${pVO.problem_seq }" type="radio" name="${status.count }"
										value="X">X
								</div>
							</div>
						</c:when>
						<c:when test="${pVO.type eq '2' }">
							<div>
								<div
									style="border-style: solid; border-width: 1px; padding: 20px">
									<span style="font-size: 30px; color: orange;">${status.count }</span>
									<div style="display: inline-block;">
										<div
											style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">객관식
											: 10점</div>
									</div>
									<div style="padding-left: 20px;">${pVO.problem }</div>
								</div>
								<div style="padding: 20px;">
									<c:forEach items="${pVO.ovo }" var="op" varStatus="status2">
										<input id="${pVO.problem_seq }" type="radio"
											name="${status.count }" value="${op.option_seq }">(${status2.count}) ${op.option_contents }<br>
									</c:forEach>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</form>
	</div>
	<div class="footer">
		<span class="mark">0</span>/10 <input class="btn btn-primary"
			type="button" value="임시저장" id="tempstrg"> <input
			class="btn btn-primary" type="button" value="제출하기"
			onclick="javascript:submitFunction(${map.exam_test_no })">
	</div>
</body>
</html>
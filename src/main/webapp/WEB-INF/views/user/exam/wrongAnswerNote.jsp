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
	var timerID; // 타이머를 핸들링하기 위한 전역 변수
	var time = parseInt($('#timer').html());
	function decrementTime() { 
		$('#timer').html(toHourMinSec(time));
		if(time > 0)
			time--;
		else { 
			clearInterval(timerID);
		}
	}
	
	var start_timer = function() { 
		timerID = setInterval("decrementTime()", 1000);
	}

	function toHourMinSec(t) { 
		var hour;
		var min;
		var sec;
	
		// 정수로부터 남은 시, 분, 초 단위 계산
		hour = Math.floor(t / 3600);
		min = Math.floor( (t-(hour*3600)) / 60 );
		sec = t - (hour*3600) - (min*60);
	
		// hh:mm:ss 형태를 유지하기 위해 한자리 수일 때 0 추가
		if(hour < 10) hour = "0" + hour;
		if(min < 10) min = "0" + min;
		if(sec < 10) sec = "0" + sec;
	
		return(hour + ":" + min + ":" + sec);
	}


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
		} 
		/* else if (key == 8 || key == 116 || key == 78 || key == 82) {
			if (e) { //표준
				console.log('f5');
				e.preventDefault();
			} else { //익스용
				event.keyCode = 0;
				event.returnValue = false;
			}
		} */
	}
	document.onkeydown = LockF5;
	
	var insertanswer = function(exam_no, type){
		var answer = new Array();
		$('input[type=radio]:checked').each(function(){
			data = new Object();
			data['item_no'] = $(this).attr('id');
			data['exam_detail_answer'] = $(this).val();
			data['exam_no'] = exam_no;
			answer.push(data);
		});
		
		$('textarea').each(function(){
				data = new Object();
				data['item_no'] = $(this).attr('id');
				data['exam_detail_answer'] = $(this).val();
				data['exam_no'] = exam_no;
				answer.push(data);
		});
		/* data = new Object();
		data['type'] = degree;
		answer.push(data); */
		var jsonEncode = JSON.stringify(answer);
		 $.ajax({
			url : '${pageContext.request.contextPath}/user/exam/regist.daou?type='+type,
			datatype:'json',
			method : 'post',
			data : jsonEncode,
			processData : true,
			contentType :'application/json; charset=UTF-8',
			success : function(data) {
				if(data=='success'){
					if(type==1)
						alert('제출 성공했습니다');
					else if(type==2)
						alert('임시저장 성공');
					location.href="${pageContext.request.contextPath}/"
				}else if(data=='fail'){
					alert('제출에 실패샜습니다');
				}else{
					alert('오류');
				}
			},
			error : function() {
				alert('제출 실패');
			}
		});
	}
	
	var submitFunction = function(degree, type) {
		if(type == 1){
			if($('.mark').html()<10){
				alert('아직 모든 문제를 풀지 않으셨습니다');
				return false;
			}
			insertanswer(degree, type);
		}else if(type==2) {
			insertanswer(degree, type);
		}
		
	}

	$(function(){
		start_timer();
		$('input[type=hidden]').each(function(i) {
			console.log(i);
		});
		
		
		$('input[type=radio]').change(function() {
			var cnt = 0;
			$('input[type=radio]:checked').each(function(){
				cnt++;
			});
			$('.mark').html(cnt);
		});
		
		$('.item_contents').each(function(){
			if($(this).html().trim()==''){
				$(this).attr('style','display:none');
			}
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
				<li>회차 : ${info.degree }</li>
				<li>과목 : ${info.categoryName}</li>
			</ul>
		</div>
		<form id="f">
			<div class="midbox"
				style="border-style: solid; border-width: 1px; padding: 25px; margin-bottom: 60px;">

				<c:forEach items="${itemList }" var="item" varStatus="status">
					<c:choose>
						<c:when test="${item.item_type eq '1'}">
							<div>
								<div
									style="border-style: solid; border-width: 1px; padding: 20px">
									<span style="font-size: 30px; color: orange;">${status.count }</span>
									<div style="display: inline-block;">
										<div
											style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">OX형
											: 10점</div>
									</div>
									<div style="padding-left: 20px;">${item.item_title }</div>
									<div class="item_contents"
										style="padding: 20px; border-style: solid; border-width: 1px; width: 100%;">
										${item.item_contents }</div>
								</div>
								<div style="padding: 20px;">
									<input id="${item.item_no }" type="radio"
										name="${status.count }" value="O">O<br> <input
										id="${item.item_no }" type="radio" name="${status.count }"
										value="X">X
								</div>
							</div>
						</c:when>
						<c:when test="${item.item_type eq '2' }">
							<div>
								<div
									style="border-style: solid; border-width: 1px; padding: 20px">
									<span style="font-size: 30px; color: orange;">${status.count }</span>
									<div style="display: inline-block;">
										<div
											style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">객관식
											: 10점</div>
									</div>
									<div style="padding-left: 20px;">${item.item_title }</div>
									<div class="item_contents"
										style="padding: 20px; border-style: solid; border-width: 1px; width: 100%;">
										${item.item_contents }</div>
								</div>
								<div style="padding: 20px;">
									<c:forEach items="${item.ovo }" var="op" varStatus="status2">
										<input id="${item.item_no }" type="radio"
											name="${status.count }" value="${op.option_no }">(${status2.count}) ${op.option_contents }<br>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:when test="${item.item_type eq '3' }">
							<div>
								<div
									style="border-style: solid; border-width: 1px; padding: 20px">
									<span style="font-size: 30px; color: orange;">${status.count }</span>
									<div style="display: inline-block;">
										<div
											style="color: white; background-color: #114a9b; border-radius: 15px; padding: 7px; margin: 5px;">객관식
											: 10점</div>
									</div>
									<div style="padding-left: 20px;">${item.item_title }</div>
									<div class="item_contents"
										style="padding: 20px; border-style: solid; border-width: 1px; width: 100%;">
										${item.item_contents }</div>
								</div>
								<div style="padding: 20px;">
									<textarea class="shortanswer" id="${item.item_no }" rows="2"
										cols="30" style="width: 100%;" placeholder="정답을 적어주십시오"></textarea>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${!empty mark }">
					<c:forEach items="${mark}" var="m" varStatus="status">
						<input type="hidden" id="${status.count }"
							value="${m.exam_detail_answer }">
					</c:forEach>
				</c:if>
			</div>
		</form>
	</div>
	<div class="footer">
		<span id="timer">${info.left_time }</span> <span class="mark">0</span>/10
		<input class="btn btn-primary" type="button" value="임시저장"
			id="tempstrg" onclick="javascript:submitFunction(${info.exam_no}, 2)">
		<input class="btn btn-primary" type="button" value="제출하기"
			onclick="javascript:submitFunction(${info.exam_no}, 1)">
	</div>
</body>
</html>
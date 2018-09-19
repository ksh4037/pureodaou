<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="examheader.jsp" />
<div style="padding-left: 25%; padding-right: 25%; padding-top: 20px;">
	<div class="topbox"
		style="background-color: #114a9b; color: white; font-size: 16px; padding: 10px;">
		<ul>
			<li>각 개월차 평가(과제/시험)는 정해진 참여기간 내에 응시 하셔야 하며, 미참여시 미수료 됩니다.</li>
			<li>각 평가당 총점 60점 이상(100점 만점 기준)이어야 수료됩니다.</li>
			<li>평가 기록은 학습장 첫 페이지의 [기록보기]를 확인하시기 바랍니다.</li>
		</ul>
	</div>
	<div class="midbox"
		style="border-style: solid; border-width: 1px; padding: 25px;">
		<table class="table table-hover">
			<tr style="background-color: #DDDDDD">
				<th>회차</th>
				<th>재시험</th>
				<th>과목</th>
				<th>기간</th>
				<th>남은시간</th>
				<th>합격기준</th>
				<th>상태</th>
				<th>평가</th>
			</tr>
			<c:forEach items="${elist }" var="e">
				<tr>
					<td>${e.exam_degree }</td>
					<c:choose>
						<c:when test="${e.exam_retake_degree > 0}">
							<td>${e.exam_retake_degree }차</td>
						</c:when>
						<c:otherwise>
							<td>-</td>
						</c:otherwise>
					</c:choose>
					<td>${e.category_name }</td>
					<td>${e.exam_start_date }~${e.exam_end_date }</td>
					<td>${e.exam_left_time }</td>
					<td>${e.exam_pass_score }점</td>
					<td>${e.quiz_cfg_code_name }</td>
					<td><c:choose>
							<c:when
								test="${e.exam_status=='status01' || e.exam_status=='status02'}">
								<input class="btn btn-primary" id="${e.exam_degree }"
									type="button" value="참여하기"
									onclick="javascript:go(${e.exam_degree}, '${e.exam_start_date }', '${e.exam_end_date }')">
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script type="text/javascript">
 	var xmlHttp;
 	var srvTime = function() {
	    try {
	        //FF, Opera, Safari, Chrome
	        xmlHttp = new XMLHttpRequest();
	    }
	    catch (err1) {
	        //IE
	        try {
	            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
	        }
	        catch (err2) {
	            try {
	                xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
	            }
	            catch (eerr3) {
	                //AJAX not supported, use CPU time.
	                alert("AJAX not supported");
	            }
	        }
	    }
	    xmlHttp.open('HEAD', window.location.href.toString(), false);
	    xmlHttp.setRequestHeader("Content-Type", "text/html");
	    xmlHttp.send('');
	    return xmlHttp.getResponseHeader("Date");
	}
	
	var parse = function(str) {
	    var y = str.substr(0,4);
	    var m = str.substr(5,2);
	    var d = str.substr(8,2);
	    
	    return new Date(y,m-1,d);
	}
	
	var go = function(degree, s_date, e_date){
		var st = srvTime();
		var date = new Date(st);
		if(parse(s_date) > date || date > parse(e_date)){
			alert('평가 기간이 아닙니다');
			return false;
		}
		location.href="${pageContext.request.contextPath}/user/exam/examIntro.daou?degree="+degree;
	}
</script>
<c:import url="examfooter.jsp"/>
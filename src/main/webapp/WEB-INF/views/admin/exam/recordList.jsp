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
				<h4 class="s_title" style="padding-top: 25px; padding-bottom: 15px">
					<span class="span-font">Home > 기록관리</span>
				</h4>
				<hr>
				<br>
				<div class="container">	
					<h2>
						<span class="span-font">기록리스트</span>
					</h2>
					<p>
						<span class="span-font">풀어다우 서비스의 기록정보입니다.</span>
					</p>

					<form name="listForm" id="listForm" method="post">
						<input type="hidden" name="exam_degree" id="exam_degree"/>
						<input type="hidden" name="exam_take_id" id="exam_take_id"/>
						
						<table class="table">
							<thead>
								<tr>
									<th class="r_th_style">회차</th>
									<th class="r_th_style">응시자</th>
									<th class="r_th_style">점수</th>
									<th class="r_th_style">재시험회차</th>
									<th class="r_th_style">응시일</th>
									<th class="r_th_style">최종결과</th>
									<th class="r_th_style">주관식 채점</th>
								</tr>
							</thead>
									
							<c:if test="${empty recordList}">
								<tbody>
									<tr>
										<td colspan="7" align="center">등록된 기록 정보가 없습니다.</td>
									</tr>
								</tbody>
							</c:if>

							<c:if test="${!empty recordList}">
								<c:forEach items="${recordList}" var="recordList" varStatus="status">
									<tbody>
										<tr>
											<td class="r_td_style">${recordList.exam_degree}회차</td>
											<td class="r_td_style">${recordList.emp_name}</td>
											<td class="r_td_style">
												<c:if test="${empty recordList.exam_score}">-</c:if>
												<c:if test="${!empty recordList.exam_score}">${recordList.exam_score}점</c:if>
											</td>
											
											<td class="r_td_style">${recordList.exam_retake_degree}회</td>
											<td class="r_td_style">${fn:substring(recordList.exam_take_date,0,10)}</td>
											
											<td class="r_td_style">
												<c:if test="${!empty statusCodeList}">
													<c:forEach items="${statusCodeList}" var="statusCodeList" varStatus="status">
														<c:if test="${recordList.exam_status == statusCodeList.quiz_cfg_code}">${statusCodeList.quiz_cfg_code_name }</c:if>
													</c:forEach>
												</c:if>
											</td>
											
											<td class="r_td_style">
												<div align="center"> 
													<c:if test="${recordList.exam_status == 'status03'}">
														<input type="button" value="채점하기" onclick="goGrade('${recordList.exam_degree}','${recordList.exam_take_id}');" class="btn btn-primary"/>
													</c:if>
													<c:if test="${recordList.exam_status != 'status03'}">
														<span style="color:red;">-</span>
													</c:if>
												</div>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</form>
 					<p align="center"> 
				 		<input type="button" value="엑셀 다운로드" onclick="getExcel();" class="btn btn-success"/> 
				 	</p>
			</div>
		</div>
	</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		function goReg(){
			location.href="examRegForm.daou";
		}
		
		function getExcel(){
		    location.href="examListExcel.daou";
		}
		
		function goGrade(exam_degree, exam_take_id){
			$("#exam_degree").val(exam_degree);
			$("#exam_take_id").val(exam_take_id);
			$("#listForm").attr("action", "recordGradeForm.daou");
			$("#listForm").submit();
		}
		
	</script>
</body>
</html>
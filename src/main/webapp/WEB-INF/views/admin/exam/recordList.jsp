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
				<h4 class="s_title" style="padding-top: 25px; padding-bottom: 15px"><span class="span-font">Home > 기록관리</span></h4>
				<hr><br>
				<div class="container">	
					<h2><span class="span-font">기록리스트</span></h2>
					<p><span class="span-font">풀어다우 서비스의 기록정보입니다.</span></p>
					
					
				 	<form name="searchForm" id="searchForm" method="post">
						<table class="table" style="margin-bottom:70px; text-align:center">
							<tr>
								<th scope="row" colspan="6"><p align="center"><span style="color:#5bc0de;"><font size=4>[기록리스트 검색조건]</font></span></p></th>
							</tr>
							
							<tr>
								<th scope="row">회차별 : </th>
								<td>
									<select id="degree_scType" name="degree_scType" class="form-control">
										<option value="">전체</option>
										<c:forEach var="item" items="${examInfoList}">
											<option value="${item.exam_degree}" <c:if test="${item.exam_degree == degree_scType}">selected</c:if>>${item.exam_degree}회</option>
										</c:forEach>
									</select>
								</td>
								
								
								<th scope="row">최종상태별: </th>
								<td>
									<select id="status_scType" name="status_scType" class="form-control" style="width:70%">
										<option value="">전체</option>
										<c:forEach var="item" items="${statusCodeList}">
											<option value="${item.quiz_cfg_code}" <c:if test="${item.quiz_cfg_code == status_scType}">selected</c:if>>${item.quiz_cfg_code_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							
							<tr>
								<td colspan="6"><p align="center"><button type="button" class="btn btn-primary" onclick="search(); return false;">Search</button></p></td>
							</tr>
						</table>
					</form>

					<form name="listForm" id="listForm" method="post">
						<input type="hidden" name="exam_degree" id="exam_degree"/>
						<input type="hidden" name="exam_take_id" id="exam_take_id"/>
						<input type="hidden" name="exam_retake_degree" id="exam_retake_degree"/>
						<table class="table"  style="text-align:center;">
							<thead>
								<tr>
									<th class="r_th_style">회차</th>
									<th class="r_th_style">응시자</th>
									<th class="r_th_style">점수</th>
									<th class="r_th_style">합격기준점수</th>
									<th class="r_th_style">재시험회차</th>
									<th class="r_th_style">응시일</th>
									<th class="r_th_style">최종결과</th>
									<th class="r_th_style">주관식 채점</th>
								</tr>
							</thead>
									
							<c:if test="${empty recordList}">
								<tbody>
									<tr>
										<td colspan="8" align="center">등록된 기록 정보가 없습니다.</td>
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
										
											<td class="r_td_style">
												<c:if test="${empty examInfoList}">-</c:if>
												
												<c:if test="${!empty examInfoList}">
													<c:forEach items="${examInfoList}" var="examInfoList" varStatus="status">
														<c:if test="${recordList.exam_degree == examInfoList.exam_degree}">${examInfoList.exam_pass_score}점</c:if>
													</c:forEach>
												</c:if>
											</td>  
											
											<td class="r_td_style">${recordList.exam_retake_degree}회</td>
											
											<td class="r_td_style">
												<c:if test="${empty recordList.exam_take_date}">-</c:if>
												<c:if test="${!empty recordList.exam_take_date}">${fn:substring(recordList.exam_take_date,0,10)}</c:if>
											</td>
											
											<td class="r_td_style">
												<c:if test="${!empty statusCodeList}">
													<c:forEach items="${statusCodeList}" var="statusCodeList" varStatus="status">
														<c:if test="${recordList.exam_status == statusCodeList.quiz_cfg_code}">${statusCodeList.quiz_cfg_code_name }</c:if>
													</c:forEach>
												</c:if>
											</td>
											
											<td class="r_td_style">
												<c:if test="${recordList.exam_status == 'status03'}">
													<input type="button" value="채점하기" onclick="goGrade('${recordList.exam_degree}','${recordList.exam_take_id}','${recordList.exam_retake_degree}');" class="btn btn-primary"/>
												</c:if>
												<c:if test="${recordList.exam_status == 'status04' || recordList.exam_status == 'status05'}">
													<span style="color:red;">완료</span>
												</c:if>
												<c:if test="${recordList.exam_status == 'status01' || recordList.exam_status == 'status02'}">
													<span style="color:red;">대기</span>
												</c:if>
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
		function getExcel(){
		    $("#searchForm").attr("action", "recordListExcel.daou");
			$("#searchForm").submit();
		}
		
		function goGrade(exam_degree, exam_take_id, exam_retake_degree){
			$("#exam_degree").val(exam_degree);
			$("#exam_take_id").val(exam_take_id);
			$("#exam_retake_degree").val(exam_retake_degree);
			$("#listForm").attr("action", "recordGradeForm.daou");
			$("#listForm").submit();
		}	
		
		function search(){
			$("#searchForm").attr("action", "recordList.daou");
			$("#searchForm").submit();
		}
		
	</script>
</body>
</html>
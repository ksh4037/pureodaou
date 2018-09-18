<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "inline; filename=examListExcel.xls");
%>


			<html lang="ko">
   				<body>
   					<table>
   						<thead>
							<tr>
								<th colspan="8">
									[검색조건] -> 
									회차별 : 
									<c:if test="${empty degree_scType}">-회,</c:if>
									<c:if test="${!empty degree_scType}">${degree_scType}회,</c:if>
									
									최종상태별 : 
									<c:if test="${empty status_scType}">-</c:if>
									<c:if test="${status_scType == 'status01'}">미응시</c:if>
									<c:if test="${status_scType == 'status02'}">임시저장</c:if>
									<c:if test="${status_scType == 'status03'}">채점중</c:if>
									<c:if test="${status_scType == 'status04'}">채점완료(합격)</c:if>
									<c:if test="${status_scType == 'status05'}">채점완료(불합격)</c:if>
								</th>
							</tr>
						</thead>
					</table>
							
     				<table>
							<thead>
								<tr>
									<th>회차</th>
									<th>응시자</th>
									<th>점수</th>
									<th>합격기준점수</th>
									<th>재시험회차</th>
									<th>응시일</th>
									<th>최종결과</th>
									<th>주관식 채점</th>
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
														<span style="color:red;">채점대기</span>
													</c:if>
													<c:if test="${recordList.exam_status == 'status04' || recordList.exam_status == 'status05'}">
														<span style="color:red;">완료</span>
													</c:if>
													<c:if test="${recordList.exam_status == 'status01' || recordList.exam_status == 'status02'}">
														<span style="color:red;">대기</span>
													</c:if>
												</div>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
  				 </body>
			</html>


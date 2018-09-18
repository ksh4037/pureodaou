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
									<th>회차</th>
									<th>카테고리</th>
									<th>시작일자</th>
									<th>종료일자</th>
									<th>객관식</th>
									<th>주관식</th>
									<th>O/X</th>
									<th>합격기준점수</th>
								</tr>
							</thead>
									
							<c:if test="${empty examList}">
								<tbody>
									<tr>
										<td colspan="8">등록된 출제 정보가 없습니다.</td>
									</tr>
								</tbody>
							</c:if>

							<c:if test="${!empty examList}">
								<c:forEach items="${examList}" var="examList" varStatus="status">
									<tbody>
										<tr>
											<td>${examList.exam_degree}회차</td>
											<td>
												<c:if test="${!empty categoryList}">
													<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
														<c:if test="${examList.exam_category == categoryList.category_no}"><c:out value="${categoryList.category_name}" escapeXml="false"/></c:if>	
													</c:forEach>
												</c:if>
											</td>
											<td><c:out value="${examList.exam_start_date}" escapeXml="false"/></td>
											<td><c:out value="${examList.exam_end_date}" escapeXml="false"/></td>
											<td><c:out value="${examList.exam_ox_num}" escapeXml="false"/>개</td>	
											<td><c:out value="${examList.exam_obj_num}" escapeXml="false"/>개</td>
											<td><c:out value="${examList.exam_short_num}" escapeXml="false"/>개</td>
											<td><c:out value="${examList.exam_pass_score}" escapeXml="false"/>점</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
  				 </body>
			</html>


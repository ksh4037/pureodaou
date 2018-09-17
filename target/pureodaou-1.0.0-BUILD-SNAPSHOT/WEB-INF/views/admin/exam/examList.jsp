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
					<span class="span-font">Home > 출제관리</span>
				</h4>
				<hr>
				<br>
				<div class="container">	
					<h2>
						<span class="span-font">출제리스트</span>
					</h2>
					<p>
						<span class="span-font">풀어다우 서비스의 출제정보입니다.</span>
					</p>

					<form name="listForm" id="listForm" method="post">
						<table class="table">
							<thead>
								<tr>
									<th style="width:10%">회차</th>
									<th style="width:10%">카테고리</th>
									<th style="width:20%">시작일자</th>
									<th style="width:20%">종료일자</th>
									<th style="width:10%">객관식</th>
									<th style="width:10%">주관식</th>
									<th style="width:10%" >O/X</th>
									<th style="width:10%">합격기준점수</th>
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
														<c:if test="${examList.exam_category == categoryList.category_no}">${categoryList.category_name}</c:if>	
													</c:forEach>
												</c:if>
											</td>
											<td>${examList.exam_start_date}</td>
											<td>${examList.exam_end_date}</td>
											<td>${examList.exam_ox_num}개</td>	
											<td>${examList.exam_obj_num}개</td>
											<td>${examList.exam_short_num}개</td>
											<td>${examList.exam_pass_score}점</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</form>

				 	<p align="center"> 
				 		<input type="button" value="출제하기" onclick="goReg();" class="btn btn-danger"/> 
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
	</script>
</body>
</html>
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
						<table class="table">
							<thead>
								<tr>
									<th style="width:10%">회차</th>
									<th style="width:10%">응시자</th>
									<th style="width:20%">응시일</th>
									<th style="width:10%">재시험회차</th>
									<th style="width:20%">상태</th>
									<th style="width:10%" >최종결과</th>
									<th style="width:10%">점수</th>
									<th style="width:20%">주관식 채점</th>
								</tr>
							</thead>
									
							<c:if test="${empty examList}">
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
											<td>${recordList.exam_degree}회차</td>
											<td>${recordList.exam_take_id}</td>
											<td>${recordList.exam_take_date}</td>
											<td>${recordList.exam_retake_degree}</td>
											<td>${recordList.exam_status}개</td>	
											<td>${recordList.exam_final_yn}개</td>
											<td>${recordList.exam_score}개</td>
											<td><input type="button" value="채점하기" class="btn btn-primary"/></td>
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
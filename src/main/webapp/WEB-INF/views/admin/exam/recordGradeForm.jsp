<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

				<form name="recordGradeForm" id="recordGradeForm" method="post">
					<div class="container">
						<h2 class="span-font">주관식 채점 페이지</h2>
						<p class="span-font">풀어다우 주관식 채점 페이지 입니다.</p>

						<table class="table table-hover">
						<c:if test="${!empty shortExamList}">
							<c:forEach items="${shortExamList}" var="shortExamList" varStatus="status">
							
								<tr>
									<td width="7%">문제유형</td>
									<td>
										<span style="color: red">주관식</span>
									</td>
								</tr>
							
								<tr>
									<td width="7%">문제</td>
									<td>
										<textarea id="item_title" name="item_title" class="form-control" rows="10"  readonly>${shortExamList.item_title}</textarea>
									</td>
								</tr>
	
								<tr>
									<td width="7%">보충자료<br>(50kb 이하)</td>
									<td>
										<textarea id="item_contents" name="item_contents" class="form-control summernote">${shortExamList.item_contents}</textarea>
									</td>
								</tr>
									
								<tr>
									<td>사용자의 <br> 정답</td>
									<td>
										<textarea id="item_contents" name="item_contents" class="form-control" rows="10" readonly>${shortExamList.exam_detail_answer}</textarea>
						       		</td>
								</tr>
								
								<tr>
									<td>실제 정답</td>
									<td>
										<textarea id="item_contents" name="item_contents" class="form-control" rows="10" readonly>${shortExamList.exam_detail_correct}</textarea>
						       		</td>
								</tr>
								
								<tr>
									<td>코멘트</td>
									<td>
										<textarea id="item_contents" name="item_contents" class="form-control" rows="10" readonly></textarea>
						       		</td>
								</tr>
								
								<tr>
									<td>정답 유무</td>
									<td>
										<input type="radio" name="correct_yn" value="Y${shortExamList.exam_detail_no}"> 정답
										<input type="radio" name="correct_yn" value="N${shortExamList.exam_detail_no}"> 오답
						       		</td>
								</tr>
								
								<tr height="50">
									<td colspan="2">
								</tr>
							</c:forEach>
						</c:if>	
											
						<c:if test="${empty shortExamList}">
							<tr>
								<td colspan="2"> 주관식이 없습니다. </td>
							</tr>
						</c:if>
						
						</table>
						
						
						<table class="table table-hover">
							<tr>
								<td>
										<input type="button" value="취소" class="btn btn-default" style="float: right" /> 
									<c:if test="${!empty shortExamList}">
										<input type="button" value="확인" class="btn btn-default" onclick="goUpdt();" style="float: right; margin-right: 5px" />
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	
	<script type="text/javascript">		
			
		function goUpdt(){
		
			var queryString = $("form[name=recordGradeForm]").serialize();

			$.ajax({
				type : "POST",
				url : "recordGrade.daou",
				data : queryString,
				async : false,
				success : function(data) {
					if (data == "success") {
						alert("채점되었습니다.");
						location.href = "recordList.daou";
					} else if (data == "error") {
						alert("채점에 실패하였습니다.");
						return;
					}
				},
				error : function(data) {
					alert("채점에 실패하였습니다.");
					return;
				}
			});

		}
	</script>
</body>
</html>
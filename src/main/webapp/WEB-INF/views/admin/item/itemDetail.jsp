<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="import.jsp"%>
<body>

	<div class="container-fluid">
		<div class="row content">
			<%@ include file="lnb.jsp"%>

			<form name="detailKeyInfo" id="detailKeyInfo" method="post">
				<input type="hidden" name="item_no" value="${itemDetail.item_no}" />
			</form>

			<div class="col-sm-9">
				<h4 class="s_title" style="padding-top: 25px; padding-bottom: 15px">
					<span class="span-font">Home > 문제관리</span>
				</h4>
				<hr>
				<br>
				<div class="container">
					<h2 class="span-font">문제 상세보기</h2>
					<p class="span-font">상세보기 페이지 입니다.</p>
					<br>
					<table class="table">
						<tr>
							<td>문제</td>
							<td>${itemDetail.item_title}</td>
						</tr>
						
						<tr>
							<td>문제</td>
							<td>${itemDetail.item_contents}</td>
						</tr>
						

						<tr>
							<td>문제유형</td>
							<td>
								<c:if test="${itemDetail.item_type == 1}">
									<span style="color: red">O/X </span>
								</c:if> 
								
								<c:if test="${itemDetail.item_type == 2}">
									<span style="color: red">객관식</span>
								</c:if>
							</td>
						</tr>

						<tr>
							<td>문제유형</td>
							<td>
								<c:forEach items="${categoryList}" var="categoryList" varStatus="status">
									<c:if test="${itemDetail.category_no == categoryList.category_no}">
										<span style="color:red">${categoryList.category_name}</span>
									</c:if>
								</c:forEach>
							</td>
						</tr>

						<c:if test="${itemDetail.item_type == '1'}">
							<tr>
								<td>보기</td>
								<td>
									<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
										<input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'O' }">checked</c:if> disabled /> O
					    				<input type="radio" name="type" <c:if test="${optionDetail.option_contents == 'X' }">checked</c:if> disabled /> X
									</c:forEach>
								</td>
							</tr>
						</c:if>

						<c:if test="${itemDetail.item_type == '2'}">
						
							<c:forEach items="${optionDetail}" var="optionDetail" varStatus="status">
								<c:if test="${optionDetail.correct_yn == 'Y'}">
									<tr>
										<td><span style="color: red">정답</span></td>
										<td><span>${optionDetail.option_contents}</span></td>
									</tr>
								</c:if>

								<c:if test="${optionDetail.correct_yn == 'N'}">
									<tr>
										<td>보기</td>
										<td><span>${optionDetail.option_contents}</span></td>
									</tr>
								</c:if>
							</c:forEach>
							
						</c:if>

						<tr>
							<td>작성자</td>
							<td>${itemDetail.reg_id}</td>
						</tr>
						
						<tr>
							<td>작성일자</td>
							<td>${fn:substring(itemDetail.reg_date,0,16)}</td>
						</tr>
					</table>

					<div style="float: right">
						<input type="button" value="수정" onclick="goUpdtForm()" class="btn btn-primary"> 
						<input type="button" value="삭제" onclick="goDelete()" class="btn btn-danger"> 
						<input type="button" value="취소" onclick="goList()" class="btn btn-default">
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		function goList() {
			location.href = "itemList.daou";
		}

		function goUpdtForm() {
			$("#detailKeyInfo").attr("action", "itemUpdtForm.daou");
			$("#detailKeyInfo").submit();
		}

		function goDelete() {

			if (confirm("정말 삭제하시겠습니까??") == true) {
				var queryString = $("form[name=detailKeyInfo]").serialize();

				$.ajax({
					type : "POST",
					url : "deleteItem.daou",
					data : queryString,
					async : false,
					success : function(data) {
						if (data == "success") {
							alert("삭제되었습니다.");
							location.href = "itemList.daou";
						} else if (data == "error") {
							alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
							return;
						}
					},
					error : function(data) {
						alert("삭제에 실패하였습니다. \n다시 시도해주세요.");
						return;
					}
				});

			} else {
				return;
			}
		}
	</script>

</body>
</html>
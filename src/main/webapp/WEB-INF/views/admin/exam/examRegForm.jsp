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

				<form name="exam_reg_form" id="exam_reg_form" method="post">
					<div class="container">
						<h2 class="span-font">출제정보 페이지</h2>
						<p class="span-font">풀어다우 출제 등록 페이지 입니다.</p>

						<table class="table table-hover">

							<tr>
								<td width="7%">카테고리 설정</td>
								<td>
									<select>
										<option></option>
										<option></option>
										<option></option>
										<option></option>
									</select>
								
								</td>
							</tr>
			
			
							<tr>
								<td width="7%">시험기간</td>
								<td>
									<p class="mb3"><input type="text" id="datepicker">   ~ </p>
									<p class="mb3"><input type="text" id="datepicker">  	</p>
								</td>
							</tr>

							<tr>
								<td>정답</td>
								<td>
									<input type="radio" value="O" name="option_contents" /> O 
									<input type="radio" value="X" name="option_contents" /> X
								</td>
							</tr>
						</table>

						<table class="table table-hover">
							<tr>
								<td>
									<input type="button" value="취소" onclick="goList();" class="btn btn-default" style="float: right" /> 
									<input type="button" value="등록" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
								</td>
							</tr>
						</table>
					</div>
				</form>


					<input type="button" value="출제하기" onclick="goReg();" class="btn btn-default" style="float: right; margin-right: 5px" />
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		function goReg(){
			location.href="examReg.daou";
		}
	</script>
</body>
</html>
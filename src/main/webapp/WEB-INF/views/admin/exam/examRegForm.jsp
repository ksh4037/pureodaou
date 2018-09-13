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
								<td width="15%">카테고리 설정</td>
								<td>
									<select name="category_no">
										<option>test1</option>
										<option>test2</option>
										<option>test3</option>
										<option>test4</option>
									</select>								
								</td>
							</tr>
			
							<tr>
								<td width="7%">시험기간 설정</td>
								<td>
									<input type="text" id="datepicker1">   ~ 
									<input type="text" id="datepicker2">  	
								</td>
							</tr>

							<tr>
								<td>합격 점수</td>
								<td>
									<input type="radio" value="O" name="option_contents" /> O 
									<input type="radio" value="X" name="option_contents" /> X
								</td>
							</tr>
							
							<tr>
								<td>유형별 문제 수</td>
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
									<input type="button" value="출제하기" onclick="goReg(); return false;" class="btn btn-default" style="float: right; margin-right: 5px" />
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
		function goReg(){
			location.href="examReg.daou";
		}
	</script>
</body>
</html>
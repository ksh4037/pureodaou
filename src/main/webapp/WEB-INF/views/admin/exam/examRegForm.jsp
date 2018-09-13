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
						<span class="span-font">출제리스트121212</span>
					</h2>
					<p>
						<span class="span-font">풀어다우 서비스의 출제정보입니다.</span>
					</p>

					<form name="listForm" id="listForm" method="post">
						<table class="table">
							<thead>
								<tr>
									<th align="center">No.</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>등록된 문제 정보가 없습니다.</td>
								</tr>
							</tbody>
						</table>
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
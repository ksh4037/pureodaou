<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function goList(path) {
	if (path == "itemList") {
		location.href = "itemList.daou";
	} else if (path == "employeeList") {
		location.href = "employeeList.daou";
	} else if (path == "boardList") {
		location.href = "boardList.daou";
	} else if (path == "examList") {
		location.href = "examList.daou";
	} else if (path == "recordList") {
		location.href = "recordList.daou";
	}
}
</script>

<div class="col-sm-4 sidenav">
	<div align="center">
		<a href="#" onclick="goList('problemList');"><img src="../resources/img/logo4.png" width="80%" style="padding-top: 20px; float: center" /></a>
	</div>
	<br>

	<hr style="height: 2px; background-color: white">

	<ul class="nav nav-pills nav-stacked" id="controlLnb">
		<li><a href="#" onclick="goList('itemList');" id="item_li">문제관리</a></li>

		<li><a href="#" onclick="goList('examList');"  id="exam_li">문제출제</a></li>

		<li><a href="#" onclick="goList('employeeList');" id="member_li">회원관리</a></li>

		<li><a href="#" onclick="goList('recordList');" id="record_li">기록관리</a></li>

		<li><a href="#" onclick="goList('boardList');" id="board_li">현황 보기</a>

		</li>
	</ul>
	<br>
</div>


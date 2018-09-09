<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
    if (session.getAttribute("e_id") == null) {
        response.sendRedirect("goLogout");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome User</title>
<style>	
 		.board_list {width: 500px; margin:0 auto;}
 		.board_list tfoot {text-align: center;}
 		.btn_area {text-align:center;}
 		.btn {width: 300px; height: 50px; text-align:center;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function goExamMain(){
		$("#menu").attr("action", "examMain");
		$("#menu").submit();
	}
	function goExamRecord(){
		$("#menu").attr("action", "examRecord");
		$("#menu").submit();
	}

	function goUserBoard(){
		$("#menu").attr("action", "userBoard");
		$("#menu").submit();
	}
	function goUserLogout(){
		location.href="goBackUserMain";
	}
	
	
</script>


</head>
<body>
<form id ="menu" name="menu" method="post">
	<div>
		<h3><%= session.getAttribute("e_id") %>님 환영합니다!</h3>
	</div>
	<div>
		<input type="submit" id="logout_btn"  value="로그아웃" onclick="goUserLogout();"> 
	</div>
	<div class="btn_area">
    	<input type="submit" id="examMain_btn" class="btn" value="시험 보기" onclick="goExamMain();"> 
    </div>
    	<br></br>
    <div class="btn_area">
    	<input type="submit" id="examRecord_btn" class="btn" value="기록 보기" onclick="goExamRecord();"> 
    </div>
    	<br></br>
    <div class="btn_area">
    	<input type="submit" id="userBoard_btn" class="btn" value="게시판" onclick="goUserBoard();"> 
    </div>
</form>
    
</body>
</html>
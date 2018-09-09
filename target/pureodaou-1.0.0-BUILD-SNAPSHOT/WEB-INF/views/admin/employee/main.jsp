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
<title>Welcome Admin</title>
<style>	
 		.board_list {width: 500px; margin:0 auto;}
 		.board_list tfoot {text-align: center;}
 		.btn_area {text-align:center;}
 		.btn {width: 300px; height: 50px; text-align:center;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function goProblem(){
		$("#menu").attr("action", "admin/problem");
		$("#menu").submit();
	}
	function goRecord(){
		$("#menu").attr("action", "admin/record");
		$("#menu").submit();
	}
	function goUser(){
		$("#menu").attr("action", "goUserList");
		$("#menu").submit();
	}
	function goBoard(){
		$("#menu").attr("action", "admin/board");
		$("#menu").submit();
	}
	function goLogout(){
		location.href="goBackUser";
	}
	
	
</script>


</head>
<body>
<form id ="menu" name="menu" method="post">
	<div>
		<h3>관리자 <%= session.getAttribute("e_id") %>님 환영합니다!</h3>
	</div>
	<div>
		<input type="submit" id="logout_btn"  value="로그아웃" onclick="goLogout();"> 
	</div>
	<div class="btn_area">
    	<input type="submit" id="problem_btn" class="btn" value="문제 관리" onclick="goProblem();"> 
    </div>
    	<br></br>
    <div class="btn_area">
    	<input type="submit" id="record_btn" class="btn" value="기록 관리" onclick="goRecord();"> 
    </div>
    	<br></br>
    <div class="btn_area">
    	<input type="submit" id="user_btn" class="btn" value="사용자 관리" onclick="goUser();"> 
    </div>
    	<br></br>
    <div class="btn_area">
    	<input type="submit" id="board_btn" class="btn" value="게시판" onclick="goBoard();"> 
    </div>
</form>
    
</body>
</html>
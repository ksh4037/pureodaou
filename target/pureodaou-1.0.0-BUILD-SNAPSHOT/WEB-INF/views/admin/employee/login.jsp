<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>	
 		.board_list {width: 500px; margin:0 auto;}
 		.board_list tfoot {text-align: center;}
 		.btn_area {text-align:center;}
 		.btn {height: 35px; text-align:center;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function goLogin(){
		if($("#e_id").val().length <1){
			alert("아이디를 입력해주세요.");
		}else if($("#e_pw").val().length <1){
			alert("비밀번호를 입력해주세요.");
		}
		else{
			$("#login").attr("action", "goLogin");
			$("#login").submit();
		}
	}
	
</script>

</head>
<body>
<form id ="login" name="login" method="post">
	<table class="board_list">
	<caption>로그인</caption>
	<thead></thead>
	<tbody>
		<tr>
		<th scope="row">아이디</th>
		<td><input type="text" id="e_id" name="e_id" class="wdp_90"></td>
		</tr>
		<tr>
		<th scope="row">비밀번호</th>
		<td><input type="password" id="e_pw" name="e_pw" class="wdp_90">
		</td>
		</tr>
	</tbody>
	</table>
	<br></br>
</form>
    <div class="btn_area">
    	<input type="submit" id="login_btn" class="btn" value="로그인" onclick="goLogin();"> 
    </div>
    <div class="btn_area">
    <h5>
    **ID는 사번 입니다.<br></br>
	**초기 PW는 daou사번 입니다. 
    </h5>
    </div> 
</body>
</html>



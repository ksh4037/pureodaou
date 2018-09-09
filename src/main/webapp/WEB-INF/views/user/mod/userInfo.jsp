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
</style>


<script type="text/javascript">
	
</script>


</head>
<body>


</body>
</html>
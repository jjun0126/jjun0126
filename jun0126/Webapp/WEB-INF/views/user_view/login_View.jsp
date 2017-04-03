<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>main</title> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/user.css">
</head>
<body>
	<c:import url="/WEB-INF/views/main/top.jsp" />
	<div id="wrap">
		<c:import url="/WEB-INF/views/main/header.jsp" />
		<div id="con" class="center910 clearfix">
			<c:import url="/WEB-INF/views/user/login.jsp" />
			<c:import url="/WEB-INF/views/main/right_con.jsp" />
		</div>
		<!--con end-->
	</div>
	<!--wrap end-->
</body>
</html>
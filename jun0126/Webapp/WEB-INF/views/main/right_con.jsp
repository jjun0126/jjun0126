<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
</head>
<body>  
	<div id="right_con"> 
		<div id="photo"><img src="${pageContext.request.contextPath }/assets/images/me.jpg"  max-width="150"  height="170";></div>
		<div id="calendar"></div>
		<ul id="quickmenu">
			<li><a href="${pageContext.request.contextPath }/main">프로필</a></li>
			<li><a href="${pageContext.request.contextPath }/board/list">프로그래밍 이야기</a></li>
			<li><a href="${pageContext.request.contextPath }/guestBoard/list">게시판</a></li>
		</ul> 
		<!--quickmenu end-->
	</div>
	<!--right end-->
</body>
</html>
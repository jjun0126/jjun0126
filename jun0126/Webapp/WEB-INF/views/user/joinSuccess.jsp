<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>jun0126</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
<link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
		<div id="left_con">
			<div id="user"> 
				<p class="jr-success">
					회원가입을 축하합니다.
					<br><br>
					<a href="${pageContext.request.contextPath }/user/loginform">로그인하기</a>
				</p>				
			</div>
		</div>
</body>
</html>
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
				<form id="login-form" name="loginform" method="post" action="${pageContext.request.contextPath }/user/login">
					<label class="block-label" for="user_ID">아이디</label>
					<input id="user_ID" name="user_ID" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="passWord" type="passWord" value="">
					<c:if test="${'fail' == param.result }">
					<p>
						아이디와 비밀번호를 다시한번 확인해 주세요.
					</p>
					</c:if>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/javascript/user_join.js"> 
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/user.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<ul id="top" class="clearfix">
			<li id="top_menu"><a href="#">메뉴∨</a>  
	            <ul  class="clearfix">
	                <li><a href="${pageContext.request.contextPath }/main">프로필</a></li>
	                <li><a href="${pageContext.request.contextPath }/board/viewer">프로그래밍 이야기</a></li>
	                <li><a href="${pageContext.request.contextPath }/guestBoard/list">방명록</a></li>
	            </ul>
	        </li>
	        
			<c:choose>
				<c:when test="${empty authUser }">
					<li><a href="${pageContext.request.contextPath }/user/loginform" id="login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath }/user/joinform" id="join">회원가입</a></li>
				</c:when>
				<c:otherwise> 
					<li><a href="${pageContext.request.contextPath }/user/logout" id="logout" title="로그아웃">로그아웃</a></li> 
					<c:choose>
						<c:when test="${not empty authUser && authUser.admin == 1 }">
							<li><a href="${pageContext.request.contextPath }/board/writer_form"
								id="new_Write"title="새글쓰기">새글쓰기</a></li>
						</c:when> 
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/guestBoard/writer_form"
									id="new_Write" title="새글쓰기">새글쓰기</a></li>
							</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
	</ul>
</body>
</html>
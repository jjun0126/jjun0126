<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/assets/css/style.css"
	rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
    <div id="left_con"><div><span></span></div>
                   <div id="viewer_form" class="clearfix">
                       <div id="viewer_title"><a href="#">${GuestBoardVO.title}</a></div>
                       <div id="viewer_kategorie"><a href="${pageContext.request.contextPath }/guestBoard/list">방명록</a></div>
                   </div>
                   <div id="viewer_contents"><p>${GuestBoardVO.contents}</p>
                   </div> 
                   <div id="modify" class="clearfix">
                   <c:if test="${authUser.user_NO == GuestBoardVO.user_NO  || authUser.admin == 1}" >
                       <div><a href="${pageContext.request.contextPath }/guestBoard/modify_form?board_NO=${GuestBoardVO.board_NO}">수정</a></div>
                       <div><a href="${pageContext.request.contextPath }/guestBoard/delete?board_NO=${GuestBoardVO.board_NO}">삭제</a></div>
                       </c:if>
                       <c:if test="${ not empty authUser  }"> 
                       <div><a href="${pageContext.request.contextPath }/guestBoard/reply_form?board_NO=${GuestBoardVO.board_NO}">답글</a></div>
                       </c:if>
                   </div>
                   <table>
                   	<tr>
					<td><input type="hidden" name="board_NO"
						value="${GuestBoardVO.board_NO}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="group_NO"
						value="${GuestBoardVO.group_NO}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="order_NO"
						value="${GuestBoardVO.order_NO}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${GuestBoardVO.depth}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${GuestBoardVO.user_ID}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${GuestBoardVO.user_NO}" /></td>
				</tr>
				</table>
                </div>


	<!--<div id="left_con">
		<h1>상세보기</h1>
		<table>
			<tr id="viewer_title">
				<td colspan="4">${GuestBoardVO.title}</td>
			</tr>
			<tr id="viewer_user_ID">
				<td colspan="2">${GuestBoardVO.user_ID}</td>
				<td>${GuestBoardVO.reg_date}</td>
				<td>hit: ${GuestBoardVO.hit}</td>
			<tr id="viewer_contents">
				<td colspan="4">${GuestBoardVO.contents}</td>
			</tr>
		</table>
		<c:if test="${authUser.user_NO == GuestBoardVO.user_NO  || authUser.admin == 1}" >
			<input type="button" value="삭제"
				onclick="location.href='${pageContext.request.contextPath }/guestBoard/delete?board_NO=${GuestBoardVO.board_NO}'" />
			<input type="button" value="수정"
				onclick="location.href='${pageContext.request.contextPath }/guestBoard/modify_form?board_NO=${GuestBoardVO.board_NO}'" />
		</c:if>
		<c:if test="${ not empty authUser  }"> 
			<input type="button" value="답글달기"
				onclick="location.href='${pageContext.request.contextPath }/guestBoard/reply_form?board_NO=${GuestBoardVO.board_NO}'" />
		</c:if>
		<input type="button" value="뒤로가기"
			onclick="location.href='${pageContext.request.contextPath }/guestBoard/list'" /> 
		<td>고유넘버 : ${GuestBoardVO.board_NO}</td>
		<td>그룹넘버: ${GuestBoardVO.group_NO}</td>
		<td>오더넘버: ${GuestBoardVO.order_NO}</td> 
		<td>뎁스: ${GuestBoardVO.depth}</td>
	</div>-->
</body>
</html>
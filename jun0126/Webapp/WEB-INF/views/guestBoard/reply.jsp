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
	<div id="left_con">
		<form action="${pageContext.request.contextPath }/guestBoard/reply" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" size="70" name="title"  value="${boardVO.title}" placeholder="${boardVO.title} 의 답글을 달아주세요"/></td>
				</tr>
				<tr> 
					<th>내용</th>
					<td><textarea name="contents" cols="70" row="13"></textarea></td>
				</tr>
					<tr>
					<td><input type="hidden" name="board_NO"
						value="${boardVO.board_NO}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="group_NO"
						value="${boardVO.group_NO}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="order_NO"
						value="${boardVO.order_NO}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${boardVO.depth}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${boardVO.user_ID}" /></td>
				</tr>
				<tr> 
					<td><input type="hidden" name="depth"
						value="${boardVO.user_NO}" /></td>
				</tr>
				
			</table>
			<table>
				<tr>
					<td colspan="2"> 
					<input type="submit" value="전송"> 
					<input type="button" value="취소" onclick="history.go(-1);" />
					</td> 
				</tr>
			</table>
		</form>
	</div>
	<!-- contents -->
</body>
</html>
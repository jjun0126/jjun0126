<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 

<c:forEach var="commentsVO" items="${commentsList.list}" varStatus="status">
	<div id="commentsWriter_info">
		<div id="commentsWriter_user_ID">${commentsVO.user_ID}</div>
		<div id="commentsWriter_date">${commentsVO.reg_date}</div>
		<c:if  test="${authUser.user_NO == CommentsVO.user_NO  || authUser.admin == 1}">
		<div><a href="${pageContext.request.contextPath }/comments/delete?comments_NO=${commentsVO.comments_NO}" id="commentsDelete" name="delete">삭제</a></div> 
		</c:if>
	</div>
	<div id=commentsContents>${commentsVO.contents}</div>

</c:forEach>






<!-- <table>
	<c:forEach var="commentsVO" items="${commentsList.list}" varStatus="status">
				<tr>  
					<td>${commentsList.totalCnt  - (commentsList.curPage - 1)*commentsList.PAGE_SIZE - status.index}</td>

					<td><c:forEach begin="1" end="${commentsVO.depth}">&nbsp;&nbsp;</c:forEach>
						<c:choose>
							<c:when test="${commentsVO.depth > 0 }"> 
								<b>re:</b>  
							</c:when> 
						</c:choose> 
					</td>
					<td>${commentsVO.contents}</td>
					<td>${commentsVO.user_ID}</td>
					<td>${commentsVO.reg_date}</td>
				</tr>
			</c:forEach>
			 
</table> -->
</body>
</html>
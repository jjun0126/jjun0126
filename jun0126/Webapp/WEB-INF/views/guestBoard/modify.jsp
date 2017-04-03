<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>
</head>
<body>
		 <div id="left_con"><div><span>수정하기</span></div>
                   <form action="${pageContext.request.contextPath }/guestBoard/modify" method="post">
                        <input id="title" type="text" name="title" placeholder="${boardVO.title}" value="${boardVO.title}"><br>
                        <textarea id="contents" name="contents" placeholder="${boardVO.contents}"></textarea>
                   
                    <div id="new_Write_btn"> 
                        <input type="submit" name="전송" value="저장">
                        <input type="button" value="취소" onclick="history.go(-1);" >
                    </div>
                    <table>
                  	  <tr>
						<td><input type="hidden" name="board_NO" value="${boardVO.board_NO}" /></td>
						<td><input type="hidden" name="user_NO" value="${boardVO.user_NO}" /></td>
						<td><input type="hidden" name="user_ID" value="${boardVO.user_ID}" /></td>
					 <tr> 
					</table>   
                     </form> 
                </div>
	
</body>
</html>
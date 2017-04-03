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
	
	 <div id="left_con"><div><span>수정하기</span></div>
                   <form action="${pageContext.request.contextPath }/board/modify" method="post">
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
	
	<!--  
	
	
		<form action="${pageContext.request.contextPath }/board/modify" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" size="70" name="title"
						value="${boardVO.title}" /></td>
				</tr>
				<tr>
					<th>아이디</th> 
					<td>${boardVO.user_ID}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="contents" cols="70" row="13"
						value="${boardVO.contents}" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="board_NO"
						value="${boardVO.board_NO}" /></td>
				</tr> 
			</table> 
			<table>
				<tr>
					<td colspan="2"><input type="submit" value="수정"/> 
					<input type="button" value="취소" onclick="history.go(-1);" /></td>
					<td>고유넘버 : ${boardVO.board_NO}</td>
					<td>그룹넘버: ${boardVO.group_NO}</td>
					<td>오더넘버: ${boardVO.order_NO}</td>
					<td>뎁스: ${boardVO.depth}</td>
				</tr>
			</table> 
		</form> --> 
</body>
</html>
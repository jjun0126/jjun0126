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
<div id="left_con"><div><span>새글쓰기</span></div>
		<form action="${pageContext.request.contextPath }/guestBoard/writer" method="post">
                        <input id="title" type="text" name="title" placeholder="제목을 입력하세요."><br>
                        <textarea id="contents" name="contents" placeholder="내용을 입력하세요."></textarea>
                    
			 <div id="new_Write_btn"> 
                        <input id="submit_btn" type="submit" name="전송" value="저장" >
                        <input id="button_btn" type="button" name="취소" value="취소" onclick="history.go(-1);" >
             </div> 
              </form>
	</div>
	<!-- contents -->
</body>
</html>
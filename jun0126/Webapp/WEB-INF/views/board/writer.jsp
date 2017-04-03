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

 
<script type="text/javascript">
	$(function(){
		// 업로드 다이알로그
		var dialogUpload = $( "#dialog-upload-form" ).dialog({
			autoOpen: false,
			height: 280,
			width: 300,
			modal: true,
			buttons: {
				"업로드": function() {
					$( "#dialog-upload-form form" ).submit();
					$( this ).dialog( "close" );
				},
				"취소" : function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				$( "#dialog-upload-form form" ).get(0).reset();	
			}
		});
		
		$("#upload-image").click( function(event) {
			event.preventDefault();
			dialogUpload.dialog( "open" );
		});
	});	
	</script>

</head>
<body> 
	<div id="left_con"><div><span>새글쓰기</span></div>
		<form action="${pageContext.request.contextPath }/board/writer" method="post" encytype="multipart/form-data">
                        <input id="title" type="text" name="title" placeholder="제목을 입력하세요."><br>
                        <textarea id="contents" name="contents" placeholder="내용을 입력하세요."></textarea>
           
				<input type="file" id="input-file" name="file">
			</div>   
			<br/><br/>     
			 <div id="new_Write_btn"> 
                        <input id="submit_btn" type="submit" name="전송" value="저장" >
                        <input id="button_btn" type="button" name="취소" value="취소" onclick="history.go(-1);" >
             </div> 
              </form>
	</div>
</body>
</html>

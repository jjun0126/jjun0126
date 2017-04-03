<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>

<script>
 	$(document).ready(function() {
	
  			$.ajax({
  				url : "${pageContext.request.contextPath }/comments/commentsList",
  				type : "GET",
  				data : {'board_NO':$('#board_NO').val()},
  	 
  			    dataType : "json",
  			    success : function(commentsList) { 
  			    	list = commentsList.list ;
  			    	console.log(list);
  							$(list).each(function(index, value) { 
  							var html = "<tr id='" + list.comments_NO +"'><th>" + list.user_ID + "</th><td>" + list.contents + "<span>&nbsp;(" + list.reg_date + ")</span></td>";

  							if (user_NO == commentsVO.user_NO) { 
  								html += "<td class='delete_comment'><a href='" + commentsVO.comments_NO + "' class='glyphicon glyphicon-remove'></a></td></tr>";
  							} 

  							$("#commentsList").append(html);

  							}); 
  						  }, 

  			   error : function(jqXHR, status, e) {
  						 console.error(status + ":" + e);
  					   }
  						   
  			 });
 		
 	
 		
		$("#comments_btn").click(function() {
		
			/* var contents = $("#commentContents").val();  
			var param="contents="+contents; +"&board_NO="+board_NO;  */
		        
			$.ajax({
				url : "${pageContext.request.contextPath }/comments/writer",
				data : {'contents':$('#contents').val(),
						'board_NO':$('#board_NO').val()},
			type :"post", 
			dataType : "json",
			
				success : function () {
					alert("댓글이 등록되었습니다.");

				}
			  })
		});
 	});
 	 
		 
	   
	
	

/* 
	$(document).on("click", ".delete_comments a", function(event) {
	
	event.preventDefault();

	var comments_no = $(this).attr("href");

	$.ajax({
	url : "${pageContext.request.contextPath }/comments/delete",
	type : "GET",
	data : { comments_NO  : comments_NO },
	
	dataType : "json",
	success : function(comments_NO ) {
			$("#" + comments_NO ).remove();
	  },
	
	error : function(jqXHR, status, e) {
			console.error(status + ":" + e);
	}
	});
	
	});  */
</script>
</head>



<body>

	<!-- 커멘트 보기, 작성 --> 
	<div>

	


		<div id="comments" class="boxshadow">
				<table>
					<tr>    
						<input type="hidden" id="board_NO" value="${board_NO}">
					<!-- 	<h1>보드넘버 ${board_NO}</h1> -->
						<td><textarea rows="5" cols="80" placeholder="덧글을 작성하세요"
								id="contents" name="contents"></textarea>
						<td>
							<button id="comments_btn" class="btn btn-default btn-sm">덧글올리기</button>
						</td>
					</tr>
				</table>
			</div>
			
			
			
			
			<div id="commentsList" class="boxshadow">
			     <table> 
                        <tr id="list">
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>  
			<c:forEach var="commentsVO" items="${commentsList.list}" varStatus="status">
				<tr>  
					<td>${commentsList.totalCnt  - (commentsList.curPage - 1)*commentsList.PAGE_SIZE - status.index}</td>

					<td><c:forEach begin="1" end="${commentsVO.depth}">&nbsp;&nbsp;</c:forEach>
						<c:choose>
							<c:when test="${commentsVO.depth > 0 }"> 
								<b>re:</b>  
							</c:when> 
						</c:choose> <a href="${pageContext.request.contextPath }/board/viewer?curPage=${commentsList.totalCnt-(map.totalCnt  - (commentsList.curPage - 1)*map.PAGE_SIZE - status.index)+1}">${commentsVO.title}</a>
					</td>
					<td>${commentsVO.user_ID}</td>
					<td>${commentsVO.reg_date}</td>
					<td>${commentsVO.hit}</td>
				</tr>
			</c:forEach>
			  
			 
			
			<tr align="center">
				<td colspan="5">
					<!-- 처음 페이지 버튼  현재 페이지가 1보다 클떄만 시작페이지 링크 생성 누르면 1페이지로 이동--> 
					<c:if test="${commentsList.curPage > 1}">
						<a href="commentsList?curPage=1">[시작]</a>
					</c:if> 
					<!-- 이전 페이지 버튼  블록이 1보다 클떄만 이전 누르면 앞 페이지 블록으로 이동--> 
					<c:if test="${commentsList.curBlock > 1}">
						<a href="commentsList?curPage=${commentsList.prevPage}">[이전]</a>
					</c:if> 
					<!-- 페이징 출력 --> 
					<c:forEach var="pageNum" begin="${commentsList.blockStart}" end="${commentsList.blockEnd}">
						<c:choose>
							<c:when test="${pageNum == commentsList.curPage }">
								<!-- 현재 페이지는 하이퍼링크 제거, 색상 처리 -->
								<span style="color: green">[${pageNum}]</span>
							</c:when>
							<c:otherwise> 
								<a href="commentsList?curPage=${pageNum}"> [${pageNum}]</a>&nbsp; 
							</c:otherwise>
						</c:choose>
					</c:forEach> <!-- 다음 버튼 현재 페이지 블록이 토탈페이지 번호보다 작을때만 다음 블록 으로 감 마지막 에 다음 안나옴--> <c:if
						test="${commentsList.curBlock < commentsList.totalBlock}">
						<a href="commentsList?curPage=${commentsList.nextPage}">[다음]</a>
					</c:if> <!-- 다음 버튼 현재 페이지가 블록이 끝블록보다 작을때만  마지막 블록 처음으로 감--> <c:if
						test="${commentsList.curPage < commentsList.totalPage}">
						<a href="commentsList?curPage=${commentsList.totalPage }">[끝]</a>
					</c:if>
					</td>
			</tr>
		</table>
			</div>
			
			 
			
	</div>
</body>
</html>

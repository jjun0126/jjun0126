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

<script     
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>  

<script>
$(document).ready(function(){
	
	
			
	
	
	
	$('#comments_btn').click(function(){
        $('#comments').toggle('slow'); 
        
           
        var board_NO = $(this).attr("value"); 
  console.log(board_NO +"보드넘버");

    	$.ajax({
			url : "${pageContext.request.contextPath }/comments/commentsList", 
			type : "GET",
			data : {'board_NO':board_NO, 
				'curPage':$('#curPage').val()},



		   success : function(result){
            $("#commentsList").html(result) ; 

 			
		    },
		    error : function() {
		    	  
		    	alert("실패!" + "보드넘버"+ board_NO);
				   }	
    	
		   }); 
    	
        
    }); 
	
	
	
	
	
	$("#commentsWrite_btn").click(function() {
		 
		/* var contents = $("#commentContents").val();  
		var param="contents="+contents; +"&board_NO="+board_NO;  */
		contents = $('#comments_writer').val();
		$.ajax({
			url : "${pageContext.request.contextPath }/comments/writer",
			data : {contents:$('textarea').val(),
					'board_NO':$('#board_NO').val()}, 
		type :"post", 
		dataType : "json",
		
			success : function () {
				alert("댓글이 등록되었습니다.");
			},
		    error : function() {
		    	  
		    	alert("등록실패!" + "보드넘버"+ board_NO);
				   }	
					
		  })
	});
	  
	
	
	
	
});
</script>


</head>
<body>
	   <div id="left_con"><div><span></span></div>
	 			  <c:forEach var="boardVO" items="${boardViewerMap.list}" varStatus="status">
                   <div id="viewer_form" class="clearfix">
                       <div id="viewer_title"><a href="${pageContext.request.contextPath }/board/viewer">${boardVO.title}</a></div>
                       <div id="viewer_kategorie"><a href="${pageContext.request.contextPath }/board/list">프로그래밍 이야기</a></div>
                   </div>
                   <div id="viewer_contents"><p>${boardVO.contents}</p>
                   </div>
                   <c:choose>
                   <c:when test="${not empty authUser && authUser.admin == 1 }">
                   <div id="modify" class="clearfix">
                       <div><a href="${pageContext.request.contextPath }/board/modify_form?board_NO=${boardVO.board_NO}"  name="modify">수정</a></div>
                       <div><a href="${pageContext.request.contextPath }/board/delete?board_NO=${boardVO.board_NO}"  name="delete">삭제</a></div> 
                       <div><a id="comments_btn" href="#" value='${boardVO.board_NO}' >덧글</a></div>
                   </div>       
                   </c:when>
                   <c:when test="${not empty authUser}">
                    <div><a id="comments_btn" href="#" value='${boardVO.board_NO}' >덧글 </a></div>
				</c:when> 
                 </c:choose>
                  
                   
                   <div id="comments">
                   <div id="commentsList"></div>
                   
                   
                   
                   
						<div id="comments_writer" class="boxshadow">
							<input type="hidden" id="board_NO" value="${board_NO}">
							<div></div>
							<div id="commentsWriter_user_ID">${commentsVO.user_ID}</div>
							<textarea id="comments_writer_contents" name="comments_writer" placeholder="덧글을 작성하세요" ></textarea>
							<button id="commentsWrite_btn" class="btn btn-default btn-sm">덧글올리기</button>
						</div> 
							
					
					</div>
					
                   
                   </c:forEach> 
                
	 
	
			<!-- 본문 페이징  -->
			  
			<table> 
			<tr align="center">  
				<td colspan="5">
					<!-- 처음 페이지 버튼  현재 페이지가 1보다 클떄만 시작페이지 링크 생성 누르면 1페이지로 이동--> 
					<c:if test="${boardViewerMap.curPage > 1}"> 
						<a href="${pageContext.request.contextPath }/board/viewer?curPage=1">[시작]</a>
					</c:if> 
					<!-- 이전 페이지 버튼  블록이 1보다 클떄만 이전 누르면 앞 페이지 블록으로 이동--> 
					<c:if test="${boardViewerMap.curBlock > 1}">
						<a href="${pageContext.request.contextPath }/board/viewer?curPage=${viewer.prevPage}">[이전]</a>
					</c:if> 
					<!-- 페이징 출력 --> 
					<c:forEach var="pageNum" begin="${boardViewerMap.blockStart}" end="${boardViewerMap.blockEnd}">
						<c:choose>
							<c:when test="${pageNum == boardViewerMap.curPage }">
								<!-- 현재 페이지는 하이퍼링크 제거, 색상 처리 -->
								<span style="color: green">[${pageNum}]</span>
							</c:when> 
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/board/viewer?curPage=${pageNum}"> [${pageNum}]</a>&nbsp; 
							</c:otherwise>
						</c:choose>  
					</c:forEach> <!-- 다음 버튼 현재 페이지 블록이 토탈페이지 번호보다 작을때만 다음 블록 으로 감 마지막 에 다음 안나옴--> 
					<c:if test="${boardViewerMap.curBlock < boardViewerMap.totalBlock}">
						<a href="${pageContext.request.contextPath }/board/viewer?curPage=${boardViewerMap.nextPage}">[다음]</a>
					</c:if> <!-- 다음 버튼 현재 페이지가 블록이 끝블록보다 작을때만  마지막 블록 처음으로 감--> 
					<c:if test="${boardViewerMap.curPage < boardViewerMap.totalPage}">
						<a href="${pageContext.request.contextPath }/board/viewer?curPage=${boardViewerMap.totalPage }">[끝]</a>
					</c:if> 
					</td>
			</tr>   
		</table>	
</div>
</body>
</html>

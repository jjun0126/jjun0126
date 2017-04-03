$(document).ready(function(){
			var board_NO = $("[name=board_NO]").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath }/comments/list",
				type: "GET",
				data: {board_NO : board_NO},
				
				dataType: "json",
				success: function(map) {
					$(map).each(function(index, commentsVO){
						
						var html = "<tr id='" + commentsVO.comments_NO +"'><th>" + commentsVO.user_ID + 
						   "</th><td>" + commentsVO.content + "<span id='date'>&nbsp;(" + commentsVO.reg_date + 
						   ")</span></td><td class='delete_comment'><a href='" + commentsVO.comments_NO  "></a></td></tr>";
				
						$("#comments_list").append(html);
						
					});
				},
				
				error : function(jqXHR, status, e) {
					console.error(status + ":" + e);
				}
			});
		});
	
		$("#comments_btn").click(function(){
			var content = $("[name=content]").val();
			var user_NO = $("[name=user_NO]").val();
			var board_NO = $("[name=board_NO]").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath }/comments/insert",
				type: "POST",
				data: {content : content, user_NO : user_NO, board_NO : board_NO},
				
				dataType: "json",
				success: function(commentsVO) {
					
					var html = "<tr id='" + commentsVO.comments_NO + "'><th>" + commentsVO.user_ID + 
							   "</th><td>" + commentsVO.content + "<span id='date'>&nbsp;(" + commentsVO.reg_date + 
							   ")</span></td><td class='delete_comment'><a href='" + commentsVO.comments_NO "></a></td></tr>";
					
					$("#comments_list").prepend(html);
					
					$("[name=content]").val("");
					
				},
				
				error : function(jqXHR, status, e) {
					console.error(status + ":" + e);
				}
			});
		});
		
		$(document).on( "click", ".delete_comment a", function(event) {
			event.preventDefault();
			
			$("[name=comments_NO]").val($(this).attr( "href" ));
			
			var comments_NO = $("[name=comments_NO]").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath }/comments/delete",
				type: "GET",
				data: {comments_NO : comments_NO},
				
				dataType: "json",
				success: function(comments_NO) {
					$("#" + comments_NO).remove();
				},
				
				error : function(jqXHR, status, e) {
					console.error(status + ":" + e);
				}
			});
			
		});
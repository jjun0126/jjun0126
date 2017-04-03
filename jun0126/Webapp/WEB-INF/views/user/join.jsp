<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head> 
<title>jun0126</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){  
	$( "#join-form" ).submit( function(){ 
		//1. 이름 체크
		if( $( "#user_Name" ).val() == "" ) {
			$( "#dialog p" ).text( "이름을 입력해 주세요." );
			$( "#dialog" ).dialog();
			$( "#user_Name" ).focus();
			return false;
		} 
		 
		//2-1. 아이디 체크
		if( $( "#user_ID" ).val() == "" ) {
			$( "#dialog p" ).text( "아이디를 입력해 주세요." );
			$( "#dialog" ).dialog();
			$( "#user_ID" ).focus();
			return false;
		}
		
		//2-2. 아이디 중복 체크 유무
		if( $( "#img-chkemail" ).is( ":visible" ) == false ){
			alert( "아이디 중복체크를 해주세요." );
			return false;
		}
		
		//3-1. 이메일 비어있는 지 체크
		if( $( "#email" ).val() == "" ) {
			$( "#dialog p" ).text( "이메일을 입력해 주세요." );
			$( "#dialog" ).dialog();
			$("#email").focus();
			return false;
		}
		
		//3-2. 이메일 중복 체크 유무
		if( $( "#img-chkemail" ).is( ":visible" ) == false ){
			alert( "이메일 중복체크를 해주세요." );
			return false;
		}
		
		//4. 비밀번호 체크
		if( $("input[type='passWord']").val() == null ) {
			alert( "비밀번호를 입력해주세요." );
			$("input[type='passWord']").focus();
			return false;
		}
		
		//5. 약관동의
		if( $( "#agree-prov" ).is( ":checked" ) == false ) {
			alert( "약관동의를 해주세요." );
			return false;
		}
		
		return true; 
	});
	   
	$( "#email" ).change( function(){
		$("#img-chkemail").hide();
		$("#btn-chkemail").show();			
	});
	
	$("#btn-chkemail").click( function(){
		var email = $( "#email" ).val();
		if( email == "" ) {
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath }/user/api/checkEmail?email=" + email,
			type: "get", 
			dataType: "json",
			data: "",
			//contentType: "application/json",
			success: function( response ) {
				console.log( response );
				if( response.result == "fail" ) {
					console.log( response.message );
					return;
				}
				
				//success
				if( response.data == "exist" ) {
					alert( "이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요." );
					$("#email").val("").focus();
					return;
				}
				
				// 존재 하지 않은 이메일
				$("#img-chkemail").show();
				$("#btn-chkemail").hide();
			},
			error: function( jqXHR, status, e ) {
				console.error( status + ":" + e );
			}
		});
	});
	$( "#user_ID" ).change( function(){
		$("#img-chkID").hide();
		$("#btn-chkID").show();			
	});
	  
	$("#btn-chkID").click( function(){
		var user_ID = $( "#user_ID" ).val();
		if( user_ID == "" ) {
			return;
		} 
		$.ajax({
			url:"${pageContext.request.contextPath }/user/api/checkID?user_ID=" + user_ID,
			type: "get",
			dataType: "json",
			data: "",
			//contentType: "application/json",
			success: function( response ) {
				console.log( response );
				if( response.result == "fail" ) {
					console.log( response.message );
					return;
				}
				
				//success
				if( response.data == "exist" ) {
					alert( "이미 존재하는 아이디입니다. 다른 아이디를 사용해 주세요." );
					$("#user_ID").val("").focus();
					return;
				}
				
				// 존재 하지 않은 이메일
				$("#img-chkID").show();
				$("#btn-chkID").hide();
			},
			error: function( jqXHR, status, e ) {
				console.error( status + ":" + e );
			}
		});
	});
});
</script>
</head>
<body>
<div id="left_con">
<div id="content">
	<div id="user">
		<form:form 
			modelAttribute="userVO" 
			id="join-form" 
			name="joinForm"
			method="post" action="${pageContext.request.contextPath }/user/join">
			
			
			<label class="block-label" for="user_ID">아이디</label>
			<form:input path="user_ID" />
			<img id="img-chkID" align="top" style="width: 16px; display: none"
				src="${pageContext.request.contextPath }/assets/images/check.png" />
			<input id="btn-chkID" type="button" value="중복체크">
			<p style="text-align: left; color: red">
				<form:errors path="user_ID" />
			</p>
	
			
				<label class="block-label" id="passWord">패스워드</label>
			<form:password path="passWord" />
			<spring:hasBindErrors name="userVO">
				<c:if test="${errors.hasFieldErrors('passWord') }">
					<p style="text-align: left; color: red">
						<spring:message
							code="${errors.getFieldError( 'passWord' ).codes[0] }"
							text="${errors.getFieldError( 'passWord' ).defaultMessage }" />
					</p>
				</c:if>
			</spring:hasBindErrors> 
			
			 
			
			
			<label class="block-label" for="user_Name">이름</label>
			<form:input path="user_Name" />
			<p style="text-align: left; color: red">
				<form:errors path="user_Name" /> 
			</p>
			

			<label class="block-label" for="email">이메일</label>
			<form:input path="email" />
			<img id="img-chkemail" align="top" style="width: 16px; display: none"
				src="${pageContext.request.contextPath }/assets/images/check.png" />
			<input id="btn-chkemail" type="button" value="중복체크">
			<p style="text-align: left; color: red">
				<form:errors path="email" />
			</p>

			<fieldset>
				<legend>약관동의</legend>
				<div>본 홈페이지는 이상준의 포트폴리오용 임시 홈페이지로 회원정보나 콘텐츠의 보안에 취약하며 회원정보와 게시물등이 사전 동의없이 삭제 될수 있음으로 평소에 사용하지 않는 아이디와 암호를 사용해주세요</div>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label>서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">
 
		</form:form>
	<div id="dialog" title="가입폼 체크" style="display: none">
		<p></p>
	</div> 
	</div>
	</div>
</div>
 
</body>
</html>

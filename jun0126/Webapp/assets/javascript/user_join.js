$("#login").click(function() {
		$("#login-Modal").modal();
	});

//로그인 체크
$("#login-btn")
.on("click",function() {
	var user_ID = $("#user_ID").val();
	var passWord = $("#passWord").val();
	
	$.ajax({
		url : "${pageContext.request.contextPath }/user/login",
		type : "POST",
		data : { user_ID : user_ID, passWord : passWord},
        dataType : "text",
		success : function(result) {
			if (result) {
					$("#login_msg").html("${pageContext.request.contextPath }/main")
			} else {location.href = "&nbsp;아이디 또는 비밀번호를 다시 확인하세요.</br>등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
			}},
			error : function(jqXHR, status, e) {
				console.error(status + ":" + e);
			}
			});
	});



$("#join").click(function() {
		$("#join-Modal").modal();
	});

// 회원가입 체크
$("#user_ID").keyup(function() {
	var user_ID = $("#user_ID").val();

	$.ajax({
		url : "${pageContext.request.contextPath }/user/idcheck",
		type : "POST",
		data : {user_ID : user_ID},
		dataType : "text",
		success : function(result) {
			if (result == true) {
				$("#id_msg").html("&nbsp;사용 가능한 아이디 입니다.");
			} else {
				$("#id_msg").html("&nbsp;이미 사용중인 아이디 입니다.");
			}
		},

		error : function(jqXHR, status, e) {
			console.error(status + ":" + e);
		}
	});
});

$("[name=passWordCheck]").keyup(function() {
	var passWord = $("#passWord").val();
	var passWordCheck = $("[name=passWordCheck]").val();

	if (passWord = passWordCheck && passWordCheck != "") {
		$("#pw_msg").html("&nbsp;비밀번호를 다시한번 확인해 주세요.");
	} else {
		$("#pw_msg").html("&nbsp;확인 되었습니다.");
	}
});

$("[name=email]").keyup(function() {
	var email = $("[name=email]").val();

	$.ajax({
		url : "${pageContext.request.contextPath }/user/emailcheck",
		type : "POST",
		data : {
			email : email
		},

		dataType : "text",
		success : function(result) {
			if (result == true) {
				$("#email_msg").html("&nbsp;사용 가능한 이메일 입니다.");
			} else {
				$("#email_msg").html("&nbsp;이미 사용중인 이메일 입니다.");
			}
		},

		error : function(jqXHR, status, e) {
			console.error(status + ":" + e);
		}
	});
});
//등록버튼
$("#join_btn").click(function() {

	if ($("#id_msg, #pw_msg, #email_msg").text() != "") {
		$("#join_msg").html("&nbsp;입력하지 않은 항목이 있습니다.");
		return false;
	} else {
		$("#join_msg").html("&nbsp;가입이 완료되었습니다 로그인 해주세요.")
		return true;
	}
});

//로그인 모달 키기 닫기
$("#login").click(function() {
	$("#login-Modal").css("display", "block");
});

$("#join").click(function() {
	$("#join-Modal").css("display", "block");
});

$("login-Modal.close").click(function() {
	$("#login-Modal").css("display", "none");
});

$("join-Modal.close").click(function() {
	$("#join-Modal").css("display", "none");
});

//밖같쪽 누르면 창닫기
$(window).click(function(event) {
	if (event.target == "#login-Modal") {
		$("#login-Modal").css("display", "none");
	} else if (event.target == "#join-Modal") {
		$("#login-Modal").css("display", "none");
	}
});
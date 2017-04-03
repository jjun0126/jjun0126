<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>main</title>
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">
</head>
<body>
    <c:import url="/WEB-INF/views/main/top.jsp" />
    <div id="wrap">
         <c:import url="/WEB-INF/views/main/header.jsp" />
        <div id="con" class="center910 clearfix">
            <div id="left_con">안녕하세요 이상준 입니다. &nbsp;<br>
            본인은 2017월 현재 스프링 프레임워크를 기반으로한 웹프로그래밍을 공부한 예비 프로그래머 입니다.&nbsp;<br>
            현재는 학점은행제를 통하여 컴퓨터 공학 전공 학위를 100학점 이상 취득한 상태이며,&nbsp;<br>
             정보처리 기사 준비중에 있습니다.&nbsp;<br>&nbsp;<br>&nbsp;<br>
            본 홈페이지는 스프링프레임워크를 기반으로 회원가입과, 관리자 전용 글쓰기 가능 게시판, 덧글달기, 방명록, 페이징 등을 구현하였으며 html, css, javascript, ajax, jquery, jsp, spring,MyBatis, maven등을 이용하여 구현하였습니다.&nbsp;<br>
        홈페이지 기획단계에서 디자인 및 구현전체에 이르는 일련의 모든 과정을 구현하며 경험해 보왔습니다.&nbsp;<br>
        또한 프로그래밍 외엔 고분자원료 분야와 물류관리 부분의 영업파트에서 3년이상의 직장생활을 통해 다양한 경험을 쌓았습니다.&nbsp;<br>
        이러한 다양한 경험과 지식이 프로그래머로서의 업무수행과 업무적응에 많은 도움이 되리라 생각합니다.&nbsp;<br>
        현 홈페이지에는 차후 홈페이지 제작과정에서 공부한 내용과 과정을 정리하여 포스팅할 예정입니다.
      문의 사항은 방명록 및 e-mail: sangjunidang@naver.com으로 보내주시면 성심성의것 답변 드리겠습니다<br><br><br><br><br>
          이상준의 홈페이지를 방분해주신  ${authUser.user_ID} 님께 다시한번 감사의 인사를 드립니다.</div>
             <c:import url="/WEB-INF/views/main/right_con.jsp" />
        </div> <!--con end-->
    </div> <!--wrap end-->
</body>
</html>
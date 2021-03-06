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
<title>list page</title>
</head> 
<body>
	<div id="left_con"><div><span></span></div>
                    <div id="serch"> 
                            <form action="${pageContext.request.contextPath }/board/list" method="get">
                                <input type="text" size="20" name="keyWord" />
                                <button type="submit">검색</button>
                            </form>
                    </div> 
                     <table> 
                        <tr id="list">
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr> 
			<c:forEach var="boardVO" items="${map.list}" varStatus="status">
				<tr>  
					<td>${map.totalCnt  - (map.curPage - 1)*map.PAGE_SIZE - status.index}</td>

					<td><c:forEach begin="1" end="${boardVO.depth}">&nbsp;&nbsp;</c:forEach>
						<c:choose>
							<c:when test="${boardVO.depth > 0 }"> 
								<b>re:</b>  
							</c:when> 
						</c:choose> <a href="${pageContext.request.contextPath }/board/viewer?curPage=${map.totalCnt-(map.totalCnt  - (map.curPage - 1)*map.PAGE_SIZE - status.index)+1}">${boardVO.title}</a>
					</td>
					<td>${boardVO.user_ID}</td>
					<td>${boardVO.reg_date}</td>
					<td>${boardVO.hit}</td>
				</tr>
			</c:forEach>
			 
			
			
			<tr align="center">
				<td colspan="5">
					<!-- 처음 페이지 버튼  현재 페이지가 1보다 클떄만 시작페이지 링크 생성 누르면 1페이지로 이동--> 
					<c:if test="${map.curPage > 1}">
						<a href="list?curPage=1">[시작]</a>
					</c:if> 
					<!-- 이전 페이지 버튼  블록이 1보다 클떄만 이전 누르면 앞 페이지 블록으로 이동--> 
					<c:if test="${map.curBlock > 1}">
						<a href="list?curPage=${map.prevPage}">[이전]</a>
					</c:if> 
					<!-- 페이징 출력 --> 
					<c:forEach var="pageNum" begin="${map.blockStart}" end="${map.blockEnd}">
						<c:choose>
							<c:when test="${pageNum == map.curPage }">
								<!-- 현재 페이지는 하이퍼링크 제거, 색상 처리 -->
								<span style="color: green">[${pageNum}]</span>
							</c:when>
							<c:otherwise> 
								<a href="list?curPage=${pageNum}"> [${pageNum}]</a>&nbsp; 
							</c:otherwise>
						</c:choose>
					</c:forEach> <!-- 다음 버튼 현재 페이지 블록이 토탈페이지 번호보다 작을때만 다음 블록 으로 감 마지막 에 다음 안나옴--> <c:if
						test="${map.curBlock < map.totalBlock}">
						<a href="list?curPage=${map.nextPage}">[다음]</a>
					</c:if> <!-- 다음 버튼 현재 페이지가 블록이 끝블록보다 작을때만  마지막 블록 처음으로 감--> <c:if
						test="${map.curPage < map.totalPage}">
						<a href="list?curPage=${map.totalPage }">[끝]</a>
					</c:if>
					</td>
			</tr>
		</table>
	</div>
</body>
</html>
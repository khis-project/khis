<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp" />

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/homepage_introduce_interview_pass/passcheck.css" />

<!-- 상단부분 -->
<section id="board-container" class="container">
	<p>총 ${totalContent}개의 면접을 지원하셨습니다.</p>

	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th class="text-center">번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">등급</th>
			<th class="text-center">합격여부</th>
			<th class="text-center">코멘트</th>
		</tr>
		<!-- 면접 리스트 불러오기 -->
		<c:forEach items="${list}" var="check">
			<tr data-no="${check.comment_no}">
				<td>${check.title}</td>
				<td>${check_co_code}</td>
				<td>${check.passcheck}</td>
				<td name="comment" id="comment"><button>확인</button></td>
			</tr>
		</c:forEach>
	</table>
		
</section>

<script> 
//window 함수 > controller 매핑 > return 값에 홈페이지 주소를 > 코멘트확인 jsp 따로
function comment(){
	window.open(`${pageContext.request.contextPath}/homepage_introduce_interview_pass/evaluatecomment.do`, "a","width=500, height=400, left =10, top=80");
}
	
</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp" />


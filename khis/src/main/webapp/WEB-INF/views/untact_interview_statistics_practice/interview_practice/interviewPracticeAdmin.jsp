<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접 연습 질문 리스트" name="title"/>
</jsp:include>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<script>
console.log("${msg}");
<c:if test="${not empty msg}">
console.log("");
alert("${msg}");
</c:if>
</script>

<!-- 해당 면접관리자의 zoom List를 가져와서 수정/삭제 만들기-->
<!-- https://life-of-panda.tistory.com/71 면접 질문 참고 -->
<div id = "zoomSection" class="text-align-center">
	<h1>면접 연습 질문/승인요청 리스트</h1>
	<table class="zoomListTb" id = "" style="">
		<tr>
			<td class = "tbColorTran" id = "btn1" onclick = "location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeAdmin.do';">전체</td>
			<td class = "tbColorTran" id = "btn2" onclick = "location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeAdmin.do?question_kind=D';">개발자</td>
			<td class = "tbColorTran" id = "btn3" onclick = "location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeAdmin.do?question_kind=B';">기본</td>
			<td class = "tbColorTran" id = "btn4" onclick = "location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeAdmin.do?admin_approval=y';">승인글</td>
			<td class = "tbColorTran" id = "btn5" onclick = "location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeAdmin.do?admin_approval=n';">미승인글</td>
		</tr>
	</table>
	<table class="zoomListTb" style="width: 1400px;">
		<tr>
			<th>번호</th>
			<th>종류</th>
			<th>질문</th>
			<th>대답</th>
			<th style="width: 100px;">키워드</th>
			<th>승인</th>

		</tr>
		
<c:if test="${!empty IQList}">

		<c:forEach items="${IQList}" var="IQ" varStatus="status">
			<tr style="text-align : left;">
				<td>${IQ.question_no}</td>
				<td>${IQ.question_kind == 'D' ? '개발자' : '기본'}</td>
				<td>${IQ.question}</td>
				<td>${IQ.answer == null ? "" : IQ.answer.replace(",","<br>")}</td>
				<td>${IQ.answer_keyword == null ? "" : IQ.answer_keyword}</td>
				<td>
					<c:if test = "${ IQ.admin_Approval == 'n'}">
						<input type="button" class="button-hover button-basic table-button" value="승인" onclick="location='${pageContext.request.contextPath}/interviewPractice/interviewPracticeUpdate.do?question_no=${IQ.question_no}';">
					</c:if>
				</td>
			</tr>

		</c:forEach>
</c:if>
	</table>
	${pagebar}
</div>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
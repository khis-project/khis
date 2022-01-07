<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="질문 목록" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#listForm {
	width: 550px;
	padding:30px;
}
#btn-add{
	float: right;
	margin-bottom: 16px;
}
#tbl-board{
	margin-top: 30px;
}
.content{
	text-align: center;
	font-size:15px;
	font-weight: bold;
}
</style>
<div id="sidebar">
	<ul>
		<li>
		면접자/면접관 관련
			<ul class = "sub">
				<li><a href="${pageContext.request.contextPath }/irmanagement/insertInterviewer.do">면접자 추가</a></li>
				<li><a href="${pageContext.request.contextPath }/irmanagement/insertRater.do">면접관 추가</a></li>
				<li><a href="${pageContext.request.contextPath }/irmanagement/irList.do">면접자/면접관 목록</a></li>
			</ul>
		</li>
		<li>
		면접 질문 관련
			<ul class = "sub">
				<li><a href="${pageContext.request.contextPath }/interview/insertInterview.do">면접 질문 추가</a></li>
				<li><a href="${pageContext.request.contextPath }/interview/interviewList.do">면접 질문 목록</a></li>
			</ul>
		</li>
		<li>
		회의실 관련
			<ul class = "sub">
				<li><a href="#">회의실 추가</a></li>
				<li><a href="#">회의실 목록</a></li>
			</ul>
		</li>
	</ul>
</div>
<%-- content --%>
<div id ="content">
<h2>면접 질문 리스트</h2>
	<div id="listForm">
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-secondary btn-sm"/>
	<table id="tbl-board" class="table table-striped table-hover">
		<tr class="text-center">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items = "${list }" var = "interview">
		<tr class="text-center" data-no ="${interview.interviewNo }">
			<td scope ="row">${interview.interviewNo }</td>
			<td>${interview.title }</td>
			<td>${interview.writer }</td>
			<td><fmt:formatDate value="${interview.regDate }" pattern="yy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</table>
	${pagebar }
	</div>
</div> 
<script>
$('#sidebar').css('height', $('#content').height()); 

	$("tr[data-no]").click((e) => {
		const $tr = $(e.target).parents("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/interview/detailInterview.do?interviewNo=\${no}`;
	});
		
	$("#btn-add").click(function() {
		location.href='${pageContext.request.contextPath}/interview/insertInterview.do'
	});


</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
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
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

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

<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
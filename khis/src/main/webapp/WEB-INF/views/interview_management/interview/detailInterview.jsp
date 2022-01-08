 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="질문내용" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#detailForm {
	width: 500px;
	padding:30px;
}

#buttons {
	text-align: center;
}
</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<%-- content --%>
<div id="content">
	<h2>${interview.title}</h2>
	<div id="detailForm">
		<form name = "interviewDeleteFrm" action="${pageContext.request.contextPath }/interview/deleteInterview.do" method = "post">
			<input type="hidden" name="interviewNo" value = "${interview.interviewNo}" />
			</form>
				<table class="table table-hover" style="text-align: center; table-layout: fixed;">
						<tr>
							<th scope = "row">질문번호</th>
							<td style = "width: 300px;">${interview.interviewNo}</td>
						</tr>
						<tr>
							<th scope = "row">작성자</th>
							<td>${interview.writer}</td>
						</tr>
						<tr>
							<th scope = "row">작성일</th>
							<td><fmt:formatDate value="${interview.regDate }" pattern="yy-MM-dd"/></td>
						</tr>
						<tr>
							<th scope = "row">제목</th>
							<td>${interview.title}</td>
						</tr>
						<tr>
							<th scope = "row">내용</th>
							<td>${interview.content}</td>
						</tr>
						<tr>
							<th scope = "row">배정 면접자</th>
							<td>${interview.irInfo.name}</td>
						</tr>
				</table>
				<div id="buttons">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/interview/updateInterview.do?interviewNo=${interview.interviewNo}'">수정</button>
					<button type="button" class="btn btn-danger" onclick = "deleteInterview();">삭제</button>
					<button id = "returnBtn" type="button" class="btn btn-light">이전</button>
				</div>
			</div>
	</div>
	

<%-- script --%>
<script>
$('#sidebar').css('height', $('#content').height()); 

function deleteInterview() {
	if(confirm("정말 삭제하시겠습니까?"))
		$('[name=interviewDeleteFrm]').submit();
}

$("#returnBtn").click((e) => {
	history.back();
});
</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
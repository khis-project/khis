<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include
	page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="면접관리자 페이지" name="title" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#indexPage {
	width: 500px;
	background: white;
}

</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>
<div id="content">
	<h2>${memberCompany.coName } ${loginMember.name }님</h2>
	<div id="indexPage" style = "height:500px;">
		컨텐츠가 추가될 공간입니다.
	</div>
</div>
<script>
$('#sidebar').css('height', $('#content').height()); 
</script>
<jsp:include
	page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp" />

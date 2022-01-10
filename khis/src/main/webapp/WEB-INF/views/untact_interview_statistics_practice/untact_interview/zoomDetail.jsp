<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="zoom 수정" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<div id = "zoomSection">
	<h1>Zoom 회의실 수정하기</h1>
	<form
			name="zoomUpdateFrm" 
			action="${pageContext.request.contextPath}/untactInterview/zoomUpdate.do" 
			method="post">
		<table class="zoomTb">
			<tr><th>api_key</th><td>: <input type="text" class="zoom_txt" id = "api_key" name = "api_key" value = "${zoomDetail.api_key }" required></td></tr>
			<tr><th>api_secret</th><td>: <input type="text" class="zoom_txt" id = "api_secret" name = "api_secret" value = "${zoomDetail.api_secret }" required></td></tr>
			<tr><th>jwt_token</th><td>: <input type="text" class="zoom_txt" id = "jwt_token" name = "jwt_token" value = "${zoomDetail.jwt_token }" required></td></tr>
			<tr><th>zoom_number</th><td>: <input type="text" class="zoom_txt" id = "zoom_number" name = "zoom_number" value = "${zoomDetail.zoom_number }" required></td></tr>
			<tr><th>zoom_password</th><td>: <input type="text" class="zoom_txt" id = "zoom_password" name = "zoom_password" value = "${zoomDetail.zoom_password }"required></td></tr>
			<tr><td><input type="hidden" class="zoom_txt" id = "zoom_no" name = "zoom_no" value = "${zoomDetail.zoom_no }"required></td>
			<td><input type="hidden" class="zoom_txt" id = "id" name="id"></td></tr><!-- 해당 zoom 정보를 추가하는 관리자 id -->
		</table>
		<table class="zoomTb">
			<tr>
				<td class ="zoomTbBtn"><input type="submit" class="interview_btn" value="수정"></td>
				<td class ="zoomTbBtn"><input type="reset" class="interview_btn" value="취소" onclick="javascript:history.back();"></td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"></jsp:include>
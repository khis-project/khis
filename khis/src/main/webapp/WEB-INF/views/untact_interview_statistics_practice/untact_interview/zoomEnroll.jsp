<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="zoom 등록" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff%27) format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<div id = "zoomSection" class="text-align-center">
	<h2 style="margin-top:50px;">Zoom 회의실 추가하기<img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoom_plus.png" width="50px" onclick="window.open('${pageContext.request.contextPath}/untactInterview/zoomHowToUse.do','_blank','height=700px, width=600px',)"/></h2>
	<label style="font-size : 7px; color : #7c7c7c;">zoom 아이콘을 클릭하면 추가 방법에 대한 설명을 확인할 수 있습니다.</label>
	<form
			name="zoomEnrollFrm" 
			action="${pageContext.request.contextPath}/untactInterview/zoomEnroll.do" 
			method="post">
		<table class="zoomTb"><!-- #1d3971 -->
			<tr><th>api_key</th><td>: <input type="text" class="zoom_txt" id = "api_key" name = "api_key" required></td></tr>
			<tr><th>api_secret</th><td>: <input type="text" class="zoom_txt" id = "api_secret" name = "api_secret" required></td></tr>
			<tr><th>zoom_number</th><td>: <input type="text" class="zoom_txt" id = "zoom_number" name = "zoom_number" required></td></tr>
			<tr><th>zoom_password</th><td>: <input type="text" class="zoom_txt" id = "zoom_password" name = "zoom_password" required></td></tr>
			<tr><th><input type="hidden" class="zoom_txt" id = "id" name="id"></th></tr><!-- 해당 zoom 정보를 추가하는 관리자 id -->
		</table>
		<table class="zoomTb">
			<tr>
				<td class ="zoomTbBtn"><input type="submit" class="button-hover button-basic" value="추가"></td>
				<td class ="zoomTbBtn"><input type="reset" class="button-hover button-basic" value="취소" onclick="javascript:history.back();"></td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"></jsp:include>
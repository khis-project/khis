<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<style>
	.zoom_txt {
		width : 300px;
	}
	.interview_btn:hover{
		background-color : black;
		color : white;
	}
</style>
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>

<form
		name="zoomEnrollFrm" 
		action="${pageContext.request.contextPath}/untactInterview/zoomEnroll.do" 
		method="post">
	<table>
		<tr><td>api_key</td><td>: <input type="text" class="zoom_txt" id = "api_key" name = "api_key" required></td></tr>
		<tr><td>api_secret</td><td>: <input type="text" class="zoom_txt" id = "api_secret" name = "api_secret" required></td></tr>
		<tr><td>jwt_token</td><td>: <input type="text" class="zoom_txt" id = "jwt_token" name = "jwt_token" required></td></tr>
		<tr><td><input type="hidden" class="zoom_txt" id = "id" name="id"></td></tr><!-- 해당 zoom 정보를 추가하는 관리자 id -->
		<tr><td colspan="2"><input type="submit" class="interview_btn" value="zoom 추가하기"></td></tr>
		<tr><td colspan="2"><input type="reset" value="취소" onclick="javascript:history.back();"></td></tr>
	</table>
</form>

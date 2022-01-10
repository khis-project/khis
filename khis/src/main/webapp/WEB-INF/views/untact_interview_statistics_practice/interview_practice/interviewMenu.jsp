<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<%
	String zoom_number = "87156082004";
	String zoom_password = "UUlpUHB6a29PeGl3R3VuSzFnalU5Zz09";
%>

<div>
	<!-- 면접 연습하기는 면접자 / 면접 예비자만 가능하게 하기 -->
	<!-- 만약 해당 기능 구현이 끝나면 개발자 테스트 부분은 결제해야지 이용가능하게 하기, 실제 카카오페이 결제 기능 넣어보기 -->
	<table class="zoomTb text-align-center">
		<tr>
			<td><img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/interviews.png" width="150px"></td>
			<td><img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/interview.png"  width="150px"></td>
		</tr>
		<tr>
			<!-- 해당 면접시작하기를 누를 떄 현재 시간에 면접이 있는지 확인 후 없다면 팝업창 띄우기-->
			<!-- 면접관은 평가화면으로 이동하고 -->
			<!-- 면접자는 zoom 화면이 띄워지게 하기 -->
			<!-- 해당 부분은 면접자 -->
			<c:if test ="">
				<td><input type="button" class="interview_btn" value="면접 시작하기" id ="interviewStartBtn"></td><!-- onclick 시 interviewPractice 화면으로 이동 -->
			</c:if>
			
			<!-- 평가 화면으로 이동 -> 후에 진기님 page로 이동 --><!-- interviewPractice -->
			<td><input type="button" class="text-align-center button-basic button-hover margin-top-basic interviewBtn-basic" value="면접 시작하기" id ="interviewStartBtn"></td><!-- onclick 시 interviewPractice 화면으로 이동 -->
			<td><input type="button" class="text-align-center button-basic button-hover margin-top-basic interviewBtn-basic" value="면접 연습하기" id ="interviewPracticeBtn" onclick="location='${pageContext.request.contextPath}/interviewPractice/interviewPractice.do';"></td><!-- onclick 시 zoom 연결로 이동 -->
			<tr><td colspan="2">
			<input type="button" id = "back" class = "text-align-center button-basic button-hover interviewBtn-basic" value="뒤로가기" onclick="javascript:history.back();">
			</td></tr>
		
		</tr>
	</table>
</div>

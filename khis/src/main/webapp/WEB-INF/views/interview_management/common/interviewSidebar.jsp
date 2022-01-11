<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<style>

	#sidebar{
		font-family: 'GmarketSansMedium';
		background-color:aliceblue;
		position:absolute;
		width:275px;
		float : left;
	}
	
	#sidebar li{
		padding: 5px 5px 5px 5px;
	 	 text-decoration: none;
	 	 font-size: 17px;
	 	 display: block;
			
	}
	
	#sidebar ul.sub li:hover {
		color:black;
	}
	#sidebar a {
		 color: #818181;
		display: block;
		text-decoration: none;
	}
</style>
<div id="sidebar">
	<ul>
		<li>
		회의실 관련
			<ul class = "sub">
				<li><a href="${pageContext.request.contextPath}/untactInterview/zoom.do">회의실 추가</a></li>
				<li><a href="${pageContext.request.contextPath}/untactInterview/zoomList.do?msg=">회의실 목록</a></li>
			</ul>
		</li>
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
		최종 평가
			<ul class = "sub">
				<li><a href="${pageContext.request.contextPath }/evaluation/finalEvaluation.do">면접 최종평가</a></li>
			</ul>
		</li>
	</ul>
</div>
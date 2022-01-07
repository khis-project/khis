<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>

#IRList {
	width : 750px;
	padding:30px;
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
	<div id="content">
		<h2>회원 목록</h2>
		<div id="IRList">
		<div class="btn-group" role="group" style = "float:right; margin-bottom: 10px;">
 			 <button id = "insertInterviewer" type="button" class="btn btn-outline-secondary btn-sm">면접자 추가</button>
 			 <button id = "insertRater" type="button" class="btn btn-outline-secondary btn-sm">면접관 추가</button>
		</div>
		<table class="table table-hover" style="text-align: center;">
  			<thead>
  				<tr>
      				<th scope="col">번호</th>
    				<th scope="col">이름</th>
      				<th scope="col">이메일</th>
      				<th scope="col">전화번호</th>
      				<th scope="col">회원구분</th>
   				</tr>
 			 </thead>
 			 <tbody>
 			 	<c:forEach items = "${list }" var = "irinfo">
 			 	<tr data-no ="${irinfo.memberInfoNo}">
 			 		<th>${irinfo.memberInfoNo }</th>
 			 		<th>${irinfo.name }</th>
 			 		<th>${irinfo.email }</th>
 			 		<th>${irinfo.phone }</th>
 			 		<th>${irinfo.role eq "I" ? "면접자" : "면접관"}</th>
 			 	</tr>
				</c:forEach>
 			 </tbody>
			</table>
			${pagebar }
			</div>
		</div>
<script>
$('#sidebar').css('height', $('#content').height()); 
	/*
		event bubbling 기반 핸들링
		tr 핸들링 > td 발생 및 전파
	*/	
	$("tr[data-no]").click((e) => {
		const $tr = $(e.target).parents("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/irmanagement/irDetail.do?memberInfoNo=\${no}`;
	});
		
	$('#insertInterviewer').click((e) => {
		location.href = `${pageContext.request.contextPath}/irmanagement/insertInterviewer.do`;
	});
	
	$('#insertRater').click((e) => {
		location.href = `${pageContext.request.contextPath}/irmanagement/insertRater.do`;
	});
</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>

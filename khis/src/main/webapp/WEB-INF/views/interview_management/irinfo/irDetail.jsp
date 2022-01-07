<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="사용자 정보 확인" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#detailForm {
	width: 450px;
	padding:30px;
}

#buttons {
	text-align: center;
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
	<div id="content">
		<h2>${irInfo.name} (${irInfo.role eq "I" ? "면접자" : "면접관"})</h2>
			<div id="detailForm">
			<form name = "irDeleteFrm" action="${pageContext.request.contextPath }/irmanagement/irDelete.do" method = "post">
			<input type="hidden" name="memberInfoNo" value = "${irInfo.memberInfoNo}" />
			</form>
				<table class="table table-hover" style="text-align: center;">
						<tr>
							<th scope = "row">회원번호</th>
							
							<td>${irInfo.memberInfoNo}</td>
						</tr>
						<tr>
							<th scope = "row">이름</th>
							<td>${irInfo.name}</td>
						</tr>
						<tr>
							<th scope = "row">이메일</th>
							<td>${irInfo.email}</td>
						</tr>
						<tr>
							<th scope = "row">주민번호</th>
							<td>${irInfo.ssn}</td>
						</tr>
						<tr>
							<th scope = "row">핸드폰 번호</th>
							<td>${irInfo.phone}</td>
						</tr>
						<tr>
							<th scope = "row">사용자 구분</th>
							<td>${irInfo.role eq "I" ? "면접자" : "면접관"}</td>
						</tr>
						<c:if test="${irInfo.role eq \"I\" }">
						<tr>
							<th scope = "row">면접 번호</th>
							<td>${irInfo.interviewerNo}</td>
						</tr>
						<tr>
							<th scope = "row">면접 방법</th>
							<td>${irInfo.category eq "C" ? "대면" : "비대면"}</td>
						</tr>
							<c:if test = "${not empty irInfo.zoomNo}">
								<tr>
									<th scope = "row">회의실 번호</th>
									<td>${irInfo.zoomNo}번 회의실</td>
								</tr>
							</c:if>
							<c:if test = "${irInfo.interviewerInfoNo > 0}">
								<tr>
									<th scope = "row">이력서</th>
									<td><button id = "interviewerInfoDetail" type = "button" class = "btn btn-primary btn-sm">이력서 확인</button></td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${irInfo.role eq \"R\" }">
						<tr>
							<th scope = "row">배정 면접자</th>
							<td>
							<c:forEach items="${interviewerNameList}" var = "name" varStatus="vs">
							${name} ${vs.last ? "" : ", "}
							</c:forEach>
							</td>
						</tr>
						</c:if>
				</table>
				<div id="buttons">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/irmanagement/irUpdate.do?memberInfoNo=${irInfo.memberInfoNo}'">수정</button>
					<button type="button" class="btn btn-danger" onclick = "deleteInfo();">삭제</button>
					<button id = "returnBtn" type="button" class="btn btn-light">이전</button>
				</div>
			</div>
	</div>
	<script>
	$('#sidebar').css('height', $('#content').height()); 
	
		function deleteInfo() {
			if (confirm("사용자 정보 삭제를 진행합니다. 정말 삭제하시겠습니까?")) {
				$(document.irDeleteFrm).submit();
			}
		}
		
		$("#returnBtn").click((e) => {
			history.back();
		});
		
		$('#interviewerInfoDetail').click((e) => {
			url = `${pageContext.request.contextPath}/irmanagement/interviewerInfoDetail.do?interviewerInfoNo=${irInfo.interviewerInfoNo}`;
			window.open(url, '_blank');
		});
	</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
	<jsp:param value="면접자 등록" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#updateForm {
	width: 450px;
	padding:30px;
}

#buttons {
	text-align: center;
}
div.interviewTime {
	display: inline-block;
	width: 47%;
}
</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>
<%-- Content --%>
	<div id="content">
		<h2>면접자 수정</h2>
		<form action = "${pageContext.request.contextPath }/irmanagement/updateInterviewer.do" name="updateInterviewerFrm" method="post">
		<input type="hidden" name="memberInfoNo" value = "${irInfo.memberInfoNo}" />
			<div id="updateForm">
					<div class="mb-4">
						<label for="name" class="form-label">이름</label> 
						<input type="text" class="form-control" id="name" name = "name" value ="${irInfo.name}" required>
					</div>
						<div class="mb-4"> 
						<label for="email" class="form-label">이메일</label> 
						<input type="email" class="form-control" id="email" name = "email" value = "${irInfo.email }"required>
					</div>
					<div class = "mb-4"> 
						<label for="ssn" class="form-label">주민번호</label> 
						<input type="text" class="form-control" name="ssn" id="ssn" value = "${irInfo.ssn }" readonly />
					</div>
					
					<div class="mb-4">
						<label for="phone" class="form-label">핸드폰</label> 
						<input type="text" class="form-control" id="phone" name = "phone" value = "${irInfo.phone }" required>
					</div>
					<div class="mb-4" id = "categories">
						<label for="categories" class="form-label">면접 유형 구분</label> <br />
						<div class="form-check form-check-inline">
  							<input class="form-check-input" type="radio" name="category" id="contacted" value="C" ${irInfo.category eq "C" ? "checked" : "" }>
  							<label class="form-check-label" for="contacted">대면</label>
						</div>
						<div class="form-check form-check-inline">
  							<input class="form-check-input" type="radio" name="category" id="untacted" value="U" ${irInfo.category eq "U" ? "checked" : "" }>
  							<label class="form-check-label" for="untacted">비대면</label>
						</div>
					</div>
					<%-- 회의실 번호 : zoom 테이블에서 불러온 뒤 foreach문 활용할 것 --%>
					<div class="mb-4" id = "zoomNo">
						<label for="zoomNo" class="form-label">회의실</label> &nbsp;
  							<!-- input class="form-check-input" type="checkbox" value="zoomNo" id="zoomClass1">
  							<label class="form-check-label" for="zoomClass1">회의실1</label>
						</div> -->
							<select class="form-select" id ="zoomNo" name = "zoomNo">
								<option selected disabled>회의실 선택</option>
  								<c:forEach items = "${zoomList }" var = "zoom" varStatus = "vs">
  									<option value="${zoom.zoomNo}" ${irInfo.zoomNo eq zoom.zoomNo ? "selected" : "" }>${vs.count}. ${zoom.zoomNo}번 회의실</option>
  								</c:forEach>
							</select>
					</div>
					<div>
						<label for="interviewTime" class="form-label">면접 시간</label>
					</div>
					
					<div class = "mb3 interviewTime">
						<input type="datetime-local" class="form-control"id = "startTime" name="startTime" value = "<fmt:formatDate value="${interviewTime.startTime}" pattern="yyyy-MM-dd'T'KK:mm"/>">
					</div>
					~
					<div class = "mb-4 interviewTime">
						<input type="datetime-local" class = "form-control" id = "endTime" name="endTime" value = "<fmt:formatDate value="${interviewTime.endTime}" pattern="yyyy-MM-dd'T'KK:mm"/>">
					</div>
					<div  class = "mb-4">
						<label for="jobPostingName" class="form-label">채용 공고 이름</label>
						<input type="text" class="form-control" id="jobPostingName" name = "jobPostingName" value = "${interviewTime.jobPostingName }" >
					</div>				
					<div class="mb-4">
						<label for="irPathCode" class="form-label">지원 경로</label> 
							<select class="form-select" id ="irPathCode" name = "irPathCode">
								<option selected disabled>지원 경로 선택</option>
  								<c:forEach items = "${irPathList }" var = "irPath" varStatus = "vs">
  									<option value="${irPath.irPathCode}" ${irInfo.irPathCode eq irPath.irPathCode ? "selected" : "" }>${vs.count}. ${irPath.irPathName }</option>
  								</c:forEach>
							</select>
					</div>
				<div id="buttons">
					<button type="submit" class="btn btn-primary">수정</button>
					<button id = "returnBtn" type="button" class="btn btn-danger">취소</button>
				</div>
			</div>
		</form>
	</div>
<script>
$('#sidebar').css('height', $('#content').height()); 

$("#returnBtn").click((e) => {
	history.back();
});

$('[name=updateInterviewerFrm]').submit(function() {
	const name = $('#name').val();
	const email = $('#email').val();
	const phone = $('#phone').val();
	const ssn1 = $('#ssn1').val();
	const ssn2 = $('#ssn2').val();
	const startTime = $('#startTime').val();
	const endTime = $('#endTime').val();
	const interviewerInfoNo = $('#interviewerInfoNo').val();
	
	if (name == '') {
		$('#nameMsg').text("이름은 필수입력값입니다.").css("color", "red").focus();
		return false;
	} else if (/^[가-힣]{2,}$/.test(name) == false) {
		$('#nameMsg').text("이름은 한글 두 글자 이상이어야 합니다.").css("color", "red").focus();
		return false;
	} else {
		$('#nameMsg').hide();
	}
	
	if (email == '') {
		$('#emailMsg').text("이메일주소는 필수입력값입니다.").css("color", "red").focus();
		return false;
	} else {
		$('#emailMsg').hide();
	}
	
	if(ssn1 == '' || ssn2 == '') {
		$('#ssnMsg').text("주민번호는 필수입력값입니다.").css("color", "red").focus();
		return false;
	} else {
		$('#ssnMsg').hide();
	}
	
	if (phone == '') {
		$('#phoneMsg').text("전화번호는 필수입력값입니다.").css("color", "red").focus();
		return false;
	} else if(/^010[0-9]{8}$/.test(phone) == false){
		$('#phoneMsg').text("유효한 전화번호가 아닙니다.").css("color", "red").focus();
		return false;
	} {
		$('#phoneMsg').hide();
	}
	
	
	if(startTime == '' || endTime == '') {
		$('#interviewTimeMsg').text("면접 시간은 필수지정값입니다.").css("color", "red").focus();
		return false;
	} else {
		$('#interviewTimeMsg').hide();
	}
	
	if(interviewerInfoNo == 0) {
		$('#interviewerInfoNoMsg').text("이력서 등록이 완료되지 않았습니다.").css("color", "red").focus();
		return false;
	} else {
		$('#interviewerInfoNoMsg').hide();
	}

	return true;
});
</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
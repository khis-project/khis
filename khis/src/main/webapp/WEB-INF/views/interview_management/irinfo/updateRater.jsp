<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접관 수정" name="title"/>
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


</style>
<%-- sidebar --%>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>
<%-- Content --%>
	<div id="content">
		<h2>면접관 수정</h2>
		<form action = "${pageContext.request.contextPath }/irmanagement/updateRater.do" name="updateRaterFrm" method="post">
		<input type="hidden" name="memberInfoNo" value = "${irInfo.memberInfoNo}" />
			<div id="updateForm">
					<div class="mb-3">
						<label for="name" class="form-label">이름</label> 
						<input type="text" class="form-control" id="name" name = "name" value ="${irInfo.name}" required>
					</div>
						<div class="mb-3">
						<label for="email" class="form-label">이메일</label> 
						<input type="email" class="form-control" id="email" name = "email" value = "${irInfo.email }"required>
					</div>
					<div class = "mb-3"> 
						<label for="ssn" class="form-label">주민번호</label> 
						<input type="text" class="form-control" name="ssn" id="ssn" value = "${irInfo.ssn }" readonly />
					</div>
					
					<div class="mb-3">
						<label for="phone" class="form-label">핸드폰</label> 
						<input type="text" class="form-control" id="phone" name = "phone" value = "${irInfo.phone }" required>
					</div>
					<div class="mb-3" id = "interviewerList">
						<label for="interviewerList" class="form-label">면접자 선택</label> <br />
						<div class="form-check">
							<c:forEach items = "${interviewerList }" var="interviewer" varStatus = "vs">
									<input type="checkbox" class = "form-check-input" name="assignedMemberInfoNo" id="${vs.count}" value="${interviewer.memberInfoNo}" />
									<label class = "form-label" for="${vs.count}">${vs.count}. ${interviewer.name}</label><br />
								</c:forEach>
						</div>
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

$('[name=insertRaterFrm]').submit(function() {
	const name = $('#name').val();
	const email = $('#email').val();
	const phone = $('#phone').val();
	const ssn1 = $('#ssn1').val();
	const ssn2 = $('#ssn2').val();
	const assignedInfoNo = $("input:checkbox[name='assignedInfoNo']:checked").length

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
	
	if(assignedInfoNo == 0) {
		$('#interviewerListMsg').text("면접자 배정이 필요합니다.").css("color", "red").focus();
		return false;
	} else {
		$('#interviewerListMsg').hide();
	}
	
	return true;
});
</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
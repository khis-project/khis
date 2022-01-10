<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접관 등록" name="title"/>
</jsp:include>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#insertForm{
	width: 450px;
	border-radius: 20px;
	padding : 30px;
}
#buttons{
    text-align: center;
}

div.ssn{
	display: inline-block;
	width: 47%;
}
</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>
<%-- Content --%>
	<div id="content">
		<h2>면접관 등록</h2>
		<form action = "${pageContext.request.contextPath }/irmanagement/insertRater.do" name = "insertRaterFrm" method="post">
		<input type="hidden" name="role" value="R" />
		<%-- value = loginMember.coCode --%>
		<input type="hidden" id = "coCode" name="coCode" value = "${loginMember.coCode }"/>
		<%-- value = loginMember.memberNo --%>
		<input type="hidden" id = "memberIrHaedNo" name="memberIrHaedNo" value = "${loginMember.memberNo }"/>
			<div id="insertForm">
					<div class="mb-4">
						<label for="name" class="form-label">이름</label> 
						<input type="text" class="form-control" id="name" name = "name" >
						<div id="nameMsg" style = "float:right; margin-top:5px;"></div>
					</div>
						<div class="mb-4">
						<label for="email" class="form-label">이메일</label> 
						<input type="text" class="form-control" id="email" name = "email" placeholder ="ex) honggd@naver.com">
						<div id="emailMsg" style = "float:right; margin-top:5px;"></div>
					</div>
					<div> 
						<label for="ssn" class="form-label">주민번호</label> 
					</div>
					<div class="mb-4 ssn"> 
						<input type="text" class="form-control" id="ssn1" name="ssn1"  maxlength = "6" placeholder = ""> 
					</div>
						- 
						<div class="mb-4 ssn"> 
						<input type="password" class="form-control" id="ssn2" name="ssn2" maxlength = "7" placeholder = "">
						<div id="ssnMsg" style = "float:right; margin-top:5px;"></div>
						</div>
					<div class="mb-4">
						<label for="phone" class="form-label">핸드폰</label> 
						<input type="text" class="form-control" id="phone" name = "phone" placeholder ="ex) 01012341234" maxlength = "11" >
						<div id="phoneMsg" style = "float:right; margin-top:5px;"></div>
					</div>
					<div class="mb-4" id = "interviewerList">
						<label for="interviewerList" class="form-label">면접자 선택</label> <br />
						<div class="form-check">
						<c:forEach items = "${interviewerList }" var="interviewer" varStatus = "vs">
						<input type="checkbox" class = "form-check-input" name="assignedInfoNo" id="${vs.count}" value="${interviewer.memberInfoNo}" />
						<label class = "form-check-label" for="${vs.count}">${vs.count}. ${interviewer.name}</label><br />
						</c:forEach>
						<div id="interviewerListMsg" style = "float:right; margin-top:5px;"></div>
						</div>
					</div>
				<div id="buttons">
					<button type="submit" class="btn btn-primary">등록</button>
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

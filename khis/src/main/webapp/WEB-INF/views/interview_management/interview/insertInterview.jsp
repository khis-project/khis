<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="질문 등록" name="title"/>
</jsp:include>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>

#insertForm{
	width:500px;
	padding:30px;
}
#buttons{
    text-align: center;
}

</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<%-- content --%>
	<div id="content" style="height: 900px;">
		<h2>질문 등록</h2>
		<form action ="${pageContext.request.contextPath }/interview/insertInterview.do" name = "insertInterviewFrm" method ="post">
		<%--value = loginMember.memberNo --%> 
		<input type="hidden" name="memberInfoNo" value ="${loginMember.memberNo }" />
		<%--value = loginMember.coCode --%> 
		<input type="hidden" name="coCode" value ="${loginMember.coCode }" />
			<div id="insertForm">
					<div class="mb-4">
						<label for="title" class="form-label">제목</label>
						<input type="text" class="form-control" id="title" name = "title">
						<div id="titleMsg" style = "float:right; margin-top: 5px;"></div>
					</div>
					<div class="mb-4">
						<label for="name" class="form-label">작성자</label>
						<input type="text" class="form-control" id="writer" name = "writer" value="${loginMember.name}" readonly>
					</div>
						<div class="mb-4">
						 <label for="content">내용</label>
 						  <textarea class="form-control" id="contentt" rows="5" name ="content"></textarea>
 						  <div id="contentMsg" style = "float:right; margin-top: 5px;"></div>
					</div>
						<div class="mb-4">
						<label for="memberInfoNoes" class="form-label">면접자 선택</label>  &nbsp;
							<select class="form-select" id ="memberInfoNoes" name = "iMemberInfoNo">
								<option selected disabled>면접자 선택</option>
  								<c:forEach items = "${list }" var = "irinfo" varStatus = "vs">
  									<option value="${irinfo.memberInfoNo}">${vs.count}. ${irinfo.name }</option>
  								</c:forEach>
							</select>
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
	
	$('[name=insertInterviewFrm]').submit(function() {
		const title = $("#title").val();
		const content = $("#contentt").val();
		
		if(title == '') {
			$('#titleMsg').text("제목은 필수입력값입니다.").css("color", "red").focus();
			return false;
		} else {
			$('#titleMsg').hide();
		}
		
		if(content == '') {
			$('#contentMsg').text("내용은 필수입력값입니다.").css("color", "red").focus();
			return false;
		} else {
			$('#contentMsg').hide();
		}
		
		return true;
	});
	</script>

<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
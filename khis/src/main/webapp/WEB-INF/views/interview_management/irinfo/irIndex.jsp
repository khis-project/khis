<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접관리자 페이지" name="title" />
</jsp:include>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#indexPage {
	width: 500px;
	background: white;
}

</style>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>
<div id="content">
	<h2>${memberCompany.coName } ${loginMember.name }님</h2>
	<div id="indexPage" style = "height:500px;">
		<h1 >면접 관리자 사용 방법</h1>
		
		 <div class="inner-container">
			<div class="tooltip">
				1.<span class="yellow underline"><b> 줌 회의실 추가</b></span>
					<span class="tooltiptext tooltip-bottom"><img src="<%=request.getContextPath()%>/resources/images/irimg1.png"></span>
			</div>
			<div class="tooltip">
				2.<span class="yellow underline"><b> 면접관 정보 추가</b></span>
					<span class="tooltiptext tooltip-bottom"><img src="<%=request.getContextPath()%>/resources/images/irimg2.png"></span>
			</div>
			<div class="tooltip">
				3.<span class="yellow underline"><b> 면접자 정보 추가</b></span>
					<span class="tooltiptext tooltip-bottom"><img src="<%=request.getContextPath()%>/resources/images/irimg3.png"></span>
			</div>
			<div class="tooltip">
				4.<span class="yellow underline"><b> 면접자/면접관 매칭</b></span>
					<span class="tooltiptext tooltip-bottom"><img src="<%=request.getContextPath()%>/resources/images/irimg4.png"></span>
			</div>
			<div class="tooltip">
				5.<span class="yellow underline"><b> 면접 질문 추가</b></span>
					<span class="tooltiptext tooltip-bottom"><img src="<%=request.getContextPath()%>/resources/images/irimg5.png"></span>
			</div>
		</div> 
	</div>
</div>
<script>
$('#sidebar').css('height', $('#content').height()); 
</script>
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/footer.jsp" />

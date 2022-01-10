<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 정의 css -->
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/firebaseImage.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />
<style>
#buttons{
	margin-top : 50px;
	text-align: center;
}
#interviewerInfoForm {
	margin-top:30px;
	margin-bottom:30px;
	width: 1000px;
	padding:25px;
}
	
h3 {
	margin-top:30px;
	margin-bottom: 30px;
	text-align : center;
}

.interviewerInfo{
	display:inline-block;
}
div.photo{
	width:200px;
	height:200px;
	float:left;
	display: inline-block;

}
.information{
	display: inline-block;
}
.info{
	width : 730px;
}

</style>
<%-- content --%>
<div id="content" >
	<form id = "insertInterviewerFrm" name="insertInterviewerFrm">
	<div id="interviewerInfoForm" style = "border:1px solid" >
<!-- 	<h2>이 력 서</h2> -->
		<h3>인 적 사 항</h3>
		<div id="interviewerInfo" style = "margin-bottom: 50px;">
			<div class="photo">
			<img id="photo_print" src="${interviewerInfo.image}" onerror="this.style.display='none'" style = "width:200px; height:200px;"><br>
			</div>
			<div class="information">
			<table class="table text-center info">
				<tr>
					<th>성 명</th>
					<td>${irInfo.name }</td>
				</tr>
				<tr>
					<th>주 민 번 호</th>
					<td>${irInfo.ssn }</td>
				</tr>
				<tr>
					<th>이 메 일</th>
					<td>${irInfo.email }</td>
				</tr>
				<tr>
					<th>핸 드 폰</th>
					<td>${irInfo.phone }</td>
				</tr>
			</table>
			</div>
		
		</div>
		<div id="career" style = "margin-bottom: 50px;">
		<h3>경 력 사 항</h3>
			<table id = "career-table" class="table" >
				<thead>
					<tr class = "text-center">
						<td>회사명</td>
						<td>경력기간</td>
						<td>시작일</td>
						<td>종료일</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items = "${careerList }" var = "career">
				<fmt:parseDate var = "parseStartTime" value="${not empty career.careerStartTime[0] ? career.careerStartTime[0] : \"\"}" pattern="yyyy-MM-ddHH:mm:ss"/>
				<fmt:parseDate var = "parseEndTime" value="${not empty career.careerStartTime[0] ? career.careerEndTime[0] : \"\"}" pattern="yyyy-MM-ddHH:mm:ss"/>
 			 		<tr class = "text-center">
 			 			<td>${not empty career.companyName[0] ? career.companyName[0] : ""}</td>
 			 			<td>${not empty career.careerTerm[0] ? career.careerTerm[0] : ""} ${not empty career.careerTerm[0] ? "개월" : "" }</td>
 			 			<td><fmt:formatDate value = "${parseStartTime}" pattern="yyyy-MM-dd"/></td>
 			 			<td><fmt:formatDate value="${parseEndTime}" pattern="yyyy-MM-dd"/></td>
 			 		</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>자 격 증</h3>
		<div id="certificate" style = "margin-bottom: 50px;">
		<table id="certificate-table" class="table">
				<thead>
					<tr class = "text-center">
						<td>자격증명</td>
						<td>발행처</td>
						<td>취득일</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items = "${certificateList }" var = "certificate">
				<fmt:parseDate var = "parseCertificateDate" value="${not empty certificate.certificateDate[0] ? certificate.certificateDate[0] : \"\" }" pattern="yyyy-MM-ddHH:mm:ss"/>
 			 		<tr class = "text-center">
 			 			<td>${not empty certificate.certificateName[0] ? certificate.certificateName[0] : ""}</td>
 			 			<td>${not empty certificate.certificateIssuer[0] ? certificate.certificateIssuer[0] : ""}</td>
 			 			<td><fmt:formatDate value="${parseCertificateDate}" pattern="yyyy-MM-dd"/></td>
 			 		</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
		<h3>자 기 소 개 서</h3>
		<div class="selfIntroduction" style = "margin-bottom: 50px; text-align: center;">
		</div>
			<div class="form-floating">
  				<textarea class="form-control"id = "selfIntroduction" name = "selfIntroduction" style="height: 250px;" readonly>${interviewerInfo.selfIntroduction }</textarea>
			</div>
			<div id="buttons">
				<button id = "closePopup" type="button" class="btn btn-danger">닫기</button>
			</div>
		</div>
		</form>
	</div>


<%-- script --%>
<script>	

	$('#closePopup').click((e) => {
		close();
	});
	
</script>
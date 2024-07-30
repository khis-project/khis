
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
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
			<img id="photo_print" src="" onerror="this.style.display='none'" style = "width:200px; height:200px;"><br>
				<input id="photo" class="file" type="file" name="mainImage" onchange="getfile()">
				<input type = "hidden" id = "imageUrl" name="image" />
			</div>
			<div class="information">
			<table class="table text-center info">
				<tr>
					<th>성 명</th>
					<td id = "name"></td>
				</tr>
				<tr>
					<th>주 민 번 호</th>
					<td id = "ssn"></td>
				</tr>
				<tr>
					<th>이 메 일</th>
					<td id = "email"></td>
				</tr>
				<tr>
					<th>핸 드 폰</th>
					<td id = "phone"></td>
				</tr>
			</table>
			</div>
		
		</div>
		<div id="career" style = "margin-bottom: 50px;">
		<h3>경 력 사 항</h3>
		<div class="btn-group" role="group" style = "float:right; margin-bottom: 10px;">
 			 <button id = "add-career-tr" type="button" class="btn btn-outline-primary btn-sm">추가</button>
 			 <button id = "del-career-tr"type="button" class="btn btn-outline-danger btn-sm">삭제</button>
		</div>
			<table id = "career-table" class="table" >
				<thead>
					<tr class = "text-center">
						<td>회사명</td>
						<td>경력기간</td>
						<td>시작일</td>
						<td>종료일</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
		<h3>자 격 증</h3>
		<div id="certificate" style = "margin-bottom: 50px;">
		<div class="btn-group" role="group" style = "float:right; margin-bottom: 10px;">
 			 <button id = "add-certificate-tr" type="button" class="btn btn-outline-primary btn-sm">추가</button>
 			 <button id = "del-certificate-tr" type="button" class="btn btn-outline-danger btn-sm">삭제</button>
		</div>
		<table id="certificate-table" class="table">
				<thead>
					<tr class = "text-center">
						<td>자격증명</td>
						<td>발행처</td>
						<td>취득일</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		
		</div>
		<h3>자 기 소 개 서</h3>
		<div class="selfIntroduction" style = "margin-bottom: 50px; text-align: center;">
			<div class="form-floating">
  				<textarea class="form-control" placeholder="자신을 소개할 수 있는 말을 적어주세요. (500자 이내)" id = "selfIntroduction" name = "selfIntroduction" style="height: 250px;"></textarea>
			</div>
		</div>
			<div id="buttons">
				<button id = "insertInterviewerInfo" type = "button" class="btn btn-primary">등록</button>
				<button id = "closePopup" type="button" class="btn btn-danger">취소</button>
			</div>
		</div>
		</form>
	</div>


<%-- script --%>
<script>
	const name = $(opener.document).find("#name").val();
	const ssn = $(opener.document).find("#ssn1").val() + "-" + $(opener.document).find("#ssn2").val();
	const email = $(opener.document).find("#email").val();
	const phone = $(opener.document).find("#phone").val();
	
	document.getElementById('name').append(name);
	document.getElementById('ssn').append(ssn);
	document.getElementById('email').append(email);
	document.getElementById('phone').append(phone);
	

	$('#add-career-tr').click((e) => {
		var insertTr = "";
		  
		  insertTr += `<tr class = "text-center">`;
		  insertTr += `<td><input class = "form form-input" type="text" name = "companyName" placeholder = "회사명"/></td>`;
		  insertTr += `<td><input class = "form form-input" type="text" name = "careerTerm" placeholder = "개월수로 입력"/></td>`;
		  insertTr += `<td><input class = "form form-input" type="date" name = "careerStartTime" /></td>`;
		  insertTr += `<td><input class = "form form-input" type="date" name = "careerEndTime" /></td>`;
		  insertTr += `<td><input type="checkbox" name = "delCareerList"/></td>`;
		  insertTr += `</tr>`;
		  
		  $('#career-table > tbody:last').append(insertTr);
	});	
	
	$('#del-career-tr').click((e) => {
		$("input:checkbox[name='delCareerList']:checked").each(function(k,kVal) {
			let a = kVal.parentElement.parentElement;
			$(a).remove();
		});
	});
	
	$('#add-certificate-tr').click((e) => {
		var insertTr = "";
		  
		  insertTr += `<tr class = "text-center">`;
		  insertTr += `<td><input class = "form form-input" type="text" name = "certificateName" placeholder = "자격증명"/></td>`;
		  insertTr += `<td><input class = "form form-input" type="text" name = "certificateIssuer" placeholder = "발행처"/></td>`;
		  insertTr += `<td><input class = "form form-input" type="date" name = "certificateDate" /></td>`;
		  insertTr += `<td><input type="checkbox" name = "delCertificateList"/></td>`;
		  insertTr += `</tr>`;
		  
		  $('#certificate-table > tbody:last').append(insertTr);
	});	
	
	$('#del-certificate-tr').click((e) => {
		$("input:checkbox[name='delCertificateList']:checked").each(function(k,kVal) {
			let a = kVal.parentElement.parentElement;
			$(a).remove();
		});
	});
	
	$('#insertInterviewerInfo').click((e) => {
		var formData = $('#insertInterviewerFrm').serialize();
		if(($("#name").text() == "") || ($("#ssn").text() == "") || ($("#email").text() == "") || ($("#phone").text() == "")){
			alert("이전 페이지에서 면접자의 정보를 입력한 뒤 추가해주세요.");	
		}else{
			$.ajax({
				url : `${pageContext.request.contextPath}/irmanagement/insertInterviewerInfo.do`,
				type : 'post',
				data : formData,
				success : function(data) {
					if(data > 0) {
						$('#interviewerInfoNo', opener.document).val(data);
						$('#btn-add', opener.document).val("등록 완료");
						$('#btn-add', opener.document).attr("disabled", "disabled");
						close();
					} else {
						alert('등록 오류!');
					}
				}, error : console.log
			});
		}
	});
	
	$('#closePopup').click((e) => {
		close();
	});
	
	
</script>
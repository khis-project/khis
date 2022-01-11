<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_join_mypage/findPassword.css"/>
<jsp:include
  page="/WEB-INF/views/Interview_review_board/common/header.jsp">
  <jsp:param value="비밀번호 찾기" name="findId" />
</jsp:include>


<title>비밀번호 찾기</title>
<div id="findPasswordForm">
	<form name="findPasswordForm"  action="${pageContext.request.contextPath}/adminApi/requestEmailAuthCode" method="post">
	<div class="container">
		<div class="findPasswordForm">
			<h2>비밀번호 찾기</h2>
			<p>아이디와 이메일을 입력해 주세요.</p>
			<div class="line"></div><br />
			<div class="content">
				<h4>아이디</h4>
				<input type="text" id="id" name="id" placeholder="아이디" required/>
			</div>
			<div class="content">
				<h4>이메일</h4>
				<input type="text" id="findPassEmail" name="findPassEmail" placeholder="이메일 주소" required/>
				<br>
			
				<input type="password" placeholder = "인증번호를 입력해주세요."  id="findPassWriteKey" style = "display:none;" />
				<input type="button" value="인증하기" id="findPassSendKey" style = "display:none;"/><br />
			<div id="findPassEmailMsg"></div>
			</div>
			<div class="submit1">
			<input type="button" value="인증번호 발송"  id = "findPassSendEmail" onClick="requestEmail()"/>
			</div>
		</div>
	</div>
</form>	
</div>

<div id="helloWorldForm">
	<form name="findPasswordForm"  action="${pageContext.request.contextPath}/findPassword" method="post">
	<div class="container">
		<div class="findPasswordForm">
			<h2>비밀번호 변경하기</h2>
			<p>인증번호와 새로운 비밀번호를 입력해주세요.</p>
			<div class="line"></div><br />
			<div class="content">
				<h4>인증 번호</h4>
				<input type="text" id="authCode" name="authCode" placeholder="인증 번호" />
			</div>
			<div class="content">
				<h4>새로운 비밀번호</h4>
				<input type="password" id="newPassword" name="newPassword" placeholder="새로운 비밀번호" />
				<br>
				<input type="password" id="confirmPassword" name="confimPassword" placeholder="새로운 비밀번호 확인" />
				<br>
			
				
			</div>	
			<div class="submit2">
			<input type="button" value="변경하기" id = "changePassSendEmail" onClick="changePassword()"/>
			</div>
		</div>
	</div>
</form>
</div>
<script>

document.getElementById("helloWorldForm").hidden = true;
//document.getElementById("findPasswordForm").hidden = true;

var id_data = document.getElementById("id").value;
var email_data = document.getElementById("findPassEmail").value;
var authCode_data = document.getElementById("authCode").value;
var newPassword_data = document.getElementById("newPassword").value;
var confirmPassword_data = document.getElementById("confirmPassword").value;
	function requestEmail(){
		
		
		id_data = document.getElementById("id").value;
		email_data = document.getElementById("findPassEmail").value;
		$.ajax({
			method: "post",
			url: `${pageContext.request.contextPath}/adminApi/requestEmailAuthCode`,
			data: {
				id: id_data,
				email: email_data
			},
			success(data){
				console.log(data);
				if(data == "??"){
					alert("해당 유저가 존재하지 않습니다.")
				}
				else if(data == ""){
					alert("인증번호를 발송하였습니다.")
					document.getElementById("helloWorldForm").hidden = false;
					document.getElementById("findPasswordForm").hidden = true;
				}
				
			},
			error: console.log
		});
		
		//alert("인증번호를 발송하였습니다.")
		
	}
	
	

	
	//url: `${pageContext.request.contextPath}/managementApi/changePassword`,
	function changePassword(){
		
		id_data = document.getElementById("id").value;
		email_data = document.getElementById("findPassEmail").value;
		authCode_data = document.getElementById("authCode").value;
		newPassword_data = document.getElementById("newPassword").value;
		confirmPassword_data = document.getElementById("confirmPassword").value;
		if(newPassword_data != confirmPassword_data) {
			alert("비밀번호가 틀립니다.");
			return ;
		}
		$.ajax({
			method: "post",
			url: `${pageContext.request.contextPath}/adminApi/changePassword`,
			data: {
				id: id_data,
				email: email_data,
				authCode : authCode_data,
				newPassword: newPassword_data,
				confirmPassword: confirmPassword_data
			},
			success(data){
				console.log(data);
				if(data == "fail") {
					alert("인증코드가 일치하지 않습니다.")
				}
				else if(data == "Not Matched"){
					alert("비밀번호가 일치하지 않습니다.")
				}
				else if(data == ""){
					alert("비밀번호가 성공적으로 변경 되었습니다.")
					  location.href = "${pageContext.request.contextPath}/member/loginForm.do";
				}
				
			},
			error: console.log
		});
		
		//alert("인증번호를 발송하였습니다.")
		
	}
</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"></jsp:include>
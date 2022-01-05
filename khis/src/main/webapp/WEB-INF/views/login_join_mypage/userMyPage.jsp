<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
	console.log("${msg}");
	<% session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>

<html>
<title>회원가입</title>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/css/login_join_mypage/myPage.css" />
</head>
<body>
	<div class="container">
		<div class="w1280"><br />
			<h1><br><br>My Page<i class="fab fa-pagelines"></i></h1><br /><br />
			
			<div class="box">
				<div class="information">
					<span><br>회원정보</span><br><br> 
					<span><a href="http://localhost:9090/khis/member/updateForm.do">
						<i class="fas fa-user-lock fa-9x"></i></a></span>
					<p>소중한 개인 정보, 확인 및 수정이 가능해요.</p>
				</div>
				<div class="unregister">
					<span><br>회원탈퇴</span><br><br>
					<span><i class="far fa-hand-paper fa-9x" style="color: #34495E;"></i></span>
					<p>khis 이용을 그만 두시겠어요?</p>
				</div>
				<div class="InterviewP">
					<span><br>면접 연습 질문 요청하기</span><br><br>
				    <span><i class="fas fa-pencil-alt fa-9x" style="color: #34495E;"></i></span>
					<p>면접 연습하시면서 필요하다고 <br />생각하는 질문들을 적어주세요. </p>
				</div>			
			</div>
		</div>
	</div>
</body>
</html>
<script>
var args = {
	url: `${pageContext.request.contextPath}/join/memberDelete.do`,
	type: 'DELETE',
	success: function (data){
		console.log(data);
		const {success} = data;
		if(success == true){
			alert('그동안 khis를 이용해 주셔서 감사합니다:)');
			location.href = `${pageContext.request.contextPath}/member/loginForm.do`;
		} else {
			alert('시스템의 문제로 탈퇴가 되지 않았습니다.');
		}
	},
	error: console.log
};

$('.unregister').click(function() {
	if (confirm('탈퇴하시겠습니까?')) {
		$.ajax(args);
	}
});
</script>
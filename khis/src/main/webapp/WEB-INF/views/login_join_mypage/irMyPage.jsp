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
	<%session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>

<html>
<title>면접자 마이페이지</title>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/css/login_join_mypage/irMyPage.css" />	  
</head>
<body>
	<div class="container">
		<div class="w1280"><br />
			<h1><br><br>My Page<i class="fab fa-pagelines"></i></h1><br /><br />		
			<div class="box">
				<div class="information">
					<span><br>회원정보</span><br><br> 
					<span><a href="http://localhost:9090/khis/member/updateForm.do">
						<i class="fas fa-user-lock fa-7x" style="color: #34495E;"></i></a></span>
					<p>소중한 개인 정보,<br /> 확인 및 수정이 가능해요.</p><p2>* [ 수정은 주소만 변경 가능합니다.:) ]</p2>
				</div>
				<div class="unregister">
					<span><br>회원탈퇴</span><br><br>
					<span><i class="far fa-hand-paper fa-7x" style="color: #34495E;"></i></span>
					<p>khis 이용을 그만 두시겠어요?</p>
				</div>
				<div class="schedule">
					<span><br>면접 일정</span><br><br>
				    <span><a href="http://localhost:9090/khis/member/schedule.do">
				      <i class="fas fa-tasks fa-7x" style="color: #34495E;"></i></a></span>
					<p>나의 면접 일정을 한눈에 볼 수 있어요.</p>
				</div>
				<div class="Interview">
					<span><br>면접 보기</span><br><br>
				    <span><i class="fas fa-chalkboard-teacher fa-7x" style="color: #34495E;"></i></span>
					<p>노력은 배신하지 않아요. <br /> 후회 없는 면접이 되시길 바라요.:)</p>
				</div>
				<div class="InYNCo">
					<span><br>면접결과 및 코멘트</span><br><br>
					<span><i class="far fa-handshake fa-7x" style="color: #34495E;"></i></span>
					<p>나와 함께할 회사는 어디일까요? <br />중요한 정보가 될 수 있는 면접관님의 코멘트를 볼 수 있어요.</p>
				</div>
				<div class="InterviewP">
					<span><br>면접 연습 질문 요청하기</span><br><br>
				    <span><i class="fas fa-pencil-alt fa-7x" style="color: #34495E;"></i></span>
					<p>면접 연습하시면서 필요하다고 <br />생각하는 질문들을 적어주세요. </p>
				</div>
			</div> 
			<br /><br /><br /><input type="button" class="mainBtn" id="mainBtn" value="← 메인 페이지로 돌아가기" onClick="mainBtn()">
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

function mainBtn(){
	  location.href = "${pageContext.request.contextPath}/";
	} 
</script>

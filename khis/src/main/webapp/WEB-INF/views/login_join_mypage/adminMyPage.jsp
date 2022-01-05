<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<html>
<title>관리자 마이페이지</title>
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
					<span><br>회원리스트</span><br><br> 
					<span><a href="http://localhost:9090/khis/admin/adminMemberList.do">
						<i class="fas fa-user-lock fa-9x" style="color: #34495E;"></i></a></span>
						<p>회원들의 정보를 확인 및 수정합니다.</p>
				</div>
				<div class="schedule">
					<span><br>면접 일정</span><br><br>
				    <span><a href="http://localhost:9090/khis/member/schedule.do">
				    <i class="fas fa-tasks fa-9x" style="color: #34495E;"></i></a></span>
				    <p>회원들의 면접 일정을 확인합니다.</p>
				</div>
			  <div class="InterviewP">
          <span><br>면접 연습 질문 승인하기</span><br><br>
            <span><i class="fas fa-pencil-alt fa-9x" style="color: #34495E;"></i></span>
            <p>회원들의 면접 질문에 대한 <br />요청 내역 입니다. </p>
        </div>
			</div>
			<br /><br /><br /><input type="button" class="mainBtn" id="mainBtn" value="← 메인 페이지로 돌아가기" onClick="mainBtn()">
		</div>
	</div>
</body>
<script>
function mainBtn(){
	location.href = "${pageContext.request.contextPath}/";
}	
</script>
</html>

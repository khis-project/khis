<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
  <jsp:param value="로그인" name="title"/>
</jsp:include>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_join_mypage/loginForm.css"/>

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
	console.log("${msg}");
	<% // session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>

<title>로그인</title>
<form name="loginForm" action="<%=request.getContextPath()%>/login/loginmember" method="POST">
	<div class="container">
		<div class="loginForm">
			<h2>Log-in</h2>
			<div class="content">
				<h4>ID</h4>
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
			</div>
			<div class="content">
				<h4>Password</h4>
				<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="type">
					<a href="<%=request.getContextPath()%>/member/joinForm.do" style="margin-right: 135px;">회원가입&nbsp;</a> 
					<a href="<%=request.getContextPath()%>/member/findIdForm.do">아이디 찾기&nbsp;</a>
					<a href="<%=request.getContextPath()%>/member/findPasswordForm.do">비밀번호 찾기</a>
			</div>
			<div class="submit">
				<input type="submit" value="로그인">
			</div>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"></jsp:include>
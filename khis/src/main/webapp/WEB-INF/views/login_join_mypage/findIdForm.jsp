<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_join_mypage/findId.css"/>


<c:if test="${not empty msg}">
<script>
  alert("${msg}");
  console.log("${msg}");
  <%session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>

<body>
<form name="findIdForm" action="<%=request.getContextPath()%>/admin/findId.do"
	method="post">
	<div class="container">
		<div class="findIdForm">
			<h2>아이디 찾기</h2>
			<p>회원 가입 시 입력하신 이름과 이메일을 통해 찾을 수 있습니다.</p>
			<div class="line"></div>
			<div class="content">
				<br /><h4>휴대폰 번호</h4>
				<input type="text" id="phone" name="phone" placeholder="- 없이 입력하세요." />
			</div>
			<div class="content">
				<h4>이메일</h4>
				<input type="text" id="email" name="email" placeholder="이메일 주소" />
			</div>
			<div class="submit"><br />
			<input type="submit" value="확인" />
			</div>
		</div>
	</div>
</form>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_join_mypage/aggrement.css"/>

<html>
<head>
<title>개인정보 수집ㆍ이용 동의</title>
</head>
<body>
<form name="companyForm" action="<%=request.getContextPath()%>/join/aggrement.do" method="GET">
	<div class="container">
		<div class="aggrementForm">
			<h2>▶ 개인정보 수집ㆍ이용 동의</h2>
			<br />	
			<br />	
			<h3>회원가입을 위해서는 아래와 같이 개인정보를 수집ㆍ이용합니다.</h3>
			<h4>1. 개인정보 수집 목적 : 회원관리,  고지사항 전달</h4>
			<h4 style="margin-left: px;padding-left: 95px;width: 530px;">2. 개인정보 수집 항목 : ID, 비밀번호, 이메일, 핸드폰, 주소</h4>
			<h4>3. 보유 및 이용기간 : 가입날 부터 1개월 후 파기</h4>
			<br />
			<br />
			<h5>*개인정보 수집 및 이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 회원가입이 불가합니다.</h5>
			
			<br />
			<br />

			<div class="aggrement">
				<label class="test" for="test">위 개인정보 수집ㆍ이용에 동의합니다(필수) 동의함.</label>
				<input type="checkbox" class="aggrement" id="aggrement" onClick="window.close()">
				
			</div>
		</div>
	</div>
</form>
</body>
</html>


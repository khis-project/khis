<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/homepage_introduce_interview_pass/common.css" />

<%
	/* User loginUser = (User)session.getAttribute("loginUser"); */
%>

</head>
<body>
<!--헤더-->
<div id="wrap">
        <!--wrap-->
        <header id="header1" class="clearfix">
                <a href="#" class="logo"><img src="<%=request.getContextPath()%>/resources/images/khis_logo.png" alt="로고"></a>
            <div id="container">
				<ul class="myMenu">
					<li class="menu1"><a href="#">홈</a></li>
					<li class="menu2" name=""><a >면접 연습</a>
						<ul class="submenu">
							<li><a href="#">테스트</a></li>
						</ul>
					</li>
					<li class="menu3" name=""><a href="#">면접 후기</a>
						<ul class="submenu">
							<li><a href="#">글쓰기</a></li>
						</ul>
					</li>
					<li class="menu4">
						<a href="#"><img src="<%=request.getContextPath()%>/resources/images/user.png"	></a>
						<ul class="submenu">
						<%-- <% if(loginUser == null){ %> --%>
							<li><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						<%-- <% }else{ %> --%>
							<li><a href="#">My</a></li>
							<li><a href="#">로그아웃</a></li>
						<%-- <% } %> --%>
						</ul>
					</li>
				</ul>
			</div>
        </header>
</div>


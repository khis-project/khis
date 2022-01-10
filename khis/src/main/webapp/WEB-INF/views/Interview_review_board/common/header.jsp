<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- header css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/common.css"/>

<%
	/* User loginUser = (User)session.getAttribute("loginUser"); */
%>
</head>
<script>
	$(document).ready(function(){
		$('.myMenu .submenu').hide();
		$('.menu5').mouseover(function() {
			$('.submenu').stop().slideDown();
		});
		$('.submenu').mouseover(function() {
			$('.submenu').stop();
		});
		$('.menu5').mouseleave(function() {
			$('.submenu').slideUp();
		});
		$('.submenu').mouseleave(function() {	
			$('.submenu').slideUp();
		});
	});
</script>
<body>
<!--헤더-->
        <!--wrap-->
     <header>
		<div class="wrap">
        	<div id="left-box">
                <a href="${requestContext.request.contextPath}/khis" class="logo"><img src="<%=request.getContextPath()%>/resources/images/khis_logo2.png" alt="로고"/></a>
            </div>
            <div id="right-box">
				<ul class="myMenu">
					<li class="menu1"><a href="${pageContext.request.contextPath}">홈</a></li>
					<li class="menu2"><a href="">면접연습</a></li>
					<li class="menu3"><a href="${pageContext.request.contextPath}/Interview_review_board/boardList.do">면접후기</a></li>
					<li class="menu4"><a href="#">공채달력<img src="https://i.ibb.co/94XTF6R/halloween.png"/></a></li>
					<li class="menu5">MY
						<ul class="submenu">
						<%-- <% if(loginUser == null){ %> --%>
							<li style="border-radius:10px 10px 0 0;"><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						<%-- <% }else{ %> --%>
							<li><a href="#">마이페이지</a></li>
							<li style="border-radius:0 0 10px 10px"><a href="#">로그아웃</a></li>
						<%-- <% } %> --%>
						</ul>
					</li>
				</ul>
			</div>
		</div>
    </header>

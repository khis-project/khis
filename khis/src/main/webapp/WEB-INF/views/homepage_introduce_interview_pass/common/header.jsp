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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/homepage_introduce_interview_pass/common.css" />

<%
  /* User loginUser = (User)session.getAttribute("loginUser"); */
%>

</head>
<body>
<!--헤더-->
<div id="wrap">
        <!--wrap-->
        <header id="header1" class="clearfix">
                <a href="#" class="logo"><img src="<%=request.getContextPath()%>/resources/images/khis_logo2.png" alt="로고"></a>
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
            <a href="#"><img src="<%=request.getContextPath()%>/resources/images/user.png"  ></a>
            <ul class="submenu">
            <c:if test="${empty loginMember}">
            
            
              <li><a href="<%=request.getContextPath()%>/member/loginForm.do">로그인</a></li>
              <li><a href="<%=request.getContextPath()%>/member/joinForm.do">회원가입</a></li>
            </c:if>
            <c:if test="${not empty loginMember}">
            <c:if test="${loginMember.kind == 'ADMIN'}">
            <li><a href="<%=request.getContextPath()%>/member/adminMyPage.do">관리자<br />페이지</a></li>
            </c:if>
            
            <!-- IR_HAED 면접관리자 -->
            <c:if test="${loginMember.kind == 'IR_HAED'}">
            <li><a href="<%=request.getContextPath()%>/member/irHMyPage.do">마이<br />페이지</a></li>
            </c:if>
            
            <!-- IR 면접자 -->
            <c:if test="${loginMember.kind == 'IR'}">
            <li><a href="<%=request.getContextPath()%>/member/irMyPage.do">마이<br />페이지</a></li>
            </c:if>
            
            <!-- IR_SUPERVISOR 면접관 -->
            <c:if test="${loginMember.kind == 'IR_SUPERVISOR'}">
            <li><a href="<%=request.getContextPath()%>/member/irSMyPage.do">마이<br />페이지</a></li>
            </c:if>
            
            <!-- USER 예비면접자 -->
            <c:if test="${loginMember.kind == 'USER'}">
            <li><a href="<%=request.getContextPath()%>/member/userMyPage.do">마이<br />페이지</a></li>
            </c:if>
              <li><a href="<%=request.getContextPath()%>/login/logout.do">로그아웃</a></li>      
            </c:if>
            </ul>
          </li>
        </ul>
      </div>
        </header>


</div></body></html>
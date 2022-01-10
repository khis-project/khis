<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp"/>

<!-- 페이징 bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 사용자 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/boardList.css"/>

<section id="board-container" class="container">
  <div id="left">
		<div id="occupation-container">
			<h4>산업군</h4>
			<ul id="nav">
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=1">서비스업</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=2">제조/화학</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=3">의료/제약/복지</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=4">유통/무역/운송</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=5">교육업</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=6">건설업</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=7">IT/웹/통신</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=8">미디어/디자인</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=9">은행/금융업</a></li>
				<li><a class="categories" href="${pageContext.request.contextPath}/Interview_review_board/boardList.do?occupationCd=10">기관/협회</a></li>
			</ul>
		</div>
	  <button type="button" class="writing" id="writing" onClick="writeBtn()">면접 후기 글 작성</button>
  </div>
	<c:if test="${totalContent eq '0'}">
		<div class="company-container">하잉
		</div>
	</c:if>
	<c:if test="${totalContent ne '0'}">
	<div class="company-container">
		<c:forEach items="${allList}" var="board">
			<a href="${pageContext.request.contextPath}/Interview_review_board/boardDetail.do?coCode=${board.co_code}&occupationCode=${board.occupation_code}&score=${board.score}" class="url">
			<div class="company-box">
				<div class="img-box"><img src="${board.occupation_img_url}" style="width: 70px; height: 75px;"/></div>
				<div class="text-box">
					<div class="title_box">${board.co_name}</div>
					<div class="occupationName_box">${board.occupation_name}</div>
					<div class="countBoard">총 ${board.count_board}개의 면접후기</div>
				</div>
				<div class="company_score"><span style="color:#2196f3;">★&nbsp;</span><span>${board.score}</span></div>
			</div>
			</a>
		</c:forEach>
		${pagebar}
	</div>
	</c:if>
</section> 
<script>
	$("#nav li").on("click", function() {
		$(this).children.css('color', 'red');
	})
	
  function writeBtn(){
    location.href = "${pageContext.request.contextPath}/Interview_review_board/boardForm.do";
  } 	
</script>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>




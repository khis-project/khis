<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp"/>
<!-- 페이징 bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- 사용자 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/boardDetail.css"/>
<div style="height:auto; background-color:#34495e; padding:20px;">
	<div class="board-container">
		<c:forEach items="${list}" var="co" varStatus="status" begin="0" end="0">
		<div id="foo">
			<div id="co_img"><img src="${co.OCCUPATION_IMG_URL}"/></div>
		</div>
		<div id="co_info">
			<div id = "bo_no" style="display:none;">${co.BOARD_NO}</div>
			<div id="co_name"><h3>${co.CO_NAME}</h3></div>
			<div id="occupation_name"><span>${co.OCCUPATION_NAME}</span></div>
			<span style="color:#2196f3;">★&nbsp;</span><span id="co_evaluation_avg">${score}</span>
			<div class="statics_form" style="display:flex; flex-direction: row;">
				<div class="difficulty_form">
					<div class="row_title" style="margin:10px;">면접 난이도 평균</div>
					<div class="score" style="text-align: center; margin: 20px;">
						<span style="font-size: xxx-large;">
							${interViewAvg}
						</span>
					</div>
					<div style="text-align:center;">
						<div style="margin-bottom: 5px;">
						<input type="range" value="${interViewAvg}" min="1" max="100" id="myRange" disabled/>
						</div>
						<span style="margin-right:160px; ">쉬움(0)</span>
						<span>어려움(100)</span>
					</div>
				</div>
				<div class="graph_form" style="background-color:blue;">
				
				</div>
			</div>
		</div>
		</c:forEach>
		<div class="content">
			<c:forEach items="${list}" var="board">
			<div class="content_box1">
				<div class="content-top">
					<img src="https://i.ibb.co/6FCnkc5/profile-user.png" alt="" />
					<div class="content-top-text">
					<span>${board.EMPLOYMENT_TYPE}</span>
					<span>/</span>
					<span>${board.REG_DATE}</span>
					</div>
					<div class="btn">
						<a href="${pageContext.request.contextPath}/Interview_review_board/boardUpdate.do?boardNo=${board.BOARD_NO}">수정</a>
						<a href="${pageContext.request.contextPath}/Interview_review_board/boardDelete.do?boardNo=${board.BOARD_NO}" id="delete_btn">삭제</a>
					</div>
				</div>
				<div class="content_box2">
					<div class="menu">
						<span class="menu_title">면접난이도</span><br>
						<c:choose>
						<c:when test="${board.INTERVIEW_DIFFICULTY eq 20}"><span class="difficulty" style="background-color:#6fba1f; color:#fff;">매우쉬움</span><br></c:when>
						<c:when test="${board.INTERVIEW_DIFFICULTY eq 40}"><span class="difficulty" style="background-color:#8ad43b; color:#fff;">쉬움</span><br></c:when>
						<c:when test="${board.INTERVIEW_DIFFICULTY eq 60}"><span class="difficulty" style="background-color:#fb9f00; color:#fff;">보통</span><br></c:when>
						<c:when test="${board.INTERVIEW_DIFFICULTY eq 80}"><span class="difficulty" style="background-color:#fb6400; color:#fff;">어려움</span><br></c:when>
						<c:when test="${board.INTERVIEW_DIFFICULTY eq 100}"><span class="difficulty" style="background-color:#e7391d; color:#fff;">매우어려움</span><br></c:when>
						</c:choose>
						<br>
						<span class="menu_title">면접일자</span><br>
						<span>${board.INTERVIEW_DATE}</span><br>
						<br>
						<span class="menu_title">면접경로</span><br />
						<span>${board.INTERVIEW_PATH}</span>
					</div>
					<div class="review">
						<div class="review_box">
						<div class="title"><h4 style="margin-top:0; font-weight:bold;" >“ ${board.TITLE} ”</h4></div>
						<div class="question">
						<span class="row_title">면접질문</span><br>
						${board.INTERVIEW_QUESTION}
						</div>
						<div class="answer">
						<span class="row_title">면접답변 혹은 느낀점</span><br>
						${board.INTERVIEW_ANSWER}
						</div>
						<div class="employment">
						<span class="row_title">채용방식</span><br>
						${board.RECRUITMENT_METHOD}
						</div>
						<div class="announcement">
						<span class="row_title">발표시기</span><br>
						${board.ANNOUNCEMENT_TIME}일 후
						</div>
						</div>
						<div class="result">
							<div class="passcheck" style="margin-right:50px;">
								<span class="row_title">면접결과</span>
								<c:choose>
								<c:when test="${board.PASSCHECK eq 'Y'}">
								<span class="check_yn">
									합격
								</span>
								</c:when>
								<c:otherwise>
								<span class="check_yn">
									불합격
								</span>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="evaluation">
								<span class="row_title">면접평가</span>
								<c:choose>
								<c:when test="${board.INTERVIEW_EVALUATION eq 5}">
								<span class="abcde">A</span>
								</c:when>
								<c:when test="${board.INTERVIEW_EVALUATION eq 4}">
								<span class="abcde">B</span>
								</c:when>
								<c:when test="${board.INTERVIEW_EVALUATION eq 3}">
								<span class="abcde">C</span>
								</c:when>
								<c:when test="${board.INTERVIEW_EVALUATION eq 2}">
								<span class="abcde">D</span>
								</c:when>
								<c:when test="${board.INTERVIEW_EVALUATION eq 1}">
								<span class="abcde">E</span>
								</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		${pagebar}
	</div>
</div>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
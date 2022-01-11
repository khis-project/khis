<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접 연습 질문 등록" name="title"/>
</jsp:include>
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff%27) format('woff');
    font-weight: normal;
    font-style: normal;
}
div {
	font-family: 'GmarketSansMedium';
}
</style>
<div id = "interviewPracticeSection" class="text-align-center">
		<div class="text-line-height text-align-center" id = "practiceNotice">
		<h1>면접 연습 질문 추가하기</h1>
			해당 부분은 면접 연습 부분에 질문을 추가하는 부분입니다.<br>
			개발자 부분 등록 시 복수개의 답변은 , 로 구분해주세요.<br>
			추가해주신 질문은 익명으로 관리되며 관리자의 승인 여부에 따라 적용됩니다.<br>
			감사합니다. <br>	
		</div>	
	<form
			name="iqpFrm" 
			action="${pageContext.request.contextPath}/interviewPractice/interviewePracticeinsert.do" 
			method="post">
		<table class="zoomTb Tbth"><!-- #1d3971 -->
			<tr><th>종류</th><td> : <select name="question_kind" style="width:350px;" class="text-align-center"><option value="B">기본</option><option value="D">개발자</select></td></tr>
			<tr><th>질문</th><td> : <input type="text" class="zoom_txt" id = question name = "question" style="width:350px;" required></td></tr>
		</table>
		<table class="zoomTb Tbth display-none"><!-- #1d3971 -->
			<tr><th>답변</th><td> : <input type="text" class="zoom_txt" id = "answer" name = "answer" style="width:350px;"></td></tr>
			<tr><th>언어</th><td> : <select name="language_kind" style="width:350px;" class="text-align-center"><option value="c">C</option><option value="java" selected>JAVA</select></td></tr>
			<tr><th>키워드</th><td> : <input type="text" class="zoom_txt" id = "answer_keyword" name = "answer_keyword" style="width:350px;"></td><td class = "display-none"><input type="hidden" name="admin_Approval"></td></tr>
		</table>
		<table class="zoomTb">
			<tr>
				<td class ="zoomTbBtn"><input type="submit" class="button-hover button-basic" value="추가"></td>
				<td class ="zoomTbBtn"><input type="reset" class="button-hover button-basic" value="취소" onclick="javascript:history.back();"></td>
			</tr>
			<tr class="text-align-center"><td colspan="2">
				<input type="button" id = "back" class = "text-align-center button-basic button-hover interviewBtn-basic" value="뒤로가기" onclick="javascript:history.back();">
			</td></tr>
		</table>
	</form>
</div>

<script>
$("[name=question_kind]").change(function () {
	const kind = $("[name=question_kind] option:selected").val();
	if(kind == "D"){
		$(".display-none").css("display","inline-block");
	}else{		
		$(".display-none").css("display","none");
		//값 초기화
		$("#answer").val("");
		$("#answer_keyword").val("");
		$("#language_kind").val("");
	}
});

</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
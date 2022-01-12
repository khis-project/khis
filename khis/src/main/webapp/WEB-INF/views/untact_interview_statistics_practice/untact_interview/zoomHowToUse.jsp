<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/untact_interview_statistics_practice/untact_interview.css"/>
<div id = " zoomSection">
	<div style="text-align : center; margin-top : 30px">
		<img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoom_plus.png" width="30px">
		<h1 style="display : inline;">Zoom 회의실 추가하는 방법</h1>
	</div>
	<div class="left-display">
	<p style="font-size : small; text-align : center; margin-top : -5px;"><b>굵은 글씨</b>에 마우스를 갖다 놓으면 해당 부분의 이미지를 볼 수 있습니다.</p>
		<p class="img-hover-display">1. https://marketplace.zoom.us/ 에 접속해 회원가입을 진행합니다.</p>
		<p class="img-hover-display"><b>2. 로그인 후 상단 메뉴에 Develop 부분의 Build App 부분을 클릭합니다.</b>
									<br><label style="font-size : 9px; color : #7c7c7c;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당 메뉴가 보이지 않다면 로그인이 되어있는지 확인해주세요.</label></p>
		<img id = "use" src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoomuse1.png" class="preview" width="500px">
		<p class="img-hover-display"><b>3. JWT 부분의 Create를 누르고 이름을 입력합니다.</b></p>
		<img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoomuse2.png" class="preview" width="500px">
		<p class="img-hover-display"><b>4. 입력해야되는 부분을 입력한 뒤 API Key와 API Secret을 메모해둡니다.</b></p>
		<img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoomuse3.png" class="preview" width="500px">
		<p>5. https://zoom.us/ 페이지에서 내 계정을 클릭한뒤 회의를 클릭합니다.</p>
		<p class="img-hover-display"><b>6. 회의실 번호와 pwd를 메모해둡니다.</b></p>
		<img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoomuse4.png" class="preview" width="500px">
		<p>7. zoom 회의실 추가 폼에 위에 메모해두었던 데이터를 입력합니다.</p>
		<p>8. zoom 회의실을 추가한다.</p>
	</div>
	<div class="left-display flex-div">
	</div>
</div>
<script>
	$(".img-hover-display").hover(function(){
		$(this).next().css('display','block');
	},function(){
		if($(this).next().prop('tagName') == 'IMG')
			$(this).next().css('display','none')
	});

</script>
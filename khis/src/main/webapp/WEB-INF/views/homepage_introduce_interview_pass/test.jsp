<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/homepage_introduce_interview_pass/landing.css" />

<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<div class="slide">
    <input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <input type="radio" name="pos" id="pos5">
    <input type="radio" name="pos" id="pos6">
    <ul>
      <li id="test2">
    	<section class="container">
			<h1 class="title">
				<span>비대면</span>
				<span>취업준비</span>
				<span>대비 사이트</span>
			</h1>
			
			<h2 class="title">
				<span>비대면면접</span>
				<span>서비스</span>
				<span >K H I S</span>
			</h2>
		</section>
    </li>
      <li id="landing-one">
    	<div class="one-one">
			<p> 취업에 한 걸음 더 가까워지는 </p>
			<h2>비대면 취업 준비 서비스</h2>
			<h1> K H I S</h1>
		</div>
		<div class="one-two">
			<img src="<%=request.getContextPath()%>/resources/images/LANDING.png">
		</div>
    </li>
    <li id="landing-two">
    	<h1> K H I S, <span class="tow-text-blue">왜 필요할까?</span></h1>
		<table>
			<tr>
				<th rowspan="2"><img src="<%=request.getContextPath()%>/resources/images/LANDING3.png"></th>
				<th id="two-table"><div class="two-text-spot">기업 대면 면접 방식과 <br>동일하게 구성된 서비스</div>
					<div class="two-text-text"><span class="tow-text-blue">비대면</span> 면접 서비스를 통해 <br>
					면접 대비 포함 개선사항을 점검하고 <br>
					나의 역량을 강조하여 합격으로<br>
					한걸음 더 나아갈 수 있습니다.</div>
				</th>
			</tr>
			
		</table>
    </li>
    <li id="landing-three">
    	<h1> <span class="three-bold">KHIS</span> 비대면 면접 솔루션 </h1>
		<table>
			<tr>
				<th><img src="<%=request.getContextPath()%>/resources/images/three1.png"></th>
				<th><img src="<%=request.getContextPath()%>/resources/images/three2.png"></th>
				<th><img src="<%=request.getContextPath()%>/resources/images/three3.png"></th>
			</tr>
			<tr>
				<th><div class="three-radius">지원자를 위한 솔루션</div></th>
				<th class="radisu-text"><div class="three-radius">면접관을 위한 솔루션</div></th>
				<th class="radisu-text"><div class="three-radius">관리자를 위한 솔루션</div></th>
			</tr>
			<tr>
				<th>별도의 설치없이 웹 브라우저를 통해 사용할 수 있습니다.<br>
					로그인만 하면 비대면 면접 준비가 끝납니다.</th>
				<th>1:1 면접부터 다대다 면접이 모두 가능합니다.<br>
					PT면접도 평가할 수 있으며, 별도의 설치가 필요 없습니다.</th>
				<th>면접 대상자와 면접관 설정 및 관리 페이지를 제공합니다.</th>
			</tr>
		</table>
    </li>
    <li id="landing-four">
    	<div class="four-text">
			<span>성</span>
			<span>공</span>
			<span>•</span>
			<span>성</span>
			<span>취</span>
			<span>•</span>
			<span>성</span>
			<span>장</span>
			<span>을</span>
			<span> </span>
			<span>위</span>
			<span>한</span>
			<br>
			<span>평</span>
			<span>가</span>
			<span>의</span>
			<span> </span>
			<span>본</span>
			<span>질</span>
			<span>을</span>
			<span> </span>
			<span>담</span>
			<span>은</span>
			<span> </span>
			<span>솔</span>
			<span>루</span>
			<span>션</span>
		</div>
		
		<!-- 이미지 요소들 -->
		<%-- <div>
			<img class="mini-imgs" id="mini1" src="<%=request.getContextPath()%>/resources/images/icon1.png" />
			<img class="mini-imgs" id="mini2" src="<%=request.getContextPath()%>/resources/images/icon2.png" />
			<img class="mini-imgs" id="mini3" src="<%=request.getContextPath()%>/resources/images/icon3.png" />
			<img class="mini-imgs" id="mini4" src="<%=request.getContextPath()%>/resources/images/icon4.png" />
			<img class="mini-imgs" id="mini5" src="<%=request.getContextPath()%>/resources/images/icon5.png" />
			<img class="mini-imgs" id="mini6" src="<%=request.getContextPath()%>/resources/images/icon6.png" />
			<img class="mini-imgs" id="mini7" src="<%=request.getContextPath()%>/resources/images/icon7.png" />
			<img class="mini-imgs" id="mini8" src="<%=request.getContextPath()%>/resources/images/icon8.png" />
			<img class="mini-imgs" id="mini9" src="<%=request.getContextPath()%>/resources/images/icon9.png" />
		</div> --%>
    </li>
    <li id="landing-five">
		<div class="five-txt1">
			<h3>세부 기능 사용하기 위한</h3>		
			<p>KHIS의 모든 기능을 사용하기 위해서는 로그인이 필요합니다.</p><br>
			<button class="w-btn-outline w-btn-blue-outline" type="button" >로그인 하기</button>
		</div>	
		<div class="five-txt2">
			<h3>회원이 아닌가요?</h3>		
			<p>KHIS는 회원인 경우에만 기능일 제공합니다. <br>
				회원가입 후 다양한 서비스를 이용해보세요.</p><br>
			<button class="w-btn-outline w-btn-blue-outline" type="button" >회원가입 하기</button>
		</div>
    </li>
    </ul>
    <p class="bullet">
      <label for="pos1">1</label>
      <label for="pos2">2</label>
      <label for="pos3">3</label>
      <label for="pos4">4</label>
      <label for="pos5">5</label>
      <label for="pos6">6</label>
    </p>
 

	<!-- 네비게이션 지정 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
</div>


<script>

new Swiper('.slide', {
	navigation : {
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>


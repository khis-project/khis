<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Interview_review_board/common.css" />

		<footer>
		<div style="width:1500px; height:120px; margin:20px auto;">
			<nav class="footer-nav">
				<a href="https://github.com/khis-project"><img src="https://i.ibb.co/GM8r1qz/Githublogo.png"/></a>
				<a href="https://www.youtube.com/channel/UCbCPq-eSe46T5hrHHAGpGug/featured"><img src="https://i.ibb.co/bgB4XsR/youtube-logo.png"/></a>
			</nav>
			<p>
				<span>상호: (주)KHIS | Email: contact@khis.com | 대표전화: 0000-0000</span><br/>
				<span>주소: 서울특별시 강남구 테헤란로14길 6 남도빌딩</span><br/>
				<span>©2022.KHIS Inc. All rights reserved. Since 2021</span><br/>
			</p>
		</div>
		<a href="#" id="tothetop"><img src="https://i.ibb.co/KK0H2Pz/free-icon-up-arrow-156924.png" alt=""></a>
		</footer>
<script>
	//top버튼 클릭시 상단으로 이동
	jQuery( '#tothetop' ).click( function() {
		var htmloffset = jQuery( 'html' ).offset();
		jQuery( 'html, body' ).animate( { scrollTop : htmloffset.top }, 1000 );
	});
</script>
</body>
</html>
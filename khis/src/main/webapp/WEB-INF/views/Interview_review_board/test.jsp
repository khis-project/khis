<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Interview_review_board/landing.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script> 
            AOS.init(); 
</script>
<section>
	<div class=maincontent>
		<div class="box1">
			<input type="radio" name="pos" class="pos" id="pos1" value = "1" checked onClick = "return(false);">
    		<input type="radio" name="pos" class="pos" id="pos2" value = "2" onClick = "return(false);">
    		<input type="radio" name="pos" class="pos" id="pos3" value = "3" onClick = "return(false);">
    		<input type="radio" name="pos" class="pos" id="pos4" value = "4" onClick = "return(false);">

		    <ul class="panel">
		      <li id="test2">
		    	<section class="container">
					<h1 class="title1">
						<span>비대면</span>
						<span>취업준비</span>
						<span>대비 사이트</span>
					</h1>
					
					<h2 class="title2">
						<span>비대면</span>
						<span>면접 서비스</span>
						<span style="font-size:70px;"> K H I S </span>
					</h2>
				</section>
		     </li>
		     <li id="landing-one">
		    	<h1> K H I S, <span class="one-text-blue">왜</span> 필요할까?</h1>
		    	<div style="display:flex; flex-direction:row; margin:0 auto; align-items: center; justify-content: center;">
					<div>
						<img src="https://i.ibb.co/P9ZMb6h/untact2-1.jpg">
					</div>
					<div class="one-text-spot">
							<strong><span style="font-size: 25px; font-weight: bold;"> : 취업에 한 걸음 더 가까워지는<br>
							<span style="background-color:#76b6ea; color: #fff; padding: 5px 3px;">비대면</span> 취업 준비 서비스</span></strong><br>
							<br>
							<span>
								기업 대면 면접 방식과 동일하게 구성된 서비스로,<br>
								비대면 면접을 통해 면접 대비 및 개선 사항을 점검하고<br>
								스스로의 역량을 향상시켜 합격으로 한걸음 더 나아갈 수 있습니다.
							</span>
					</div>
				</div>
		    </li>
		    <li id="landing-two">
		    	<div class="twobox">
					<table id ="landingtb" style="margin:0 auto;">
						<tr>
							<th><img src="<%=request.getContextPath()%>/resources/images/three1.png"></th>
							<th><img src="<%=request.getContextPath()%>/resources/images/three2.png"></th>
							<th><img src="<%=request.getContextPath()%>/resources/images/three3.png"></th>
						</tr>
						<tr>
							<th><div class="two-radius">For applicants</div></th>
							<th><div class="two-radius">For the interviewer</div></th>
							<th><div class="two-radius">For the manager</div></th>
						</tr>
						<tr>
							
							<th class="info">별도의 설치없이 웹 브라우저를 통해 사용할 수 있습니다.
								로그인만 하면 비대면 면접 준비가 끝납니다.</th>
							<th class="info">1:1 면접부터 다대다 면접이 모두 가능합니다.
								PT면접도 평가할 수 있으며, 별도의 설치가 필요 없습니다.</th>
							<th class="info">면접 대상자와 면접관 설정 및 관리 페이지를 제공합니다.<br>&nbsp;</th>
						</tr>
					</table>
				</div>
		    </li>
		    <li id="landing-three">
		    	<div class="three-text">
		    		<span><img src="https://i.ibb.co/T0JYj3r/excellence-1.png" style="width:55px; height:55px; transform: translateX(-10px);"/></span>
					<span>성</span>
					<span>공</span>
					<span>/</span>
					<span>성</span>
					<span>취</span>
					<span>/</span>
					<span>성</span>
					<span>장</span>
					<span>을</span>
					<span>&nbsp;</span>
					<span>위</span>
					<span>한</span>
					<br>
					<span>평</span>
					<span>가</span>
					<span>의</span>
					<span>&nbsp;</span>
					<span>본</span>
					<span>질</span>
					<span>을</span>
					<span>&nbsp;</span>
					<span>담</span>
					<span>은</span>
					<span>&nbsp;</span>
					<span>솔</span>
					<span>루</span>
					<span>션</span>
				</div>
		    </li>
		    </ul>
		    <p class="bullet">
		      <label class="radioLabel" for="pos1">1</label>
		      <label class="radioLabel" for="pos2">2</label>
		      <label class="radioLabel" for="pos3">3</label>
		      <label class="radioLabel" for="pos4">4</label>
		    </p>
		    <button class="slidebtn left-btn btn-hidden"><img src="https://i.ibb.co/KV94gQv/left-arrow.png"/></button>
		    <button class="slidebtn right-btn"><img src="https://i.ibb.co/wyfFjf1/right-arrow.png"/></button>
		</div>
		<div class="box2">
			<div class="wrap">
				<div class="bx_interview er" data-aos="fade-up" data-aos-delay="500"  data-aos-easing="linear" >
					<div class="bx_arrow blue" style="height: 370px; opacity:1; background: #4555fb; width:166px; color:#fff;">
						<span class="txt" style="opacity:1;">
							만족도<br>상승
						</span>
						<em class="name">면접관</em>
						<span class="line"></span>
						<img src="https://i.ibb.co/Dz89GTC/img-interviewer.png" alt="" class="person" style="opacity: 1;">
					</div>
				</div>
				<div class="bx_signal">
					<ul>
						<li class="real_time"><strong>실시간<br>면접</strong></li>
						<li class="security"><strong>쉬운<br>접근성</strong></li>
						<li class="evaluation"><strong>공정한<br>평가</strong></li>
					</ul>
				</div>
				<div class="bx_interview ee" data-aos="fade-down" data-aos-delay="500"  data-aos-easing="linear">
					<img src="https://i.ibb.co/yqxNZPd/img-interviewee.png" alt="" class="person" style="opacity: 1;">
						<div class="bx_arrow green" style="height:370px; opacity:1;">
							<span class="txt" style="opacity:1; text-align:center;">면접<br>부담감<br>해소</span>
						</div>
					<span class="line"></span>
					<em class="name">지원자</em>
				</div>
			</div>
		</div>
		<div class="box3">
			<h3 class="title"><span style="font-style:20px;">K H I S</span><br>
							  활용 방법 <img src="https://i.ibb.co/WGk46Cv/number-4.png" style="width:50px; transform:translateY(10px)"/></h3>
			<ul class="best_list">
				<li class="best01" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine" data-aos-duration="1000">
					<div class="no">
						<h1>1</h1>
						<span>
							면접 연습
						</span>
						<p>개발자 면접 및 기본 면접 연습을 통해<br>
						   개인 역량을 향상시킬 수 있습니다.</p>
					</div>
					<div class="img">
						<img src="https://i.ibb.co/wp5pG7z/interview-test.png"/>
					</div>
				</li>
				<li class="best02" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine" data-aos-duration="1000">
					<div class="img">
						<img src="https://i.ibb.co/PmgS88t/boardpage-1.png"/>
					</div>
					<div class="no">
						<h1>2</h1>
						<span>
							면접 후기 게시판
						</span>
						<p>면접 후기와 댓글을 통해<br>
						   정보를 제공받을 수 있습니다.</p>
					</div>
				</li>
				<li class="best03" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine" data-aos-duration="1000">
					<div class="no">
						<h1>3</h1>
						<span>
							실제 면접
						</span>
						<p>zoom 화면으로 연결되며,
						   1:1부터 다수 인원의 면접까지 모두 가능합니다.</p>
					</div>
					<div class="img">
						<img src="https://i.ibb.co/d08hYc4/meeting.png"/>
					</div>
				</li>
				<li class="best04" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine" data-aos-duration="1000">
					<div class="no">
						<h1>4</h1>
						<span>
							면접 평가
						</span>
						<p>면접자의 이력사항 확인 및 평가가 가능하며,<br>
						   보다 간편하게 면접을 진행할 수 있습니다.</p>
					</div>
					<div class="img">
						<img src="https://i.ibb.co/pZ6RmyS/evaluate.png"/>
					</div>
				</li>
			</ul>
		</div>
		<div class="box4">
			<h3> TEAM MEMBERS </h3>
			<hr style="width:10%; margin-top:25px;"/>
			<div class="wrap">
				<div class="subwrap">
					<figure class="snip1200">
  						<img src="https://i.ibb.co/kGTVx3Q/2492e6d03874045b2975bcd7f9f082d0.jpg"/>
  						<figcaption>
    						<p>- 비대면 면접<br>
    						   - 통계자료<br>
    						   - 면접 연습</p>
    						<div class="heading">
      							<h5><span>Jeonghyeon</span></h5>
    						</div>
  						</figcaption>
					</figure>
					<figure class="snip1200">
  						<img src="https://i.ibb.co/CmTXrWT/2.jpg"/>
  						<figcaption>
    						<p>- 면접평가/수정</p>
    						<div class="heading">
      							<h5><span>Jingi</span></h5>
    						</div>
  						</figcaption>
					</figure>
					<figure class="snip1200">
  						<img src="https://i.ibb.co/xS2J60g/1.jpg" />
  						<figcaption>
    						<p>- 면접관/면접자 정보 추가/수정<br>
    						   - 면접질문 추가/수정</p>
    						<div class="heading">
      							<h5><span>Chanwoo</span></h5>
    						</div>
  						</figcaption>
					</figure>
				</div>
				<div class="subwrap">
					<figure class="snip1200">
  						<img src="https://i.ibb.co/xS2J60g/1.jpg"/>
  						<figcaption>
    						<p>- 사이트 소개<br>
    						   - 합격여부 확인</p>
    						<div class="heading">
      							<h5><span>Soobin</span></h5>
    						</div>
  						</figcaption>
					</figure>
					<figure class="snip1200">
  						<img src="https://i.ibb.co/ZLnfjXx/3.jpg"/>
  						<figcaption>
    						<p>- 로그인/회원가입<br>
    						   - 마이페이지</p>
    						<div class="heading">
      							<h5><span>Chaea</span></h5>
    						</div>
  						</figcaption>
					</figure>
					<figure class="snip1200">
  						<img src="https://i.ibb.co/kGTVx3Q/2492e6d03874045b2975bcd7f9f082d0.jpg"/>
  						<figcaption>
    						<p>- 면접후기 게시판</p>
    						<div class="heading">
      							<h5><span>Seonyoung</span></h5>
    						</div>
  						</figcaption>
					</figure>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	var beforeSelect = null;
	
	$(document).ready(function(){
		var beforeSelect = null;
		var beforeSelectNm = null;
		var changeSelectNm = null;
		var selectRadioIdx = 0;
		var radioMargin = 0;
		
		$(".right-btn").on("click",function(){
			beforeSelect = $("input[name='pos']:checked").attr("id");
			beforeSelectNm = $("label[for='"+beforeSelect+"']").text();
			if(radioMargin == 0){
				radioMargin = $('.panel').css('margin-left'); 
				radioMargin = radioMargin.substring(0, radioMargin.indexOf('px'));
			}
			selectRadioIdx = $("input[name='pos']:checked").index();
	
			if(selectRadioIdx+1 < $("input[name='pos']").length){
				$("input[name='pos']:checked").prop('checked',false);
				$("input[name='pos']")[selectRadioIdx+1].checked = true;
				
				var marginPlus = Number(radioMargin) + 100;

				radioMargin = marginPlus;
				$(".panel").css("margin-left","-"+radioMargin+"%");
				$('.pos').change();
			}

		});
		
		$(".left-btn").on("click",function(){
			beforeSelect = $("input[name='pos']:checked").attr("id");
			beforeSelectNm = $("label[for='"+beforeSelect+"']").text();
			if(radioMargin == 0){
				radioMargin = $('.panel').css('margin-left'); 
				radioMargin = radioMargin.substring(0, radioMargin.indexOf('px'));
			}
			selectRadioIdx = $("input[name='pos']:checked").index();
	
			if(selectRadioIdx < $("input[name='pos']").length){
				$("input[name='pos']:checked").prop('checked',false);
				$("input[name='pos']")[selectRadioIdx-1].checked = true;
				
				var marginPlus = Number(radioMargin) - 100;

				radioMargin = marginPlus;
				$(".panel").css("margin-left","-"+radioMargin+"%");
				$('.pos').change();
			}

		});
		
		$('.pos').on("change",function(){
			if($('.pos')[0].checked == true){
				$('.right-btn').removeClass('btn-hidden');
				$('.left-btn').addClass('btn-hidden');
			}else if($('.pos')[3].checked == true){
				$('.right-btn').addClass('btn-hidden');
				$('.left-btn').removeClass('btn-hidden');
			}else{
				$('.right-btn').removeClass('btn-hidden');
				$('.left-btn').removeClass('btn-hidden');
			}
		});
		
	});
</script>
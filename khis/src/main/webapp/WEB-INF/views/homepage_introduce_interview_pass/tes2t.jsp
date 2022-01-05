<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/homepage_introduce_interview_pass/landing.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<!-- slide -->
<div id="wrapper">
	      <div id="slider-wrap">
	          <ul id="slider">
	             <li>
	                <div id="test2">
	                    	<h1 class="title">
								<span>비대면</span>
								<span>취업준비서비스</span>
								<span>입니다요</span>
							</h1>
							
							<h2 class="title">
								<span>비대면면접</span>
								<span>서비스</span>
								<span >K H I S</span>
							</h2>
	                </div>                
	             </li>
	             
	             <li>
	                <div id="landing-one">
	                    <div class="one-one">
							<p> 취업에 한 걸음 더 가까워지는 </p>
							<h2>비대면 취업 준비 서비스</h2>
							<h1> K H I S</h1>
						</div>
						<div class="one-two">
							<img src="<%=request.getContextPath()%>/resources/images/LANDING.png">
						</div>
	                </div>
	             </li>
	             
	             <li>
	                <div id="landing-two">
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
	                </div>
	             </li>
	             
	             <li>
	                <div id="landing-three">
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
	                </div>
	             </li>
	             
	             <li>
	                <div id="landing-four">
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
	                </div>
	             </li>
	             
	             
	          </ul>
	          
	           <!--controls-->
	          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
	          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
	          <div id="counter"></div>
	          
	          <div id="pagination-wrap">
	            <ul>
	            </ul>
	          </div>
	          <!--controls-->  
	                 
	      </div>
  
   </div>
   
<script>

//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
  
  
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
  );
  
  

});//DOCUMENT READY
  


/***********
 SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}



  
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}

</script>

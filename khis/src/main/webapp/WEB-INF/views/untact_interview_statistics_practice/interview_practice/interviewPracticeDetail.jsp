<%@page import="com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://voice.luzspat.com/js/cloudvoice.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="면접 연습 진행" name="title"/>
</jsp:include>
<fmt:requestEncoding value="utf-8"/>
<div class="text-align-center margin-top-basic" style="height: 600px;">
	
	<!-- 1. 음성이 잘 들리는지 체크 -->
	<!-- 잘 들리면 버튼 클릭 -->
	
	<!-- 면접 연습 시작을 누르면 해당 면접에 대한 안내문 출력 -->
	<!-- 면접 질문은 총 3가지 -->
	<!-- 면접 질문에 대한 답변은 키워드가 얼만큼 포함되어있는지를 체크 -->
	<!-- 3초 뒤 면접질문 음성으로 보이기 -->
	<h2 id = "startMessage">잠시만 기다려주세요.<br>곧 질문이 출력됩니다.</h2>
	
	<!-- 면접 질문 답변 저장-->
    <div class="words displayNone"></div>
	<form name = "inputForm" id = "inputForm">
	  <input type="text" class="txt displayNone" id = "textMessage" value="${selectPracticeRandom.question}">
	    <div class="text-align-center displayNone">
		    <label for="rate">질문 속도</label> : <input type="range" min="0.5" max="2" value="${rate}" step="0.1" id="rate">
		  	<select class="displayNone"></select>
		</div>
	</form>
	  
	<div id = "divQuestion"><label id="Quesion1" class="QA">${selectPracticeRandom.question}</label></div>
	<div id = "divTimer" class="display-none QA margin-top-basic"><label id ="Timer1">시간 00:</label><label id ="Timer2"></label></div>

	<form 
		name = "DevForm" 
		action = "${pageContext.request.contextPath}/interviewPractice/interviewPracticeQuestion.do"
		method = "POST">
		<!-- 해당 부분에 면접 질문 했던 부분이 있다면 담아와서 form 보낼때 보낼지 말지 정하기 -->
		<c:if test="${not empty Questions}">
			<input name="Questions" value = "${Questions}" class="display-none">
		</c:if>
		<input type="text" name = "kind" value="${selectPracticeRandom.question_kind}" class="display-none">
		<input type="text" name = "rate" value="${rate}" class="display-none">
		<input type="submit" id = "practicestartDevBtn" class = "text-align-center button-basic button-hover margin-top-basic display-none practicestartBtn interviewBtn-basic" value="더하기">
		<!-- <input type="button" id = "practicestartDevBtn" class = "text-align-center button-basic button-hover margin-top-basic display-none" value="다시하기"> -->
		<input type="button" id = "practicestartMenuBtn" class = "text-align-center button-basic button-hover margin-top-basic display-none practicestartBtn interviewBtn-basic" value="뒤로가기" onclick="location='${pageContext.request.contextPath}/interviewPractice/interviewPractice.do';">
		
		<!-- 기본 면접 부분일때는 설명/ 키워드 없애고 답변으로 적어서 출력되게 하기. -->
	</form>
</div>
	<script>
		// 면접 질문이 음성으로 나오고 끝나면 
		// 바로 카운트다운 시작, 사용자가 말을 하면 해당 부분 저장 ( 음성 -> 텍스트 )
		// 카운트 다운이 끝나면 사용자가 말하는 부분 저장 멈추기
		// 해당 면접 질문의 답에 대한 키워드가 다 포함되어 있다면 답변 성공, 아니라면 답변 실패
		// 해당 부분의 키워드 수에 따라 퍼센트 매기기 ?? XX
				
		//
		$(() => {
			startFunc();
				
		});
			
		function startFunc(){
			$("#startMessage").css("display", "block");
			setTimeout(function() {
				// 면접 질문을 list에서 랜덤으로 골라 #textMessage 값에 넣기
				// random 값을 어떻게 처리할지 고민해야된다.★★★
				// 해당 부분은 controller에 현재 면접 연습을 했던 질문들을 제외한 질문 리스트를 가져와 random 돌림
				$("#startMessage").css("display", "none");
				if($("[name=kind]").val() == 'D'){
					$("#divQuestion").after(`<div style="margin:auto; text-align : center;"><table id = "Answer" class="display-none margin-auto-basic table-width-auto"><tr><th style="width:70px;">설명</th><td><lable class="divQuestionAK">`+`${selectPracticeRandom.answer}`+`</label></td></tr><tr><th>키워드</th><td><label class="divQuestionAK" id = "divQuestionK">`+`${selectPracticeRandom.answer_keyword}`+`</label><td/></tr></table></div>`);
					$(".divQuestionAK").css("display","none");
				}
				$("#divQuestion").css('display','block');
				$("[name=inputForm]").submit();
				}, 3000);
		}
		
		var synth = window.speechSynthesis;
	
		var inputForm = document.querySelector('form');
		var inputTxt = document.getElementById('textMessage'); // 텍스트 
		var voiceSelect = document.querySelector('select');
	
		function populateVoiceList() {
		  voices = synth.getVoices();
	
		  for(i = 0; i < voices.length ; i++) {
		    var option = document.createElement('option');
		    option.textContent = voices[i].name + ' (' + voices[i].lang + ')';
	
		    if(voices[i].default) {
		      	option.textContent += ' -- DEFAULT';
			    option.setAttribute('data-lang', voices[i].lang);
			    option.setAttribute('data-name', voices[i].name);
			    voiceSelect.appendChild(option);
			    break;
		    }
		  }
		  
		}
		
		//음성 테스트 부분 클릭했을때
		inputForm.onsubmit = function(event) {

			populateVoiceList();
			if (speechSynthesis.onvoiceschanged !== undefined) {
			  speechSynthesis.onvoiceschanged = populateVoiceList;
			}
			
			event.preventDefault();
			
			var utterThis = new SpeechSynthesisUtterance(inputTxt.value);
			var selectedOption = voiceSelect.selectedOptions[0].getAttribute('data-name');
			for(i = 0; i < voices.length ; i++) {
				if(voices[i].name === selectedOption) {
			      utterThis.voice = voices[i];
			    }
			}
			utterThis.pitch = 1;
			utterThis.rate = rate.value;
			synth.speak(utterThis);
			if($("#Quesion1").text() != ""){// 질문에 값이 없을 때, 즉 음성속도 테스트 했을시 실행			
				var play1 = setInterval(function() {// 음성 인식 false일때까지 계속 돌리기
					if(synth.speaking == false){
						clearInterval(play1);
						$("#Quesion1").css("color","black");
						$("#divTimer").css('display','block');
						$("#Timer2").text("60");
						SeechR(); //음성 인식 start
					}
					/* else{
						$("#Quesion1").css("color","#ffc107");
					} */
				}, 1000); 
			}
		}
		
		
		//음성 인식 speech -> text
		function SeechR(){
			window.SpeechRecognition =
				  window.SpeechRecognition || window.webkitSpeechRecognition;
			
				// 인스턴스 생성
				const recognition = new SpeechRecognition();
			
				// true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
				recognition.interimResults = true;
				
				// 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
				recognition.lang = "ko-KR";
				
				// true면 음성 인식이 안 끝나고 계속 됩니다.
				recognition.continuous = true;
				
				// 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.
				// maxAlternatives가 크면 이상한 단어도 문장에 적합하게 알아서 수정합니다.
				recognition.maxAlternatives = 15000;
			
				//해당 p 태그를 만들고 클래스이름을 para로 추가
				let p = document.createElement("p");
				p.classList.add("para");
			
				let words = document.querySelector(".words");
				words.appendChild(p);
			
				let speechToText = "";
				recognition.addEventListener("result", (e) => {
				  let interimTranscript = "";
				  for (let i = e.resultIndex, len = e.results.length; i < len; i++) {
				    let transcript = e.results[i][0].transcript;

				    if (e.results[i].isFinal) {
				      speechToText += transcript;
				    } else {
				      interimTranscript += transcript;
				    }
				  }
				  document.querySelector(".para").innerHTML = speechToText + interimTranscript;
				});
			
				// 음성인식이 끝나면 자동으로 재시작합니다.
				// recognition.addEventListener("end", recognition.start);
			
				// 음성 인식 시작
				recognition.start();
				
				//
				var colorRGB = 15; // 255까지 가야됨 60초 8초씩 더하기
	 			var play2 = setInterval(function() {
	 				if($("#Timer2").text() != "0"){	 
	 					colorRGB += 4;
	 					$("#Timer2").text($("#Timer2").text() - 1);
	 					$("#Timer2").css("color","rgb("+colorRGB+", 0, 0)")
	 				}
	 				else{
	 					//음성인식 멈추기
	 					recognition.stop();
	 					
	 					//해당부분은 DevQuestion의 면접 연습을 적용시켰을 경우 실행
	 					if($("[name=kind]").val() == 'D'){
	 				
		 					var divQuestionK = ("${selectPracticeRandom.answer_keyword}").split(',');
							var para = $(".para").text();
		 					var Quesions = "";
		 					for(var a = 0; a < divQuestionK.length ; a++){	 		
		 						var indexofs = para.indexOf(divQuestionK[a]);
		 						
		 						if(indexofs >= 0)
		 							Quesions += divQuestionK[a] + (a != divQuestionK.length -1 ? ", " : "");
		 						else
		 							Quesions += "<label style='color:red'>"+divQuestionK[a] + "</label>" + (a !=divQuestionK.length -1 ? ", " : "");
		 					}
		 					$("#divQuestionK").html(Quesions);
		 				}else{
		 					$("#divQuestion").after(`<div style="margin:auto; text-align : center; margin-top: 40px;"><table class="margin-auto-basic table-width-auto"><tr><th style="width:70px;">답변</th><td>`+$(".para").text()+`</td></tr></table></div>`)
		 				}
	 					
	 					$("#Answer").css('display','block');
	 					//$(".divQuestionAK").css("display","none");
	 					$(".divQuestionAK").css('display','block');
	 					$("#divTimer").css('display','none'); 
	 					$(".practicestartBtn").css('display','inline'); 
	 					clearInterval(play2);
	 				}
				}, 1000); 
		}
		
	</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
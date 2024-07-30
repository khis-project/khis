<%@page import="java.util.Random"%>
<%@page import="com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewPractice"%>
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
<%
	List<InterviewPractice> interviewQuestion = new ArrayList<>();
			//해당 면접 질문 참고 : https://cafe.naver.com/soojebi?iframe_url_utf8=%2FArticleRead.nhn%253Fclubid%3D29835300%2526page%3D1%2526inCafeSearch%3Dtrue%2526searchBy%3D0%2526query%3Dmvc%2526includeAll%3D%2526exclude%3D%2526include%3D%2526exact%3D%2526searchdate%3Dall%2526media%3D0%2526sortBy%3Ddate%2526articleid%3D92591%2526referrerAllArticles%3Dtrue

	interviewQuestion.add(new InterviewPractice("JAVA 언어의 장점을 세가지만 설명해주세요.",Arrays.asList("독립적","객체지향","메모리 관리","오픈소스","멀티스레드","동적 로딩"),"운영체제에 독립적이다.<br>객체지향 언어이다.<br> 자동으로 메모리관리를 해준다.<br>오픈소스JDK이다.<br>멀티스레드를 수베게 구현할 수 있다.<br>동적로딩을 지원한다."));
	interviewQuestion.add(new InterviewPractice("OOP의 네가지 특징은 무엇인가요?",Arrays.asList("추상화","캡슐화","일반화 관계","다형성"),"추상화 : 구체적인 사물들의 공통적인 특징을 파악해서 이를 하나의 개념(집합)으로 다루는 것<br>캡슐화 : 정보 은닉(information hiding): 필요가 없는 정보는 외부에서 접근하지 못하도록 제한하는 것이다.<br>일반화 관계 : 여러 개체들이 가진 공통된 특성을 부각시켜 하나의 개념이나 법칙으로 성립시키는 과정이다.<br>다형성 : 서로 다른 클래스의 객체가 같은 메시지를 받았을 때 각자의 방식으로 동작하는 능력이다."));
	interviewQuestion.add(new InterviewPractice("final 키워드에 대해서 설명해주세요.",Arrays.asList("변경 불가능"),"변수나 메서드 또는 클래스가 변경 불가능 하도록 만든다."));
	interviewQuestion.add(new InterviewPractice("오버로딩에 대해서 설명해주세요.", Arrays.asList("같은 이름","자료형","인자의 수"),"두 메서드가 같은 이름을 갖고 있으나 인자의 수나 자료형이 다른 경우를 뜻한다."));
	interviewQuestion.add(new InterviewPractice("MVC패턴에 대해서 설명해 주세요.", Arrays.asList("모델","뷰","컨틀로러","영향없이"),"모델, 뷰, 컨트롤러로 구성되어 비즈니스 로직을 서로 영향없이 쉽게 고칠 수 있는 패턴이다."));
	interviewQuestion.add(new InterviewPractice("mybatis에 대해서 설명해 주세요.",Arrays.asList("관계형","데이터베이스", "쉽게","도와주는"),"자바의 관계형 데이터베이스 프로그래밍을 조금 더 쉽게할 수 있도록 도와주는 프레임워크이다."));
	interviewQuestion.add(new InterviewPractice("JDBC란 무엇인가요",Arrays.asList("자바에서","데이터베이스","연결","응용프로그램"),"자바에서 데이터베이스를 사용할 수 있도록 연결해주는 응용프로그램 인터페이스이다."));
	interviewQuestion.add(new InterviewPractice("AJAX란 무엇인가요?",Arrays.asList("비동기 통신","XML","자바스크립트","서버와 클라이언트"),"자바스크립트를 사용한 비동기 통신 기술로, 서버와 클라이언트 간 XML 데이터를 주고받는 기술이다."));

	request.setAttribute("interviewQuestion", interviewQuestion);
	
%>
<style>
#divQuesion, .divQuesionAK{
	display : none;
}
#divTimer{
	position : fixed;
}
.display-none{
	display : none;
}
.QA{
	font-size: 40px;
}

.button-basic{
	color : white;
	height: 30px;
	border-radius: 5px;
	border: 0px;
}
.button-hover{
	background: black;
	color : white;
}
.button-hover:hover{
	background : #0075ff;
	color : white;
}
.margin-top-basic{
	margin-top : 50px;
}
#practicestartDevBtn, #practicestartBasicBtn{
	width : 200px;
}
</style>
<fmt:requestEncoding value="utf-8"/>

	<!-- 1. 음성이 잘 들리는지 체크 -->
	<!-- 잘 들리면 버튼 클릭 -->
	
	<!-- 면접 연습 시작을 누르면 해당 면접에 대한 안내문 출력 -->
	<!-- 면접 질문은 총 3가지 -->
	<!-- 면접 질문에 대한 답변은 키워드가 얼만큼 포함되어있는지를 체크 -->
	<!-- 3초 뒤 면접질문 음성으로 보이기 -->

	
	<!-- 면접 질문 답변 저장-->
    <div class="words displayNone"></div>
	<form name = "inputForm" id = "inputForm">
		<div class="text-line-height text-align-center" id = "practiceNotice">
			<h1>안내문</h1><br>
			해당 부분은 개발자 면접과 기본 면접 테스트 입니다.<br>
			먼저 해당 음성이 잘 들리는지 확인해주시고, 들리지 않는다면 소리 설정을 해주세요.<br>
			음성이 잘 들린다면 원하는 면접 질문 속도를 선택한 뒤, 면접 연습 시작 버튼을 클릭해주세요.<br>
			면접 연습 버튼을 클릭하면 3초 뒤, 면접 질문이 등장합니다.<br>
			<b>면접 질문이 끝나자마자 카운트 다운이 시작되며 1분 안에 답변해야됩니다.</b><br>
			해당 음성 인식은 발음이 명확하지 않으면 답변이 제대로 전달되지 않습니다.<br>
			해당 테스트가 실전 면접에 큰 도움이 되길바랍니다. <br>
			감사합니다. <br>
	
		</div>
	  <input type="text" class="txt displayNone" id = "textMessage" value="음성 속도 테스트입니다.">
	  <div class="text-align-center ">
	    <label for="rate">질문 속도</label> : <input type="range" min="0.5" max="2" value="1" step="0.1" id="rate">
	  	<select class="displayNone"></select>
	  	<input type="submit" value="음성테스트" class="button-basic button-hover margin-top-basic" ><br>
		<input type="button" id = "practicestartDevBtn" class = "text-align-center button-basic button-hover margin-top-basic" value="개발자 면접 연습">
		<input type="button" id = "practicestartBasicBtn" class = "text-align-center button-basic button-hover margin-top-basic" value="기본 면접 연습">
	  </div>
	</form>
	<div id = "divQuesion"><label id="Quesion1" class="QA"></label><label id="Quesion2"><img src="${pageContext.request.contextPath }/resources/images/untact_interview_statistics_practice/musicsound.png" width="30px" id = "QuesionImg"></label></div>
	<div id = "divTimer" class="display-none QA"><label id ="Timer1">시간 00:</label><label id ="Timer2"></label></div>
	<script>
		// 면접 질문이 음성으로 나오고 끝나면 
		// 바로 카운트다운 시작, 사용자가 말을 하면 해당 부분 저장 ( 음성 -> 텍스트 )
		// 카운트 다운이 끝나면 사용자가 말하는 부분 저장 멈추기
		// 해당 면접 질문의 답에 대한 키워드가 다 포함되어 있다면 답변 성공, 아니라면 답변 실패
		// 해당 부분의 키워드 수에 따라 퍼센트 매기기 -> ex) 키워드가 5개인데 1개만 성공하면 20% 성공 ... 

		
		
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
						$("#QuesionImg").css("color","black");
						clearInterval(play1);
						$("#divTimer").css('display','block');
						$("#Timer2").text("5");
						SeechR(); //음성 인식 start
					}
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
				//recognition.stop(); // 음성 인식 종료
	 			var play2 = setInterval(function() {
	 				if($("#Timer2").text() != "0")
	 					$("#Timer2").text($("#Timer2").text() - 1);
	 				else{
	 					recognition.stop();
	 					var divQuesionK = $("#divQuesionK").text().split(',');
	 					var para = $(".para").text();
	 					var Quesions = "";
	 					
	 					for(var a = 0; a < divQuesionK.length ; a++){	 		
	 						var indexofs = para.indexOf(divQuesionK[a]);

							if(indexofs >= 0)
	 							Quesions += divQuesionK[a] + (a != divQuesionK.length -1 ? ", " : "");
	 						else
	 							Quesions += "<label style='color:red'>"+divQuesionK[a] + "</label>" + (a !=divQuesionK.length -1 ? ", " : "");
	 					}
	 					$("#divQuesionK").html(Quesions);
	 					$("#Answer").css('display','block');
	 					$("#divTimer").css('display','none'); 
	 					clearInterval(play2);
	 				}
				}, 1000); 
		}
		
		$("#practicestartDevBtn").on("click",function(){
			$("[name=inputForm]").css("display","none");
			<%
				int randomss = (int)(Math.random() * interviewQuestion.size()-1);
				request.setAttribute("randomss", randomss);
			%>
			var Questions = `${interviewQuestion.get(randomss)}`;
			var QuestionQ = `${interviewQuestion.get(randomss).interviewQ}`;
			var QuestionA = `${interviewQuestion.get(randomss).interviewA}`;
			var QuestionK = `${String.join(",",interviewQuestion.get(randomss).interviewK)}`;

			// 3초 뒤에 실행
 			
			//면접 질문을 list에서 랜덤으로 골라 #textMessage 값에 넣기
			$("#textMessage").val(QuestionQ);
			$("#Quesion1").text(QuestionQ);
			
			
			// random 값을 어떻게 처리할지 고민해야된다.★★★
			$("#divQuesion").after(`<table id = "Answer" class="display-none"><tr><th style="width:50px;">설명</th><td><lable class=".divQuesionAK">`+QuestionA+`</label></td></tr><tr><th>키워드</th><td><label class=".divQuesionAK" id = "divQuesionK">`+QuestionK+`</label><td/></tr></table>`)
			$(".divQuesionAK").css("display","none");
			$("#divQuesion").css('display','block');
			$("[name=inputForm]").submit();
		})
	</script>
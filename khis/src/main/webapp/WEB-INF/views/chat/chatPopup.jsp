<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>${loginMember.id} To 관리자</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- sock.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 : babel-standalone babel-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/interview_management/main.css" />

<style>
#chatForm{
	display: flex;
    flex-direction: column;
    font-family:'GmarketSansMedium';
    background:aliceblue;
}

p{
	font-size: 15px;
	margin-bottom:0;
}
span{
	font-size: 12px;
}


.message{
	padding:5px;
	height:40px;
}

.messageLabel{
    width: 200px;
    border-radius: 20px;
    height: auto;
    padding: 5px;
    background-color:white;
}


</style>
<body class="m-2" id="chatForm">
	<div id="data">
			<c:forEach items="${list}" var="chatLog"> 
			<div class = "mt-2 mb-2 messageFrm" <c:if test ="${loginMember.id eq chatLog.memberId}"> style = "text-align:right;" </c:if>>
				<p>${chatLog.memberId} <span>님</span></p>
				<div class="message"><label class = "messageLabel" <c:if test ="${loginMember.id eq chatLog.memberId}"> style = "background-color:lightyellow" </c:if>>${chatLog.msg }</label></div>
			</div>
			</c:forEach>
	</div>
	<div class="input-group mb-2 mt-3 sendForm">
	  <input type="text" id="message" class="form-control" >
	  <div class="input-group-append" style="padding: 0px;">
	    <button id="sendBtn" class="btn btn-secondary" type="button">전송</button>
	  </div>
	</div>
<script>

$(message).focus();
// /chat/chat_mk0L0UJ93P50409 구독
// 1. Stomp Client객체 생성(websocket)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
const stompClient = Stomp.over(ws);

// 2. 연결 요청
stompClient.connect({}, (frame) => {
	console.log("Stomp Client Connect : ", frame);
	
	// 3.구독요청
	stompClient.subscribe("/chat/${chatId}", (message) => {
		console.log("message : ", message);
		const {memberId, msg} = JSON.parse(message.body);
		console.log(memberId);
		console.log("${loginMember.id}");
		const loginMember = "${loginMember.id}";
			console.log(loginMember == memberId);
			console.log(loginMember == memberId ? `style = "text-align:right;">` : `>`);
			$(data).append(`<div class = "mt-2 mb-2 messageFrm"  `+(loginMember == memberId ? `style = "text-align:right;">` : `>`) +
			(`<p style ="margin-bottom: 0;"> \${memberId} <span>님</span></p>`) +
			(`<div class="message"><label class = "messageLabel" `+(loginMember == memberId ? `style = "background-color:lightyellow;">` : `>`) + `\${msg }</label></div>`) + 
			(`</div>`));
			
			$('#chatForm').scrollTop($('#chatForm')[0].scrollHeight);
	});
	
});

$(sendBtn).click((e) => {
	const obj = {
		chatId : "${chatId}",
		memberId : "${loginMember.id}",
		msg : $(message).val(),
		logTime : Date.now(),
		type: "MESSAGE"
	};
	console.log(obj);
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	$(message).val('').focus(); // #message 초기화
	
});

$(message).keyup((e) => {
	if(e.keyCode == 13){
		$(sendBtn).trigger('click'); // click 핸들러 호출!
	}
});


</script>

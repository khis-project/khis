<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/homepage_introduce_interview_pass/common.css" />

	<style>
	table.table th, table.table td {text-align: center;}
	#chatList{
		width:500px;
		height:440px;
		font-family: 'GmarketSansMedium';
	}
	h3 {
		padding:10px;
		text-align:center;
	}	
	</style>
	<div id="chatList">
	<h3>문의 목록</h3>
	<table class="table" style="table-layout: fixed;">
	  <thead>
	    <tr>
	      <th scope="col" style="width:20%;" >발신자</th>
	      <th scope="col" style="width:70%;">메세지</th>
	      <th scope="col" style="width:10%;"></th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${list}" var="chatLog">
		  	<tr id="${chatLog.chatId}" data-chat-id="${chatLog.chatId}" data-member-id="${chatLog.memberId}">
		  		<td>${chatLog.memberId}</td>
		  		<td class="msg">${chatLog.msg}</td>
		  		<td>
		  			<span class="unread-count badge badge-danger ${chatLog.unreadCount eq 0 ? 'd-none' : ''}">${chatLog.unreadCount}</span>
		  		</td>
		  	</tr>
	  	</c:forEach>
	  </tbody>
	</table>
	</div>
	${pagebar}
	<script>
	// websocket 연결(SockJS)
	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	// StompClient객체 생성
	const stompClient = Stomp.over(ws);
	// connect
	stompClient.connect({}, (frame) => {
		// 구독신청 및 핸들러 등록
		stompClient.subscribe("/chat/admin", (message) => {
			
			// type속성으로  MESSAGE(chatLog), LAST_CHECK을 구분한다.
			const obj = JSON.parse(message.body);

			const {chatId, memberId, msg, type} = obj;
			
			const $tr = $(`#\${chatId}`);
			const $unreadCountSpan = $tr.find("span.unread-count");
			
			switch(type){
			case "LAST_CHECK" : 
				$unreadCountSpan.text(0).addClass("d-none");
				break;
			case "MESSAGE" : 
				const $msgTd = $tr.children(".msg");
				$msgTd.text(msg); // td.msg 갱신
				// 1.관리자메세지 : 처리없음
				// 2.사용자메세지 : 안읽음메세지 +1 
				if(memberId != 'admin'){
					const unreadCountVal = Number($unreadCountSpan.text()) + 1;
					$unreadCountSpan.text(unreadCountVal).removeClass("d-none");
				}
				
				$tr.prependTo($("#chatList tbody")); // 첫번째 자식요소로 추가(이동)
				
				break;
			}
			
			
		});	
	});
	
	
	$("tr[id]").click((e) => {
		const $tr = $(e.target).parent("tr");
		const chatId = $tr.attr("id");
		const memberId = $tr.data("memberId"); // getter camelcasing으로 참조하기
		
		
		// 팝업요청
		const url = `${pageContext.request.contextPath}/admin/\${chatId}/\${memberId}/chat.do`;
		const name = chatId; // 팝업창 Window객체의 name.
		const spec = "width=500px, height=500px";
		open(url, name, spec);
	});
	
	
	</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<c:if test="${not empty msg}">
<script>
  alert("${msg}");
  console.log("${msg}");
  <%session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>
<meta charset="UTF-8">
<title>면접 일정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login_join_mypage/schedule.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- fullcalendar -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script
  src='${pageContext.request.contextPath}/resources/js/login_join_mypage/schedule.js'></script>

</head>
<body>
	<h1>[ 면접 일정 ]</h1>
	<div class="button" align="right">
		<input type="button" value="돌아가기" class="returnBtn" id="returnBtn" onClick="returnBtn()" />
	</div>
	<div id="schedule"   style="height: 601px;">
		<!-- calendar 태그 -->
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div>

	</div>
</body>
<script type="text/javascript">
$(function(){
	$.get(`${pageContext.request.contextPath}/member/scheduleList.do`, function(data){
		console.log(data);
    initCalendar(data);
	})
})

function returnBtn(){
	  if('${loginMember.kind}' == "IR_SUPERVISOR"){
		  location.href = "${pageContext.request.contextPath}/member/irSMyPage.do/";
	  }
	  else if('${loginMember.kind}' == "IR"){
	      location.href = "${pageContext.request.contextPath}/member/irMyPage.do/";
	    }
	  else if('${loginMember.kind}' == "USER"){
	        location.href = "${pageContext.request.contextPath}/member/userMyPage.do/";
	      }
	  else if('${loginMember.kind}' == "IR_HAED"){
	        location.href = "${pageContext.request.contextPath}/member/irHMyPage.do/";
	      }
	  else if('${loginMember.kind}' == "ADMIN"){
          location.href = "${pageContext.request.contextPath}/member/adminMyPage.do/";
        }
}
</script>
</html>

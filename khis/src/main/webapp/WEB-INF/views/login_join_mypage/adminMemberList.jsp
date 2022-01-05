<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:if test="${not empty msg}">
<script>
  alert("${msg}");
  console.log("${msg}");
  <%session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>
<html>
<head>
<title>회원관리 리스트</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login_join_mypage/memberList.css" />
</head>
<body>
<% int index = 0; %>
	<div id="memberList" class="memberList">
		<h1>회원관리 리스트</h1>
		  <div class="returnBtn" align="right">
        <input type="button" value="돌아가기" class="returnBtn" onClick="returnBtn()" />
      </div>
		<div class="container">
			<table class="memberList">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>가입자 유형</th>
					<th>회원관리</th>
				</tr>

				<c:if test="${!empty userList}">

					<c:forEach items="${userList}" var="user" varStatus="status" begin="${index}"  end="${index + 9 }">
						<tr style="text-align: left;">
							<td>${user.id}</td>
							<td>${user.name}</td>
							<td>${user.kind}</td>
							<td width="3em" class="button"><input type="button" class="modify"
								onClick="getThisUserUpdateform('${user.id}');" value="수정">
						    <input type="button" class="delete"
								onClick="deleteUser('${user.id}');" value="삭제"></td>

						</tr>
             
					</c:forEach>
				</c:if>
			</table>
			<%-- <c:out value="${pageBar}" escapeXml="false"/> --%>
		</div>
		<div style="text-align: center;" class=pagebar>
		  <c:forEach var="bottomIndex" begin="0" end="${memberCount/10 }">
		  <input type="button" onClick="page(${bottomIndex+1});" value="${bottomIndex+1 }" style="width: 25px;">
		  <%-- <a href="memberList.do?page=${bottomIndex+1}" style=""color:white;">${ bottomIndex + 1 }</a> --%>
 </c:forEach>
		</div>
	</div>

</body>
<script>
function getThisUserUpdateform(userId){
	alert(userId+"회원님의 정보를 수정합니다.");
	location.href = "${pageContext.request.contextPath}/admin/updateThisUser.do/" + userId;
	
}

function deleteUser(userId){
	if(confirm('삭제 하시겠습니까?')){
		location.href = "${pageContext.request.contextPath}/admin/deleteThisUser.do/"+userId;
		alert("삭제가 완료되었습니다.");
	}
}

function page(bottomIndex){
	location.href = "adminMemberList.do?page=" + bottomIndex;
}

function returnBtn(){
	location.href = "${pageContext.request.contextPath}/member/adminMyPage.do/"
}

</script>
</html>
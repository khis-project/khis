<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="합격 여부 확인" name="title"/>
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<fmt:requestEncoding value="utf-8"/>
<style>
h2 {
	text-align: center;
}
#welcome-name {
	opacity: 0;
}
#applylist th {
	text-align: center;
}
#showlist {
	border: 0px;
	background-color: white;
}
#applylist {
	opacity: 0;
}
.tooltip {
    max-width:140px;
}
.checkedresults{ 
   margin-left : 170px;
   margin-top : -30px;
   position: fixed; 
   display: none;
   font-weight : bold; 
   padding: 5px; 
   background: black;
   color:white;
   }

.checkedresults:after {
   right: 100%;
    top: 15px;
   border: solid transparent;
   content: "";
   height: 0;
   width: 0;
   position: absolute;
   pointer-events: none;
   border-color: rgba(234, 212, 126, 0);
   border-right-color: black;
   border-width: 7px;
   margin-top: -10px;
}
#welcome-comment {
	opacity: 0;
}
#applylist td {
	text-align: center;
}
</style>
<body>
<section id="check" style="margin : auto; text-align : center; height: 900px;">
	<h2>면접 결과 확인</h2>
	<div id="welcome">
		<p id="welcome-name">${name}님 반갑습니다.</p>
		<p id="welcome-comment">지금 바로 면접 결과를 확인하세요! <input type="button" id="showlist" value="지원목록보기" /></p> 
		<hr />
		<input type="hidden" id="co_code_hidden" value=""/>
	</div>
	<div id="apply">
		<table id="applylist" style="margin:auto;">
			<thead>
				<tr>
					<th id="list_no" width="60px;">번호</th>
					<th id="co_name" width="150px;">회사명</th>
					<th id="posting" width="300px;">공고유형</th>
					<th id="dates" width="170px;">면접일</th>
					<th id="passnonpass" width="130px;">최종 합격 여부</th>
					<th width="150px;"></th>
				</tr>
				<tr>
					<c:forEach items="${list}" var="item" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${item.co_name}</td>
							<td>${item.job_posting_name}</td>
							<td><fmt:formatDate value="${item.interview_time}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${item.final_pass_check == 'y'}">
									합격
								</c:if>
								<c:if test="${item.final_pass_check == 'n'}">
									불합격
								</c:if>
								<c:if test="${item.final_pass_check == '평가중'}">
									평가중
								</c:if>
							</td>
							<td style="text-align: center;" width="200px;" class="checkedresults_I">
								<c:if test="${item.final_pass_check != 'null'}">
									<form action="${pageContext.request.contextPath}/info/checkDetail.do" name="detailFrm" method="POST" style="margin: auto;">
										<input type="hidden" name="passcheck" value="${item.final_pass_check}"/>		
										<input type="submit" class="checkedresults_II" value="상세 결과 확인" ${premium eq 'n'? '': 'disabled'}/><!-- 프리미엄 회원만 이용 -->
									</form>
									<span class="checkedresults">프리미엄 회원만 이용가능합니다.</span>
								</c:if>
								<c:if test="${item.final_pass_check == 'null'}">
									
								</c:if>
							</td>
						</tr>
					
					</c:forEach>
					
				</tr>
			</thead>
		</table>
	</div>
	<br />	
</section>
</body>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	$("#welcome-name").animate({
		"opacity":"1"
	}, 1000);
	$("#welcome-comment").animate({
		"opacity":"1",
	}, 2000);
});
$("#showlist").click((e) => {
	$("#applylist").animate({
		"opacity":"1"
	}, 1000);
	$("#showlist").css({
		"color":"skyblue"
	});
});
$(".checkedresults_I").click((e) => {
	detailFrm.submit();
});
$(document).on("mouseover", ".checkedresults_I", function(){
	$(".checkedresults").css({
		"display":"block"
	});
});
$(document).on("mouseout", ".checkedresults_I", function(){
	$(".checkedresults").css({
		"display":"none"
	});
});
</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
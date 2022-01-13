<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="합격 여부 확인" name="title"/>
</jsp:include>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<fmt:requestEncoding value="utf-8"/>
<style>
h2 {
	margin-top: 50px;
	text-align: center;
}

#detailtable th, td {
	border: 1px solid black;
	text-align: center;
}
#detaildiv {
	width: 100%;
	margin: auto;
	text-align: center;
}
#detailtable {
	width: 70%;
	margin: auto;
}
#goback {
	text-align: center;
}
</style>
<body>
<section id="detail" style="height: 900px;">
	<h2>면접 결과 상세보기</h2>
	<br />
	<div id="detaildiv">
		<table id="detailtable" class="table-sm">
			<thead>
				<tr>
					<th width="150px;">면접관 번호</th>
					<th width="700px;">면접 질문</th>
					<th width="800px;">평가 내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${detailList}" var="dlist" varStatus="status">
						<tr>
							<td height="50px;" rowspan="${dlist.value.size()}">${status.count}</td>
						<c:forEach items="${dlist.value}" var="item" varStatus="status2">
						<c:if test="${status2.count ne 1 }"><tr></c:if>
							<td>${item.title}</td>
							<td>${item.evaluate_comment}</td>
						</tr>
						</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		<br />
	<a id="goback" href="${pageContext.request.contextPath}/info/checkMyEvaluation.do">뒤로가기</a>
	</div>
</section>	
</body>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
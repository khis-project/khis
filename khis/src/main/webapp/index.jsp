<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHIS</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/untact_interview_statistics_practice/untact_interview/zoomEnroll.jsp">
	<jsp:param value="안녕 스프링" name="title"/>
</jsp:include> --%>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
<jsp:param value="헤더" name="ti"/>
</jsp:include> 

<jsp:include page="/WEB-INF/views/Interview_review_board/test.jsp">
<jsp:param value="메인페이지" name="ti"/>
</jsp:include> 


<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp">
<jsp:param value="푸터" name="titl"/>
</jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<input type="text" name="companyName">
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>

<input type="button" name="NameBtn" onclick="location='${pageContext.request.contextPath}/untactInterview/companyApi.do?names=케이비아이알로이(주)';">
<%@page import="com.kh.khis.login_join_mypage.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="프리미엄 이용" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<%
	Member member = (Member) session.getAttribute("loginMember");		
%>
<style>
	.premiumBtn{
		width: 100%;
	}
</style>
<div style="text-align : center; margin-top : 50px; height:650px;">
<h2>프리미엄 결제<img src="${pageContext.request.contextPath }/resources/images/untact_interview_statistics_practice/mobile-payment-3069504.png" width="100px"></h2>
	<!-- 프리미엄 회원일 경우 -->
	<c:if test ="${not empty premium}">
		현재 <label style="font-weight: bold;">${premium.name}</label>님은 프리미엄 회원입니다.<br>
		${premium.leftDate.getYear() + 1900}년 ${premium.leftDate.getMonth() + 1}월 ${premium.leftDate.getDate()}일에 종료됩니다.
	</c:if>
	<!-- 프리미엄 회원이 아닐 경우 -->
	<c:if test ="${empty premium}">
	<form
		name="premiumEnrollFrm" 
		action="${pageContext.request.contextPath}/premium/insertPremium.do" 
		method="post">
		<table style="margin: auto;text-align: center;">
			<tr>
				<td style="color:red;" colspan="3">결제시 환불은 불가능합니다.</td>
			</tr>
			<tr>
				<td style="color:red;" colspan="3">프리미엄은 재로그인 후 적용됩니다.</td>
			</tr>
			<tr>
				<td colspan="3">
					<select name = "payWay" style="width:100%; text-align:center;">
							<option value="">선택</option>
							<option value="payco">페이코</option>
							<option value="kakaopay">카카오페이</option>
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="1">1개월</th>
				<th colspan="1">2개월</th>
				<th colspan="1">3개월</th>
			</tr>
			<tr>
				<td colspan="1">5,000원</td>
				<td colspan="1">9,000원</td>
				<td colspan="1">13,000원</td>
			</tr>
			<tr>
				<td><input type="button" class = "premiumBtn button-hover button-basic" value="결제" data-sub="5000"></td>
				<td><input type="button" class = "premiumBtn button-hover button-basic" value="결제" data-sub="9000"></td>
				<td><input type="button" class = "premiumBtn button-hover button-basic" value="결제" data-sub="13000"></td>
			</tr>
		</table>
		<input type="hidden" name = "month">
		<input type="hidden" name = "payment">
	</form>
	</c:if>
</div>

<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
<script>
//order
$(".premiumBtn").on('click',function(){
	const payWay = $("[name=payWay]").val();
	const paymount = $(this).data("sub");
	if(payWay == ""){
		alert("결제방식은 선택해주세요.");
		$("[name=payWay]").focus();
	}else{
	    var IMP = window.IMP; 
	    IMP.init('imp06098389'); 
	    IMP.request_pay({
	    	pg : payWay, 
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : 'khis 프리미엄 회원 결제',
	        amount : paymount,
	        buyer_email : '<%=member.getEmail()%>',
	        buyer_name : '<%=member.getName()%>',
	        buyer_tel : '<%=member.getPhone()%>',
	        buyer_addr : '',
	        buyer_postcode : '',
	    }, function(rsp) {
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다.';
	            $("[name=payment]").val(paymount);
	            $("[name=month]").val(paymount == '5000' ? '1' :(paymount == '9000') ? '2' : '3');
	            premiumEnrollFrm.submit();
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            rsp.error_msg;  
	        }
	    });
	}
});
</script>
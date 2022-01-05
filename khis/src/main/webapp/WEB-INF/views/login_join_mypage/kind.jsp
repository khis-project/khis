<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_join_mypage/kind.css"/>

<title>면접자 정보확인</title>
<form name="kind" action="<%=request.getContextPath()%>/join/kind" method="GET">
	<div class="container">
		<div class="loginForm">
			<h2>면접자 정보확인</h2>
			<div class="content">
				<h4>이름</h4>
				<input type="text" name="name" id="name" placeholder="이름을 입력하세요">
			</div>
			<div class="content">
				<h4>생년월일(ex.870604)</h4>
				<input type="text" name="birthday" id="birthday" placeholder="생년월일을 입력하세요">
			</div>
			<div class="content">
				<h4>휴대폰번호</h4>
				<input type="text" name="phone" id="phone" placeholder="(-없이)휴대폰번호를 입력하세요">
			</div>
			<div class="content" id="email">
				<h4>이메일</h4>
				<input type="email" name="email" id="email" placeholder="asdf@naver.com" required><br />
			</div>
			 	
			<div class="content">
				<h4>사업자등록번호</h4>
				<input type="text" name="coCode" id="coCode" placeholder="사업자등록번호를 입력하세요">
			</div>		
			<div class="content">
				<h4>면접번호</h4>
				<input type="text" name="interviewerNo" id="interviewerNo" placeholder="면접번호를 입력하세요">
			</div>
			
			<div class="submit">
	            <input type="button" value="확인"  id="myButton">
	            <input type="button" value="취소" class="cancel" onClick="window.close()">				
			</div>
		</div>
	</div>
</form>

<script>
$(document).ready(function(){
  $("#myButton").click(function(){
	var data = $('form[name=kind]').serialize();
    $.ajax({
      type : "GET",
      url : "${pageContext.request.contextPath}/join/kind",
      data : data, // 조회하는 데이터를 넘겨서 검증
      success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어온다. 'res'는 응답받은 데이터다.
          alert(res.success? "조회 성공 했습니다. 가입을 계속 진행해 주세요." : "조회 가능한 정보가 없습니다. 면접관리자에게 문의하시기 바랍니다.");
          if(res.success) {
        	  var $no = $(opener.document).find("input#interviewerNo");
              $no.val($("input#interviewerNo").val()); // 부모창의 companyNo 필드에 면접번호 입력
        	  var $no = $(opener.document).find("input#coCode");
              $no.val($("input#coCode").val()); // 부모창의 coCode 필드에 사업자번호 입력
        	  var $no = $(opener.document).find("input#name");
              $no.val($("input#name").val()); // 부모창의 name 필드에 사업자번호 입력
        	  var $no = $(opener.document).find("input#phone");
              $no.val($("input#phone").val()); // 부모창의 phone 필드에 사업자번호 입력
              var $no = $(opener.document).find("input#email");
              $no.val($("input#email").val()); // 부모창의 phone 필드에 사업자번호 입력        
        	  window.close();
          }
      },
      error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어온다.
        console.log(textStatus)
        console.log(XMLHttpRequest)
        console.log(errorThrown)
        alert("통신 실패.")
      }
    });
  });
})
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login_join_mypage/companyNo.css"/>

<html>
<head>
</head>
<body>
<form name="companyForm" action="<%=request.getContextPath()%>/join/companyNo.do" method="GET">
	<div class="container">
		<div class="companyForm">
			<h2>사업자등록번호를 입력해 주세요.</h2> <br />
			<div class="content">
					<input type="text" name="tmpCoCode" id="tmpCoCode" placeholder="(-없이)입력해 주세요."/>
			</div>
			<br />
			<div class="submit">
	            <input type="button" value="확인" id="myButton"/>
	            <input type="button" value="취소"  class="cancel" onClick="window.close()"/>
	        </div>
	    </div>
	 </div>
</form>

<script>
$(document).ready(function(){
  $("#myButton").click(function(){
    var coCode = $("input#tmpCoCode").val().replace();
    $.ajax({
      type : "POST", // HTTP method type(GET, POST) 형식이다.
      url : "${pageContext.request.contextPath}/join/companyNo",
      //contentType: "application/json; charset=utf-8",
      data : {coCode: coCode}, // coCode로 사업자번호를 넘겨서 검증
      success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터다.
        for (var i in res.data) {
          var co = res.data[i];
          if (co.b_no == coCode){
        	console.log(co);
            alert(co.tax_type);
            if (co.b_stt == "계속사업자") {
              var $tmpCo = $(opener.document).find("input#tmpCoCode");
              $tmpCo.val(co.b_no); // tmpCompanyNo 필드에 사업자번호 입력
              var $co = $(opener.document).find("input#coCode");
              $co.val(co.b_no); // 부모창의 companyNo 필드에 사업자번호 입력
              window.close();
              return;
            }
          }
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
</body>
</html>

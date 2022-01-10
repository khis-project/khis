<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp">
  <jsp:param value="로그인" name="title"/>
</jsp:include>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login_join_mypage/updateForm.css" />
</head>

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
	console.log("${msg}");
	<% // session.removeAttribute("msg"); %>
</script>
<c:remove var="msg" />
</c:if>

<title>회원 정보 업데이트</title>
<body>
<form name="updateForm"
id="updateForm"
	action="<%=request.getContextPath()%>/join/memberUpdate.do"
	method="POST">
	<div class="container">
		<div class="joinForm">
			<h2>회원 정보 수정</h2>
			<br />
			<h3>회원정보</h3>
			<br />
			<div class="content">
				<h4>아이디</h4>
				<input type="text" id="id" name="id" value="${loginMember.id}" readonly  > <br /> <!--readonly disabled  -->
			</div>
			
			<div class="content">
				<h4>가입자 유형</h4>
				<select name="kind" id="kind">
					<option value="IR_HAED" >면접관리자</option>
					<option value="IR_SUPERVISOR">면접관</option>
					<option value="IR">면접자</option>
					<option value="USER">예비면접자</option>
				</select>
			</div>
			<div class="content" id="coName" >
				<h4>*회사명</h4>
				<input type="text" name="coName" id="coName" value="${memberCompany.coName}"><br />
			</div>

			<div class="content" id="companyNo" readonly>
				<h4>사업자등록번호</h4>
				<input type="text" name="coCode" id="coCode" value="${memberCompany.coCode}" readonly>
				<input type="button" id="search" value="검색하기" class="Btn" onClick="h()"
					style= "width: 79px; background: #34496E; color: white; font-size: 14px; font-weight: bold; padding-left: 12px;">
			</div>
			<div class="content" id="companyAdd">
				<h4>*회사주소</h4>
				<input type="text" name="coAddress" id="coAddress" placeholder="" value="${memberCompany.coAddress}"><br />
			</div>			

			<div class="content" id="interviewerNo">
				<h4>면접번호</h4>
				<input type="text" name="interviewerNo" id="interviewerNo"><br />
			</div>
			
			<div class="content">
				<h4>이름</h4>
				<input type="text" name="name" id="name" value="${loginMember.name}" required readonly ><br />
			</div>

			<div class="content">
				<h4>이메일</h4>
				<input type="email" name="email" id="email" value="${loginMember.email}" required readonly ><br />
			</div>

			<div class="content">
				<h4>휴대전화</h4>
				<input type="tel"  name="phone" id="phone" value="${loginMember.phone}" required readonly ><br />
			</div>

			<div class="content">
				<h4>성별</h4>
				<select name="gender" id="gender" name="gender" value="${loginMember.gender}" disabled >
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
			
			<div class="content">
				<h4>*주소</h4>
				<input type="text" name="address" id="address" value="${loginMember.address}" required><br />
			</div>
			<br> <br>

			<div class="submit">
	            <input type="button" onClick="submitForm()" value="확인" class="signupBtn" id="signupBtn"/>
	            <input type="button" value="취소"  class="cancelBtn"  id="cancelBtn" onClick="history.back(-1)"/>
	        </div>
		</div>
	</div>	
</form>
</body>
<script>


var x = document.getElementById("kind");
x.value = "${loginMember.kind}";
// 사업자등록번호 팝업창
function h(){
  window.open(`${pageContext.request.contextPath}/member/companyNo.do`, "a","width=465, height=250, left =100, top=100");
}

//개인정보수집 동의 팝업창
function a(){
  window.open(`${pageContext.request.contextPath}/member/aggrement.do`, "a","width=700, height=430, left =10, top=80");
}

function submitForm(){
	
	 x.disabled = false;
	 disabled = false;
	 document.getElementById("gender").disabled = false;
	 document.getElementById("updateForm").submit();
}

//가입자 유형 (면접관리자: 회사명+회사정보입력 검색창 / 면접자,면접관,예비면접자: 회사명+회사정보x) /(면접자: 면접번호 입력창 o  / 면접관,면접관리자,예비면접자: 면접번호 입력창 x))
        
$(document).ready(function() {
  $('#kind').change(function() {
    //var result = $('#kind option:selected').val();
    var result = this.value;
    console.log('selected value:', result);
    if (result == 'IR_HAED') {
      $('#interviewerNo').hide();
      $('#coName').show();
      $('#companyNo').show();
      $('#companyAdd').show();
      document.getElementById("interviewerNo").disabled = true;
      
    }
    else {

    if (['IR'].includes(result)) {
    	document.getElementById("coName").hidden = true;
    	document.getElementById("companyAdd").hidden = true;
    	x.disabled = true;
    	document.getElementById("interviewerNo").hidden = false;
      window.open(`${pageContext.request.contextPath}/member/kind.do`, "a","width=500, height=750, left =100, top=100"); 
    }
    $('#coName').hide();

    if (['IR'].includes(result)) {
      $('#companyNo').hide(); 
    }
    else {
      $('#interviewerNo').hide();
      $('#companyNo').hide(); 
    }
    
    if (['USER'].includes(result)) {
        $('#companyNo').hide();
        $('#companyAdd').show();
    } 
    else {
        $('#companyAdd').hide();
      }
    	
    
    if (['IR_SUPERVISOR'].includes(result)) {
        window.open(`${pageContext.request.contextPath}/member/irSKind.do`, "a","width=500, height=580, left =100, top=100"); 
        $('#companyNo').show();
    	}
      $('#coName').hide();
      $('input#search').hide();
      $('#companyAdd').hide();
      
    }
  });
  
});


/* document.getElementById("coName").hidden = true;
document.getElementById("companyNo").hidden = true;
document.getElementById("companyAdd").hidden = true;
document.getElementById("interviewNo").hidden = true; */



// 리팩토링 조지자 

if("${loginMember.kind}" == "IR"){ // 면접자
	document.getElementById("coCode").hidden = true;
  document.getElementById("coName").hidden = true;
	document.getElementById("companyAdd").hidden = true;
	document.getElementById("search").hidden = true;
	document.getElementById("interviewerNo").hidden = true;
	document.getElementById("companyNo").hidden = true;
	x.disabled = true;
}
else if("${loginMember.kind}" == "IR_HAED"){  // 면접관리자
	document.getElementById("interviewerNo").hidden = true; 
	document.getElementById("interviewerNo").disabled = true;
	document.getElementById("interviewerNo").value = undefined;
	document.getElementById("search").hidden = true;
	x.disabled = true;

}
else if("${loginMember.kind}" == "IR_SUPERVISOR"){ // 면접관
	document.getElementById("coName").hidden = true;
	document.getElementById("companyAdd").hidden = true;
	document.getElementById("interviewerNo").hidden = true;
	document.getElementById("search").hidden = true;
	document.getElementById("companyNo").hidden = true;
	x.disabled = true;
}
else if("${loginMember.kind}" == "USER"){  // 예비면접자
	document.getElementById("coName").hidden = true;
	document.getElementById("companyNo").hidden = true;
	document.getElementById("interviewerNo").hidden = true;
	document.getElementById("companyAdd").hidden = true;
	x.remove("IR_HAED");
	x.remove("IR_SUPERVISOR");
}


// 리팩토링 끝




/*if("${loginMember.kind}" == "IR"){
	document.getElementById("coName").hidden = true;
	document.getElementById("companyAdd").hidden = true;
//	document.getElementById("companyNo").hidden = false;
	x.disabled = true;
	//x.remove("IR");

}
else if("${loginMember.kind}" == "IR_SUPERVISOR" || document.getElementById("kind").value == "IR_SUPERVISOR"){
	document.getElementById("coName").hidden = true;
	document.getElementById("companyNo").hidden = true;
	document.getElementById("interviewNo").hidden = true;
	x.disabled = true;
	//x.remove("IR_HAED");
	//x.remove("IR");
	//x.remove("USER");

	
}
if("${loginMember.kind}" == "USER"){
	document.getElementById("coName").hidden = true;
	document.getElementById("companyNo").hidden = true;
	document.getElementById("interviewNo").hidden = true;
	document.getElementById("companyAdd").hidden = true;
	x.remove("IR_HAED");
	x.remove("IR_SUPERVISOR");
	
}
else {
	x.disabled = true;
	document.getElementById("kind").readonly = true;

}

if(document.getElementById("kind").value == "IR_HAED"){

	document.getElementById("interviewNo").hidden = true;
	document.getElementById("interviewNo").disabled = true;
	document.getElementById("interviewNo").value = undefined;
	
}
else {
	//document.getElementById("tmp_test").hidden = true;

	document.getElementById("coName").hidden = true;
 	document.getElementById("companyNo").hidden = true;
 	document.getElementById("interviewNo").hidden = true;
} */


$(document).ready(function(){
	  $("#myButton").click(function(){
		var data = $('form[name=irSKind]').serialize();
	    $.ajax({
	      type : "GET",
	      url : "${pageContext.request.contextPath}/join/memberDelete.do",
	      data : data,
	      success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터다.
	        // alert(res.success? "회원정보 수정이 완료되었습니다." : "회원정보 수정이 실패하였습니다.")
	         if(res.success) {
	        	  var $no = $(opener.document).find("input#coCode");
	              $no.val($("input#coCode").val()); // 부모창의 coCode 필드에 사업자번호 입력
	        	  
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

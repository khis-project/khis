<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login_join_mypage/join.css" />
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>


<title>회원가입</title>
	<form name="joinForm"
		action="${pageContext.request.contextPath}/join/joinForm.do" method="POST">
		<div class="container">
			<div class="joinForm">
				<h2>회원가입</h2>
				<br />
				<h3>회원정보</h3>
				<br />
				<div class="memberId-container">
					<h4>아이디</h4>
					<input type="text" id="id" name="id" value=""
						placeholder="아이디를 입력하세요" required><br /> <span
						class="guide ok">이 아이디는 사용가능합니다.</span> <span class="guide error">이
						아이디는 이미 사용중입니다.</span> <input type="hidden" id="idValid" value="0" />
				</div>
				<div class="content">
					<h4>비밀번호</h4>
					<input type="password" name="password" id="password"
						placeholder="비밀번호를 입력하세요" required><br />
				</div>

				<div class="content">
					<h4>비밀번호 확인</h4>
					<input type="password" id="passwordCheck" required><br />
				</div>

				<div class="content">
					<h4>가입자 유형</h4>
					<select name="kind" id="kind">
						<option value="choice" selected>- 선 택 -</option>
						<option value="IR_HAED">면접관리자</option>
						<option value="IR_SUPERVISOR">면접관</option>
						<option value="IR">면접자</option>
						<option value="USER">예비면접자</option>
					</select>
				</div>
				<div class="content" id="coName">
					<h4>회사명</h4>
					<input type="text" name="coName" id="coName"><br />
				</div>

				<div class="content" id="companyNo">
					<h4>사업자등록번호</h4>
					<input type="number" name="coCode" id="coCode" readonly> <input
						type="button" id="search" value="검색하기" class="Btn" onClick="h()"
						style="width: 79px; background: #34496E; color: white; font-size: 14px; font-weight: bold; padding-left: 12px;">
				</div>
				<div class="content" id="companyAdd">
					<h4>회사주소</h4>
					<input type="text" name="coAddress" id="coAddress" placeholder=""><br />
				</div>

				<div class="content" id="interviewerNo">
					<h4>면접번호</h4>
					<input type="text" name="interviewerNo" id="interviewerNo"><br />
				</div>

				<div class="content">
					<h4>이름</h4>
					<input type="text" name="name" id="name" placeholder="이름을 입력하세요"
						required><br />
				</div>

				<div class="content">
					<h4>생년월일</h4>
					<input type="date" placeholder="생년월일 (ex)19870604)" name="birthday"
						id="birthday" required><br />
				</div>

				<div class="content" id="email">
					<h4>이메일</h4>
					<input type="email" name="email" id="email"
						placeholder="ex)asdf@naver.com" required><br />
				</div>

				<div class="content">
					<h4>휴대전화</h4>
					<input type="tel" name="phone" id="phone" placeholder="(-없이 입력)"
						required><br />
				</div>

				<div class="content">
					<h4>주소</h4>
					<input type="text" name="address" id="address"
						placeholder="주소를 입력하세요" required><br />
				</div>

				<div class="content">
					<h4>성별</h4>
					<select name="gender" id="gender">
						<option value="M" selected>남자</option>
						<option value="F">여자</option>
					</select>
				</div>

				<br>
				<div class="aggrement">
					<input type="checkbox" class="aggrement" id="aggrement"
						onClick="a()"> <label class="test" for="test">개인정보
						수집 및 이용에 동의합니다.</label>
				</div>
				<br> <br>

				<div class="content" id="btnContent">
					<input type="submit" value="가입하기" class="signupBtn">
				</div>
			</div>
		</div>
	</form>
<script>
//아이디 중복검사
$(id).keyup((e) => {
	const $id = $(e.target);
	const $error = $(".guide.error");
	const $ok = $(".guide.ok");
	const $idValid = $(idValid);
	
	if($id.val().length < 4){
		$(".guide").hide();
		$idValid.val(0);
		return;
	}
	
	$.ajax({
		url: `${pageContext.request.contextPath}/join/checkIdDuplicate2.do`,
		data: {
			id: $id.val()
		},
		success(data){
			console.log(data);
			const {available} = data;
			if(available){
				$ok.show();
				$error.hide();
				$idValid.val(1); 
			}
			else {
				$ok.hide();
				$error.show();
				$idValid.val(0);
			}
		},
		error: console.log
	});
});

//패스워드 확인	
$("#passwordCheck").blur(function(){
	var $password = $("#password"), $passwordCheck = $("#passwordCheck");
	if($password.val() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		$password.select();
	}
});

//아이디 확인
$("[name=joinForm]").submit(function(){

	var $id = $("#id");
	if(/^\w{4,}$/.test($id.val()) == false) {
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$id.focus();
		return false;
	}
	
	return true;
});

// 사업자등록번호 팝업창
function h(){
  window.open(`${pageContext.request.contextPath}/member/companyNo.do`, "a","width=465, height=300, left =100, top=100");
}

//개인정보수집 동의 팝업창
function a(){
  window.open(`${pageContext.request.contextPath}/member/aggrement.do`, "a","width=700, height=430, left =10, top=80");
}

// 가입자 유형 (면접관리자: 회사명+회사정보입력 검색창 / 면접자,면접관,예비면접자: 회사명+회사정보x) /(면접자: 면접번호 입력창 o  / 면접관,면접관리자,예비면접자: 면접번호 입력창 x))
$(document).ready(function() {
  $('#kind').change(function() {
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
        window.open(`${pageContext.request.contextPath}/member/kind.do`, "a","width=500, height=700, left =100, top=100"); 
      }
      $('#coName').hide();

    if (['IR'].includes(result)) {
      $('#interviewerNo').show();
      $('#companyNo').hide();
     } 
    else {
      $('#interviewerNo').hide();
    }
    
    if (['USER'].includes(result)) {
      $('#companyNo').hide(); 
    }
        
    if (['IR_SUPERVISOR'].includes(result)) {
        window.open(`${pageContext.request.contextPath}/member/irSKind.do`, "a","width=500, height=700, left =100, top=100"); 
        $('#companyNo').show();
    	}
      $('#coName').hide();
      $('input#search').hide();
      $('#companyAdd').hide();
      
    }
  });
  
});

document.getElementById("coName").hidden = true;
document.getElementById("companyNo").hidden = true;
document.getElementById("companyAdd").hidden = true;
document.getElementById("interviewerNo").hidden = true;

if(document.getElementById("kind").value == "IR_HAED"){
	document.getElementById("interviewerNo").hidden = true;
	document.getElementById("interviewerNo").disabled = true;
	document.getElementById("interviewerNo").value = undefined;

}

</script>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"></jsp:include>
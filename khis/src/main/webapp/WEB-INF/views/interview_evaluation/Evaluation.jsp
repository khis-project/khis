<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<%-- <link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/interview_evaluation/Evaluation.css"/> --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<fmt:requestEncoding value="utf-8"/>
<style>
<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    } 
#evaluation {
	font-family: 'GmarketSansMedium';
	width :99%;
    text-align: center;
    margin: auto;
}
.human.inlinediv {
	width: 10%;
	float: left;
	margin-left: 50px;

}
table {
	border-collapse: collapse;
}
.inlinediv {
	padding: 10;
	display: inline-table;
	text-align: left;
	
}
h3 {
	margin-left: 70px;
	margin-top: 50px;
	margin-bottom: 50px;
}

#person {
	margin-top: 10px;
/* 	margin-left: 30px; */
}
#person th {
	/* border: 1px solid black; */
	text-align: center;
}
#person td {
	/* border: 1px solid black; */
	text-align: center;
}
.interviews {
/* 	margin-left: 30px;
	margin-top: 50px; */
	border-collapse: collapse;
	border-left: none;
}
#certificate {
	border: 1px solid black;
}
#buttons {
	text-align: center;
/* 	margin-left: 50px; */
}
#content {
	margin-top: 10px;
	display: none;
/* 	margin-left: 45px; */
}
.button {
	opacity: 0;
	width: 220px;
	border-radius: 10%;

	/* background-color: rgba(41, 128, 185, 0.43); */
}
#person {
	position: relative;
	opacity: 0;
}
#interview-info {
	opacity: 0;
	position: fixed;
	margin-left: -400px;
	width: 50%;
	height: 70%;
}
#showInfo {
	opacity: 1;
}
.button-hidden {
	opacity: 0;
	width: 100%;
	visibility: hidden;
	background-color: white;
	border: 0px;
	cursor: pointer;
}
.button-none {
	width: 100%;
	visibility: hidden;
	background-color: white;
	border: 0px;
	cursor: pointer;
}
/* .button-hidden:hover {
	color: skyblue;
}
.button-none:hover {
	color: skyblue;
} */
#co_code_hidden {
	display: none;
}
#applyList {
	display: none;
}
#applytable {
	text-align: center;
}
#complete {
	display: none;
}
.totalresults {
	display: none;
}
#guide {
	float: left;
	opacity: 0;
}
.backgroundblue {
	width: 20%;
	float: right;
	margin-right: 50px;
}
#questionlist {
	height: 100%;
}
.buttonimg {
	display: none;
}
#showInfo {
	display: none;
	background-color: white;
	border: 0px;
	cursor: pointer;
}
#showInfo:hover {
	color: skyblue;
}
.hover {
	color: skyblue;
}
</style>
<script>
<c:if test="${not empty loginMsg}">
alert("${loginMsg}");
</c:if>
</script>
<div id="evaluation">
	<div class="human inlinediv">
		<br />
		<span style="color: skyblue;">※ 평가 완료</span>
		<br/>
		<span>※ 평가 미완료</span>
		<p style="color: green;">총 면접자 수 : ${totalCount}명
		<br><span style="color: blue;">- 참석자 수 : ${totalCount - notcomeCount}명</span>
		<br><span style="color: red;">- 미참석자 수 : ${notcomeCount}명</span></p>
		<table id="person" class="table table-sm table-hover">
			<thead class="thead-dark">
				<tr>
					<th width="50px;">번호</th>
					<th class="name" width="100px;">이름</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<c:if test='${list.member_no ne 0}'>
					<tr>
						<td>${list.interviewer_no}</td>
						<td id="${list.member_info_no}" style="<c:if test="${list.passcheck eq 'y' || list.passcheck eq 'n'}">color: skyblue;</c:if>">${list.name}</td>
					</tr>			
				</c:if>
			</c:forEach>
		</table>
		${pagebar}
	</div>

	<input type="hidden" id="member_info_no_hidden" value="" /> <!-- 면접자의 번호 -->
	<input type="hidden" id="co_code_hidden" value="" />
	<input type="hidden" id="imember_no_hidden" value="" />
	<input type="hidden" id="evaluate_no_hidden" value="" />
	<div id="interview-info-zoom" class="inlinediv interview" style="margin-left: 40px;">
    		<br />
			<input type="button" id="showInfo" value="인적사항 ▼" data-sub="0" />
		<div id="interview-info" class="interviewdetail">
			
		</div> 
		 <br />
	</div>
		<div class="inlinediv buttons backgroundblue">
		<br />
			<table id="buttons">
				<tr style="padding-bottom: 50px;">
					<td width="220px;"><input type="button" id="btn1" class="button-none" value="평가진행현황" /></td>
					<td width="220px;"><input type="button" id="btn2" class="button-none" value="과거지원이력" /></td>
				</tr>
				<tr>
					<td width="220px;"><img class="buttonimg" src="${pageContext.request.contextPath}/resources/images/evaluation/돋보기3.png" width="50px;" alt="" /><br /><input type="button" id="btn3" class="button-hidden" value="질문보기" /></td>
					<td width="220px;"><img class="buttonimg" src="${pageContext.request.contextPath}/resources/images/evaluation/타평가자결과.png" width="30px;" alt="" /><br /><input type="button" id="btn4" class="button-hidden" value="타평가자결과" /></td>
				</tr>
			</table>
			
			<div id="questionlist" class="inlinediv question">
				
			</div>
			<div id="applyList" class="inlinediv apply">
			
			</div>
			<div id="AssignedList" class="inlinediv Assigned">
			
			</div>
			<div id="anotherInterview">
			
			</div>
			
		</div>
		</div>

<script>
$(document).ready(function(){
	$("#person").animate({
		"opacity":"1"
	}, 2000);
	$("#guide").animate({
		"opacity":"1"
	}, 2000);
});
$("#person td").click((e) => {
	$("#interview-info").empty();
	$(".inlinediv.buttons").css({
		"display" : "inline-table"
	});
	$(".button-none").css({
		"position" : "relative"
	});
	$(".button").animate({
		"width" : "100%",
		"opacity" : "1"
	}, 2000);
	$("#showInfo").css({
		"display":"block"
	});
	$.ajax({
		url: `${pageContext.request.contextPath}/evaluation/evaluationDetail.do`,
		method: "GET",
		data: {
			member_no : $(e.target).attr('id')
		},
		success(data) {
			console.log(data);
			console.log(data.certificate);
			let certificatesDetail = `<table id="certificatetable" class="table table-sm table-borderless" style="text-align: center;">
										<thead class="btn-light">
										<tr>
											<th colspan='3'>보유자격증</th>
										</tr>
										<tr>
												<th>자격증 이름</th>
												<th>발행처</th>
												<th>취득일</th>
												</tr>
										</thead>`;
			let careerDetail = `<table id="applytable" class="table table-sm table-borderless" style="text-align: center;">
									<thead class="btn-light">
									<tr>
										<th colspan='4'>경력</th>
									</tr>
									<tr>
											<th>회사명</th>
											<th>근무 기간</th>
											<th>근무 시작일</th>
											<th>근무 종료일</th>
									</tr>	
										</thead>	
								`;
			$.each(data.certificate, function(index, item){
				console.log(item);
				certificatesDetail += `	
										<tr>
											<td>`+item.certificate_name+`</td>
											<td>`+ item.certificate_issuer +`</td>
											<td>`+ item. certificate_date + `</td>
										</tr>`; 

			});
			certificatesDetail += ((data.certificate.length == 0) ? `
					<tr><td colspan='3'>보유한 자격증이 없습니다.</td></tr>` : ``);
			certificatesDetail += `</table>`;
			
			$.each(data.career, function(index, item){
				careerDetail += `<tr>
									<td>`+item.company_name + `</td>
									<td>` + item.career_term + '년' +`</td>
									<td>`+ item.career_start_time + `</td>
									<td>` + item.career_end_time + `</td>
								</tr>`;
			});
			careerDetail += ((data.career.length == 0) ? `<tr><td colspan='4'>보유한 경력이 없습니다.</td></tr>` : ``);
			careerDetail += `</table>`;
			
			console.log(certificatesDetail);
			let html = `<br/><br/><table class="interviews" style="width:100%;">
							<tr>
								<td width="200px;" rowspan="8">
									<img src="\${data.interviewer.image}" alt="사진" width="180px;" height="190px;"/>			
								</td>
								<td  colspan="2">\${data.interviewer.name} | \${data.interviewer.gender} | 만 \${data.interviewer.age-1}세 (\${data.interviewer.age})</td>
							</tr>
							<tr> 
								<td  colspan="2">\${data.interviewer.ssn}</td>
							</tr>
							<tr>
								<td  colspan="2"><hr /></td>
							</tr>	
							<tr>
								<td  colspan="2">\${data.interviewer.job_posting_name}</td>
							</tr>	
							<tr>
								<td  colspan="2">지원분야: 개발팀</td>
							</tr>	
							<tr>
								<td colspan="2">전화번호 : \${data.interviewer.phone}</td>
							</tr>
							<tr>
								<td colspan="2">이메일 : \${data.interviewer.email}</td>
							</tr>	
							<tr>
								<td>지원경로: 잡코리아</td>
							</tr>
							<tr>
								<td colspan="4"><hr /></td>
							</tr>
							<tr>
								<td colspan="4">자기소개서</td>
							</tr>
							<tr>
								<td colspan="4"><textarea rows="8px;" cols="60px;" readonly style="width : 100%;">\${data.interviewer.self_introduction}</textarea></td> 
							</tr>
							<tr>
								<td style="height: 15px;"></td>
							</tr>
							</table>
							`+ certificatesDetail + careerDetail ;
		
		$("#interview-info").html(html);
		/* $("#showInfo").click((e) => {
			
		}); */
		$("#member_info_no_hidden").val(data.interviewer.member_info_no);
		$("#co_code_hidden").val(data.interviewer.co_code);
		console.log(data.interviewer.member_info_no);
		},
		error: console.log
	});
	$(".button-none").css({
		"visibility":"visible"
	});
	
	$("#member_info_no_hidden").val($(e.target).attr('id'));
	// 테이블 클릭했을 때 면접자 회원 번호 값이 들어감.
	
	$(".button").css({
		/* "background-color":"rgba(41, 128, 185, 0.43)" */
	});
	
	$(".button-hidden").css({
		"visibility":"hidden"
	});
	
	$("#questionlist").css({
		"display":"none"
	});
	
	$("#applyList").css({
		"display":"none"
	});
	
});


/* $(".button").click((e) => {
	$(".button").css({
		"background-color":"rgba(41, 128, 185, 0.43)" */
	/* });
	$(e.target).css({
		"background-color":"white"
	});
}) */

$("#btn2").click((e) => {
	$(".buttonimg").css({
		"display":"none"
	});
	$(".finishFrmid").css({
		"display":"none"
	});
	$(".button-hidden").css({
		"visibility":"hidden"
	});
	$("#content").css({
		"display":"none"
	});
	$("#finish").css({
		"display":"none"
	});
	$("#AssignedList").css({
		"display":"none"
	});
	$("#anotherInterview").css({
		"display":"none"
	});
	$.ajax({
		url: `${pageContext.request.contextPath}/evaluation/pastApply.do`,
		method: "GET",
		data: {
			member_info_no : $("#member_info_no_hidden").val(),
			co_code : $("#co_code_hidden").val()
		},
		success(data){
			let html = `<table id="applytable" class="table table-sm"><thead class="thead-dark"><tr><th colspan="2">면접 날짜</th><th>공고 유형</th></tr></thead>`;
			$.each(data, function(index, item){
				console.log(item);
				html += `<tr><td>`+item.start_time+`~`+item.end_time+`</td><td colspan="2" width="200px;">`+item.job_posting_name+`</td></tr>`;	
			});
			html += (data.length == 0) ? `<tr><td colspan='3'>지원 이력이 없습니다.</td></tr>` : `</table>`;
			$("#applyList").html(html);
			$("#applyList").css({
				"display":"block"
			});
			$("#questionlist").css({
				"display":"none"
			});
		},
		error: console.log
	});
	
})

$("#btn1").click((e) => {
	$(".button-hidden").animate({
		"opacity":"1"
	}, 1000);
	$(".buttonimg").css({
		"display":"inline"
	});
	$(".button-hidden").css({
		"visibility":"visible"
	});
	$("#applyList").css({
		"display":"none"
	});
	$("#AssignedList").css({
		"display":"none"
	});
	$("#anotherInterview").css({
		"display":"none"
	});
	$("#questionlist").css({
		"display":"none"
	});
})

$("#btn3").click((e) => {
	$("#btn2").removeClass("active");
	$("#btn4").removeClass("active");
	$("#btn3").toggleClass("active");
	$("#evaluate_value").toggleClass("selectpicker");
	/* $("#btn1").css({
		"background-color":"white"
	}); */
	$(".totalresults").css({
		"display":"inline"
	});
	let pass = '';
	console.log("pass3 = " + pass);
	$.ajax({
		url: `${pageContext.request.contextPath}/evaluation/evaluationQuestion.do`,
		method: "GET",
		data: {
			member_info_no : $("#member_info_no_hidden").val(),
			interviewer_no : 43 // 면접관 번호 세션에서 불러와야함
		},
		success(data){
			let html = `<table id="content" style="margin-top: 30px; display : block;">
				<tr>
				<td width="360px;">면접 질문 평가</td>
			</tr>
			<tr>
				<td colspan="2"><hr /></td>
			</tr></table>`;
			console.log("도착은했냐");
			console.log(data);
			let testvalue = 0;
			let sum = 0;
			$.each(data, function(index, item){
				pass = item.passcheck;
				console.log("pass2 = " + pass);
				sum += item.evaluate_value;
				console.log(data.length);
				console.log(item.evaluate_no);
				$("#evaluate_no_hidden").val($("#evaluate_no_hidden").val() + item.evaluate_no + (index != data.length - 1 ? "," : ""));
				console.log(item.interview_no);
				console.log(item.evaluate_value);
				console.log(item.evaluate_value==4);
				testvalue = item.evaluate_value + "";
				html += `<form
					class="finishFrmid"
					name="finishFrm`+item.interview_no+`"
					action="${pageContext.request.contextPath}/evaluation/insertEvaluation.do"
					method="post"
					style="margin-bottom: 50px;">
					<table>
					<input type="hidden" name="interview_no" value="`+item.interview_no+`"/>
					<input type="hidden" name="member_no" value="`+item.member_no+`"/>
					<tr><td>` + `Q`+(index+1)+`.`+item.title + `</td><td style="text-align: right">
					<select id="evaluate_value" class="evaluate_value" name="evaluate_value" `+((pass != null) ? `disabled` : ``)+`>
						<option value="5" `+(testvalue== "5" ? `selected` : ``)+`>5점</option>
						<option value="4" `+(testvalue== "4" ? `selected` : ``)+`>4점</option>
						<option value="3" `+(testvalue== "3" ? `selected` : ``)+`>3점</option>
						<option value="2" `+(testvalue== "2" ? `selected` : ``)+`>2점</option>
						<option value="1" `+(testvalue== "1" ? `selected` : ``)+`>1점</option>
					</select>
					
				</td> 
			<tr>
				<td style="height: 10px;"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea class="evaluate_comment form-control" name="evaluate_comment" rows="3px;" cols="40px;" `+((pass != null) ? `readonly` : ``)+`>`+(item.evaluate_value != 0 ? item.evaluate_comment : ``)+`</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width: 100%" class="evaluation-insert btn btn-outline-primary" id ="`+item.interview_no+`" value="`+(item.evaluate_value != 0 ? `수정` : `저장`)+`" `+((pass != null) ? `disabled` : ``)+`/></td>
			</tr>
			<tr>
				<td style="height: 10px;"></td>
			</tr></table></form>`;
				console.log(item.evaluate_value);
			});
			console.log(data.length == 0);
			html +=
			((data.length == 0) ? `<table><tr><td>등록된 면접 질문이 없습니다. <br>면접 관리자에게 문의하세요.</td></tr></table>` :
			`<table>
			<tr>
				<td width="450px;"><input type="button" style="width: 100%;" id="finish" class="btn btn-outline-success" value="`+((pass != null) ? `모든 평가가 완료되었습니다.` : `평가완료`)+`" `+((pass != null) ? `disabled` : ``)+`/></td>
			</tr>
			<tr>
				<td id="totalscore" style="text-align: center; ` + ((pass != null) ? `"` : `display: none;"`)+`><label>총 점수 : </label><label id="sumValue" `+((pass != null) ? `` : `style="display: none;"`)+`>`+((pass != null) ? sum : ``)+`</label>/<label id="totalValue" `+((pass != null || pass != '') ? `` : `style="display: none;"`)+`>`+data.length * 5+`</label>점 (<label id="averageValue">`+(Math.round((sum / (data.length)) * 100) / 100)+`</label>)</td>
			</tr>
			<tr>
				<td id="totalradio" style="text-align: center; ` + ((pass != null) ? `"` : `display: none;"`)+`>
					<input type="radio" id="pass" name="results" value="y" `+ ((pass == 'y') ? ` checked `:``) + ((pass != null) ? `disabled` : '')+`><label style="color: blue;" for="pass">합격</label>
					<input type="radio" id="nonpass" name="results" value="n" ` + ((pass == 'n') ? ` checked `:``) + ((pass != null) ? `disabled` : '')+` ><label style="color: red;" for="nonpass">불합격</label>	
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width: 100%;" id="complete" class="btn btn-outline-danger" value="평가제출" `+((pass != null) ? `disabled` : ``)+`/></td>
			</tr>
		</table>`);
		html+=`<input type="hidden" class="member_info_no" value=`+$("#member_info_no_hidden").val()+`>`;
		$("#questionlist").html(html);
		$("#applyList").css({
			"display":"none"
		});
		$("#finish").on("click", function(){
			if(confirm("평가를 완료하시겠습니까? 완료후엔 수정이 불가능합니다.")){
				$(".evaluate_value").attr('disabled', true);
				$(".evaluate_comment").attr('readonly', true);
				$(".evaluation-insert").attr('disabled', true);
				$("#finish").attr('disabled', true);
				$("#complete").css({
					"display":"block"
				});
				$("#totalValue").css({
					"display":"inline"
				});
				$("#sumValue").css({
					"display":"inline"
				});
				$("#totalscore").css({
					"display":"block"
				});
				$("#totalradio").css({
					"display":"block"
				});
				if(pass == 'y'){
					$("#pass").attr('checked', true);
					$("#nonpass").attr('checked', false);
				}
				else {
					$("#nonpass").attr('checked', true);
					$("#pass").attr('checked', false);
				}
				$.ajax({
					url: `${pageContext.request.contextPath}/evaluation/sumValue.do`,
					method: "GET",
					data: {
						evaluate_no : $("#evaluate_no_hidden").val()
					},
					success(data){
						$("#sumValue").text(data);
						$("#averageValue").text(Math.round((Number($("#sumValue").text()) / (Number($("#totalValue").text())/5)) * 100) / 100);
						console.log($("#averageValue").text());
						$("#averageValue").text() > 3 ? $("#pass").prop('checked', true) : $("#nonpass").prop('checked', true);
						$("#averageValue").text() > 3 ? $("input:radio[name=results]").attr('disabled', false) : $("input:radio[name=results]").attr('disabled', true);
					},
					error: console.log
				});
				
			}
			else {
				
			}
		});
		console.log($("input[name=results]:checked").val());
		$("#complete").click((e) => {
			if(confirm("평가 결과를 제출하시겠습니까?")){
				$.ajax({
					url: `${pageContext.request.contextPath}/evaluation/passnonpass.do`,
					method: "POST",
	
					data: {
						member_info_no : $("#member_info_no_hidden").val(),
						co_code : $("#co_code_hidden").val(),
						passcheck : $("input:radio[name=results]:checked").val()
					},
					success(data){
						alert('평가가 완료되었습니다.')
						$("input:radio[name=results]").attr('disabled', true);
						$("#complete").attr('disabled', true);
						$("#finish").val('모든 평가가 완료되었습니다.');
						$("#complete").css({
							"display":"none"
						});
					},
					error: console.log
				});
			}
			else {
				
			}
		});
	/* console.log($(".evaluation-insert"));
	$(".evaluation-insert").hover(function(){
		$(this).removeClass("btn-link");
		$(this).toggleClass("btn-primary");
	}, function(){
		$(this).toggleClass("btn-link");
		$(this).removeClass("btn-primary");
	});
		 */
		},
		error: console.log
	});
	$(".totalresults").css({
		"display":"block"
	});
	$("#content").css({
		"display":"block"
	});
	$("#questionlist").css({
		"display":"block"
	});
	$("#AssignedList").css({
		"display":"none"
	});
	$("#anotherInterview").css({
		"display":"none"
	});
});

$("#btn4").click((e) => {
	$("#btn2").removeClass("active");
	$("#btn3").removeClass("active");
	$("#btn4").toggleClass("active");
/* 	$("#btn1").css({
		"background-color":"white"
	}); */
	$("#content").css({
		"display":"none"
	});
	$("#questionlist").css({
		"display":"none"
	});
	$("#AssignedList").css({
		"display":"block"
	});
	$.ajax({
		url: `${pageContext.request.contextPath}/evaluation/interviewerList.do`,
		method: "GET",
		data: {
			member_info_no : $("#member_info_no_hidden").val()
		},
		success(data){
			let html = `<table id="Assignedtable" class="table table-sm"><tr><thead class="thead-dark"><th>배정 번호</th><th>면접관 번호</th></thead></tr>`;
			$.each(data, function(index, item){
				console.log(item);
				html += `<tr><td>`+item.assigned_no+`</td><td>`+`<input type="button" class="assignedbtn btn btn-outline-secondary" value="`+item.assigned_interviewer+`"/>`+`</td></tr>`;	
			});
			html += (data.length == 0) ? `<tr><td style="text-align: center;" colspan='2'>다른 면접관의 평가 자료가 없습니다.</td></tr>` : `</table>`;
			$("#AssignedList").html(html);
			$(".assignedbtn").click((e) => {
				$.ajax({
					url: `${pageContext.request.contextPath}/evaluation/otherInterviewerEvaluation.do`, 
					method: "GET",
					data: {
						imember_info_no : $(e.target).val()
					},
					success(data){
						let html = `<table id="content" style="margin-top: 30px; display : block;">
							<tr>
							<td width="360px;"><label style="color: blue;">`+$(e.target).val()+`번</label> 면접관 평가결과</td>
						</tr>
						<tr>
							<td colspan="2"><hr /></td>
						</tr></table>`;
						$.each(data, function(index, item){
							testvalue = item.evaluate_value + "";
							html += `<form
								class="finishFrmid"
								name="finishFrm`+item.interview_no+`"
								action="${pageContext.request.contextPath}/evaluation/insertEvaluation.do"
								method="post">
								<table>
								<input type="hidden" name="interview_no" value="`+item.interview_no+`"/>
								<input type="hidden" name="member_no" value="`+item.member_no+`"/>
								<tr><td>` + `Q`+(index+1)+`.`+item.title + `</td><td style="text-align: right">
								<select name="evaluate_value" disabled>
									<option value="5" `+(testvalue== "5" ? `selected` : ``)+`>5점</option>
									<option value="4" `+(testvalue== "4" ? `selected` : ``)+`>4점</option>
									<option value="3" `+(testvalue== "3" ? `selected` : ``)+`>3점</option>
									<option value="2" `+(testvalue== "2" ? `selected` : ``)+`>2점</option>
									<option value="1" `+(testvalue== "1" ? `selected` : ``)+`>1점</option>
								</select>
							</td> 
						<tr>
							<td style="height: 10px;"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control" name="evaluate_comment" rows="3px;" cols="40px;" readonly>`+(item.evaluate_value != 0 ? item.evaluate_comment : ``)+`</textarea></td>
						</tr>
						<tr>
							<td style="height: 10px;"></td>
						</tr></table></form>`;
							console.log(item.evaluate_value);
						});
					html+= (data.length == 0) ? `<table><th><td>해당 면접관은 현재 평가중입니다.</td></th></table>` : `<input type="hidden" class="member_info_no" value=`+$("#member_info_no_hidden").val()+`>`;
					$("#anotherInterview").html(html);
					$("#applyList").css({
						"display":"none"
					});
					$("#anotherInterview").css({
						"display":"block"
					});
					}
				})	
			})
		},
		error: console.log
	});
});


$(document).on("click", ".evaluation-insert", function(){
	let form = $(this).attr("id");
	console.log(form);
	console.log($("[name=finishFrm"+form+"]").serialize());
	console.log($(this).val());
	if($(this).val() == "저장"){
		
		 $.ajax({
			url: `${pageContext.request.contextPath}/evaluation/insertEvaluation.do`,
			method: "POST",
			data: $("[name=finishFrm"+form+"]").serialize(),
			dataTyps : "json",
			success(data){
				alert("평가 저장이 완료되었습니다.");
				$("#"+form).val("수정");
			},
			error: console.log
		}); 
	}else{
		 $.ajax({
				url: `${pageContext.request.contextPath}/evaluation/updateEvaluation.do`,
				method: "POST",
				data: $("[name=finishFrm"+form+"]").serialize(),
				dataTyps : "json",
				success(data){
					alert("${data.msg}");
					/* $("#"+form).val("저장"); */
					$(this).attr("action",`${pageContext.request.contextPath}/evaluation/updateEvaluation.do`);
					
				},
				error: console.log
			}); 
	}
});
$(document).on("click", "#showInfo", function(){
	$("#showInfo").animate({
		"color":"red"
	}, 1000);
	if($("#showInfo").data('sub') == 0){
		$("#interview-info").animate({
			"opacity":"1"
		}, 1000);
		$("#showInfo").data('sub', 1);
		$("#showInfo").val('인적사항 ▲');
	}
	else {
		$("#interview-info").animate({
			"opacity":"0"
		}, 1000);
		$("#showInfo").data('sub', 0);
		$("#showInfo").val('인적사항 ▼');
	}
});
$(document).on("click", ".button-none", function(){
	$(".button-none").css({
		"color":"black"
	});
	$(".button-hidden").css({
		"color":"black"
	});
	$(this).css({
		"color":"skyblue"
	});
});
$(document).on("click", ".button-hidden", function(){
	$(".button-hidden").css({
		"color":"black"
	});
	$(".button-none").css({
		"color":"black"
	});
	$(this).css({
		"color":"skyblue"
	});
});
/* $(".button-none").click((e) => {
	$(".button-none").css({
		"color":"black"
	});
	$(e.target).css({
		"color":"red"
	});
}); */
</script>	
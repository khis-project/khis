<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="게시글 수정 페이지" name="title" />
</jsp:include>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/boardForm.css"/>

<div style="height:auto; background-color:#34495e; padding:20px;">
  <div class="board-container">
  <c:forEach items="${list}" var="co">
  	<form 
		name="boardFrm" 
		action="${pageContext.request.contextPath}/Interview_review_board/boardEnroll.do" 
		method="POST">
		<div class="header">
			<img src="https://i.ibb.co/FqRVJqk/premium-icon-communication-3663457.png"/>
			<span class="title">면접 후기 수정</span>
			<hr style="margin:0;"/>
		</div>
		
		<div class="content" >
			<table class="tb1">
				<tr>
					<td><label for="co_name">기업명</label></td>
					<td>
						<input type="text" id="co_name" name="co_name" placeholder="기업명"  value="${co.CO_NAME}" readonly required/>
						<input type="text" id="co_code" name="co_code" style="display:none;" value="${co.CO_CODE}" readonly/>
						<input type="text" id="co_addr" name="co_addr" style="display:none;" readonly/>
						<input type="text" id="boardNo" name="boardNo" style="display:none;" value="${co.BOARD_NO}" readonly/>
						<input type="text" id="co_name" name="co_name" placeholder="기업명" style="display:none;" readonly required/>
						<input type="text" name="co_addr" value="${co.CO_ADDRESS == null ? '회사주소가 없습니다.' : co.CO_ADDRESS}" style="height:20px; border:0; color : #7c7c7c;"readonly/>
						<input type="text" name="pass_no" value="${co.PASS_NO}" style="display:none;" readonly/>
					</td>
				</tr>

				<tr>
					<td><label for="occupationCode">직종</label><td>
						<select id="occupationCode" name="occupationCode" required>
							<option value="">직종</option>
							<option value="1" <c:if test = "${co.OCCUPATION_CODE eq '1'}">selected</c:if>>서비스업</option>
							<option value="2" <c:if test = "${co.OCCUPATION_CODE eq '2'}">selected</c:if>>제조/화학</option>
							<option value="3" <c:if test = "${co.OCCUPATION_CODE eq '3'}">selected</c:if>>의료/제약/복지</option>
							<option value="4" <c:if test = "${co.OCCUPATION_CODE eq '4'}">selected</c:if>>유통/무역/운송</option>
							<option value="5" <c:if test = "${co.OCCUPATION_CODE eq '5'}">selected</c:if>>교육업</option>
							<option value="6" <c:if test = "${co.OCCUPATION_CODE eq '6'}">selected</c:if>>건설업</option>
							<option value="7" <c:if test = "${co.OCCUPATION_CODE eq '7'}">selected</c:if>>IT/웹/통신</option>
							<option value="8" <c:if test = "${co.OCCUPATION_CODE eq '8'}">selected</c:if>>미디어/디자인</option>
							<option value="9" <c:if test = "${co.OCCUPATION_CODE eq '9'}">selected</c:if>>은행/금융업</option>
							<option value="10" <c:if test = "${co.OCCUPATION_CODE eq '10'}">selected</c:if>>기관/협회</option>
						</select>
				</tr>
				<tr>
					<td><label for="employmentType">고용형태</label></td>
					<td>
						<select id="employmentType" name= "employmentType" required>
							<option value="" disabled selected>고용형태</option>
							<option value="인턴직" <c:if test = "${co.EMPLOYMENT_TYPE eq '인턴직'}">selected</c:if>>인턴직</option>
							<option value="아르바이트" <c:if test = "${co.EMPLOYMENT_TYPE eq '아르바이트'}">selected</c:if>>아르바이트</option>
							<option value="정규직" <c:if test = "${co.EMPLOYMENT_TYPE eq '정규직'}">selected</c:if>>정규직</option>
							<option value="계약직" <c:if test = "${co.EMPLOYMENT_TYPE eq '계약직'}">selected</c:if>>계약직</option>
							<option value="프리랜서" <c:if test = "${co.EMPLOYMENT_TYPE eq '프리랜서'}">selected</c:if>>프리랜서</option>
							<option value="기타" <c:if test = "${co.EMPLOYMENT_TYPE eq '기타'}">selected</c:if>>기타</option>
						</select>
					</td>
				</tr>
			</table>
			<hr />
			<table class="tb1">
				<tr>
					<td><label for="title">제목</label></td>
					<td><input type="text" id="title" placeholder="면접에서 채용까지의 과정 요약" name="title" value = "${co.TITLE}" required/></td>
				</tr>
				<tr>
					<td><label for="interviewQuestion">면접질문</label></td>
					<td><textarea name="interviewQuestion" id="interviewQuestion" cols="30" rows="10" required> ${co.INTERVIEW_QUESTION}</textarea></td>
				</tr>
				<tr>
					<td><label for="interviewAnswer">면접답변</label></td>
					<td><textarea name="interviewAnswer" id="interviewAnswer" cols="30" rows="10" required>${co.INTERVIEW_ANSWER}</textarea></td>
				</tr>
				<tr>
					<td><label for="interviewDifficulty">면접난이도</label></td>
					<td>
						<select name="interviewDifficulty" id="interviewDifficulty" required>
							<option value="" disabled selected>선택해주세요.</option>
							<option value="20" <c:if test = "${co.INTERVIEW_DIFFICULTY eq '20'}">selected</c:if>>매우 쉬움</option>
							<option value="40" <c:if test = "${co.INTERVIEW_DIFFICULTY eq '40'}">selected</c:if>>쉬움</option>
							<option value="60" <c:if test = "${co.INTERVIEW_DIFFICULTY eq '60'}">selected</c:if>>보통</option>
							<option value="80" <c:if test = "${co.INTERVIEW_DIFFICULTY eq '80'}">selected</c:if>>어려움</option>
							<option value="100" <c:if test = "${co.INTERVIEW_DIFFICULTY eq '100'}">selected</c:if>>매우 어려움</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="interviewEvaluation">면접평가</label></td>
					<td>
						<select name="interviewEvaluation" id="interviewEvaluation" required>
							<option value="" disabled selected>(A~E)</option>
							<option value="5" <c:if test = "${co.INTERVIEW_EVALUATION eq '5'}">selected</c:if>>A</option>
							<option value="4" <c:if test = "${co.INTERVIEW_EVALUATION eq '4'}">selected</c:if>>B</option>
							<option value="3" <c:if test = "${co.INTERVIEW_EVALUATION eq '3'}">selected</c:if>>C</option>
							<option value="2" <c:if test = "${co.INTERVIEW_EVALUATION eq '2'}">selected</c:if>>D</option>
							<option value="1" <c:if test = "${co.INTERVIEW_EVALUATION eq '1'}">selected</c:if>>E</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="">합격여부</label></td>
					<td>
						<input type="radio" value="Y" name="passcheck" checked/>합격
						<input type="radio" value="N" name="passcheck"/>불합격
					</td>
				</tr>
				<tr>
					<td><label for="interviewPath">면접경로</label></td>
					<td>
						<select name="interviewPath" id="interviewPath" required>
							<option disabled selected>선택해주세요.</option>
							<option value="온라인지원" <c:if test = "${co.INTERVIEW_PATH eq '온라인지원'}">selected</c:if>>온라인지원</option>
							<option value="직원추천" <c:if test = "${co.INTERVIEW_PATH eq '직원추천'}">selected</c:if>>직원추천</option>
							<option value="헤드헌터" <c:if test = "${co.INTERVIEW_PATH eq '헤드헌터'}">selected</c:if>>헤드헌터</option>
							<option value="공개채용" <c:if test = "${co.INTERVIEW_PATH eq '공개채용'}">selected</c:if>>공개채용</option>
							<option value="학교 취업지원 센터" <c:if test = "${co.INTERVIEW_PATH eq '학교 취업지원 센터'}">selected</c:if>>학교 취업지원 센터</option>
							<option value="기타" <c:if test = "${co.INTERVIEW_PATH eq '기타'}">selected</c:if>>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="">면접일자</label></td>
					<td>
						<select class="interviewYear" name= "interviewYear" required>
							<option disabled selected>년</option>
								<option value="2022" <c:if test = "${year eq '2022'}">selected</c:if>>2022</option>
								<option value="2021" <c:if test = "${year eq '2021'}">selected</c:if>>2021</option>
								<option value="2020" <c:if test = "${year eq '2020'}">selected</c:if>>2020</option>
								<option value="2019" <c:if test = "${year eq '2019'}">selected</c:if>>2019</option>
								<option value="2018" <c:if test = "${year eq '2018'}">selected</c:if>>2018</option>
								<option value="2017" <c:if test = "${year eq '2017'}">selected</c:if>>2017</option>
						</select>
						<select class="interviewMonth" name="interviewMonth" required>
								<option disabled selected>월</option>
								<option value="01" <c:if test = "${month eq '01'}">selected</c:if>>01</option>
								<option value="02" <c:if test = "${month eq '02'}">selected</c:if>>02</option>
								<option value="03" <c:if test = "${month eq '03'}">selected</c:if>>03</option>
								<option value="04" <c:if test = "${month eq '04'}">selected</c:if>>04</option>
								<option value="05" <c:if test = "${month eq '05'}">selected</c:if>>05</option>
								<option value="06" <c:if test = "${month eq '06'}">selected</c:if>>06</option>
								<option value="07" <c:if test = "${month eq '07'}">selected</c:if>>07</option>
								<option value="08" <c:if test = "${month eq '08'}">selected</c:if>>08</option>
								<option value="09" <c:if test = "${month eq '09'}">selected</c:if>>09</option>
								<option value="10" <c:if test = "${month eq '10'}">selected</c:if>>10</option>
								<option value="11" <c:if test = "${month eq '11'}">selected</c:if>>11</option>
								<option value="12" <c:if test = "${month eq '12'}">selected</c:if>>12</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="announcementTime"></label></td>
					<td><input type="text" id="announcementTime" name="announcementTime" placeholder="면접 결과 발표까지 걸린 시간" name="announcementTime" value="${co.ANNOUNCEMENT_TIME}" required/>&nbsp;&nbsp;일</td>
				</tr>
				<tr>
					<td><label for="">채용절차</label></td>
					<td>
						<div id="recruitment_method">
							<div class="interview">
								<h6 class="group_title">면접</h6>
								<div class="checkbox_group" >
									<label for="case"><input type="checkbox" id="case" name="recruitmentMethod" value="케이스면접">케이스면접</label>
									<label for="pt"><input type="checkbox" id="pt" name="recruitmentMethod" value="PT면접"/>PT면접</label>
									<label for="group"><input type="checkbox" id="group" name="recruitmentMethod" value="그룹면접"/>그룹면접</label>
									<label for="english"><input type="checkbox" id="english" name="recruitmentMethod" value="영어면접"/>영어면접</label>
									<label for="debate"><input type="checkbox" id="debate" name="recruitmentMethod" value="토론면접"/>토론면접</label>
									<label for="personal"><input type="checkbox" id="personal" name="recruitmentMethod" value="개인면접"/>개인면접</label>
								</div>
							</div>
							<div class="test">
								<h6 class="group_title">시험</h6>
								<div class="checkbox_group">
									<label for="take_notes"><input type="checkbox" id="take_notes" name="recruitmentMethod" value="필기시험"/>필기시험</label>
									<label for="personality"><input type="checkbox" id="personality" name="recruitmentMethod" value="인적성검사"/>인적성검사</label>
									<label for="skill"><input type="checkbox" id="skill" name="recruitmentMethod" value="스킬테스트"/>스킬테스트</label>
									<label for="essay"><input type="checkbox" id="essay" name="recruitmentMethod" value="논술시험"/>논술시험</label>
									<label for="group_project"><input type="checkbox" id="group_project" name="recruitmentMethod" value="그룹프로젝트"/>그룹프로젝트</label>
								</div>
							</div>
							<div class="etc">
								<h6 class="group_title">기타</h6>
								<div class="checkbox_group">
									<label for="workshop"><input type="checkbox" id="workshop" name="recruitmentMethod" value="워크숍"/>워크숍</label>
									<label for="hiking_athletic"><input type="checkbox" id="hiking_athletic" name="recruitmentMethod" value="산행/체육대회"/>산행/체육대회</label>
									<label for="etc"><input type="checkbox" id="etc" name="recruitmentMethod" value="기타"/>기타</label>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<hr/>
		<div class="footer">
			<button class="btn" id="submit" type="submit">수정</button>
			<button class="btn" id="cancel" type="button" onclick="history.go(-1)">취소</button>		
		</div>
	</form>
	</c:forEach>
</div>
	<!-- Modal 팝업 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					 <div class="modal-content" style="maxWidth:900px;">
					      <div class="modal-header">
					        <h4 class="modal-title" id="exampleModalLabel">기업명 선택</h4>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form>
					          <div class="form-group" style="display:flex;">
					            <input type="text" class="form-control" name="coName" id="coName" placeholder="검색어를 입력해주세요.">
					            <button id="searchBtn" type="button" style="background-color:#000; color:#fff; margin-left:10px; border-radius: 0.25rem;">검색</button>
					          </div>
					          <div class="form-group">
				              <table class="tb2">
				                <thead>
				                  <tr>
				                    <th style="display:none;">기업코드</th>
				                    <th>기업명</th>
				                    <th>주소</th>
				                    <th>비고</th>
				                  </tr>
				                </thead>
				                <tbody>
					              <c:forEach items="${companyList}" var="vo">
				                  <tr>
				                    <td style="display:none;">${vo.co_code}</td>
				                    <td>${vo.co_name}</td>
				                    <td>${vo.co_address}</td>
				                    <td><button class="chooseCompany" type = "button" data-dismiss="modal">선택</button></td>
				                  </tr>
					              </c:forEach>
				                </tbody>
				              </table>
				              ${pagebar}
					      	</div>
					      </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" >취소</button>
					        <!-- <button type="button" class="btn btn-primary">등록</button> -->
					      </div>
					 </div>
				</div>
			</div>
	</div>
<script>

$(document).ready(function(){
	
	
	$('#searchBtn').on("click", function(){
	    var coName = $('#coName').val();
	    
	    $.ajax({
		    url: "${pageContext.request.contextPath}/Interview_review_board/boardFosrm.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    data: { coName: coName },  // HTTP 요청과 함께 서버로 보낼 데이터
		    method: "POST",   // HTTP 요청 메소드(GET, POST 등)
		    dataType: "text", // 서버에서 보내줄 데이터의 타입
		    success : function(data) {
              
               $('.tb2 > tbody').empty();
               for(var i = 0; i<data.length; i++){
            	   if(!data[i].CO_ADDRESS){
            		   $('.tb2 > tbody').append('<tr>'
                  			 +'<td style="display:none;">'+data[i].CO_CODE+'</td>'	
                  			 +'<td>'+data[i].CO_NAME+'</td>'	
                  			 +'<td></td>'	
                  			 + '<td><button class="chooseCompany" type = "button" data-dismiss="modal">선택</button></td>'
                  	   +'</tr>');
            	   }else{
            		   $('.tb2 > tbody').append('<tr>'
                  			 +'<td style="display:none;">'+data[i].CO_CODE+'</td>'	
                  			 +'<td>'+data[i].CO_NAME+'</td>'	
                  			 +'<td>'+data[i].CO_ADDRESS+'</td>'	
                  			 + '<td><button class="chooseCompany" type = "button" data-dismiss="modal">선택</button></td>'
                  	   +'</tr>');
            	   }
            	 
               }

             
            }, error : console.log
            
	    });
	    
	});
	
	let temp = "${recruitments}";
	let arr = temp.split(',');

	for(var i = 0; i < arr.length; i++){
		$('input[name=recruitmentMethod][value="'+arr[i]+'"]').attr('checked','checked');
	}
});

//테이블의 Row 클릭시 값 가져오기
$(document).on('click', '.tb2 tbody tr', function(){
/* $(".tb2 tbody tr").on("click",function(){ */ 
	var str = ""
		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		

		
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});

		// td.eq(index)를 통해 값을 가져올 수도 있다.
		var coCode = td.eq(0).text();
		var coName = td.eq(1).text();
		var coAddr = td.eq(2).text();

		$("#co_name").val(coName);
		$("#co_code").val(coCode);
		$("#co_addr").val(coAddr);
	});

  
</script>
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
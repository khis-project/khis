<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp"/>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/boardForm.css"/>

<div style="height:auto; background-color:#34495e; padding:20px;">
  <div class="board-container">
  	<form 
		name="boardFrm" 
		action="${pageContext.request.contextPath}/Interview_review_board/boardEnroll.do" 
		method="POST"
		>
		<div class="header">
			<img src="https://i.ibb.co/FqRVJqk/premium-icon-communication-3663457.png"/>
			<span class="title">면접 후기 작성</span>
			<hr style="margin:0;"/>
		</div>
		<div class="content" >
			<table class="tb1">
				<tr>
					<td><label for="co_name">기업명</label></td>
					<td>
						<select name="co_code" required>
							<option value="" disabled selected>직종</option>
							<c:forEach items="${list}" var="vo">
								<option value="${vo.co_code}" data-sub="${vo.co_address},${vo.pass_no}">${vo.co_name}</option>
							</c:forEach>
						</select>
						<input type="text" id="co_name" name="co_name" placeholder="기업명" style="display:none;" readonly required/>
						<input type="text" name="co_addr" value="후기를 작성할 기업을 선택해주세요." style="height:20px; border:0; color : #7c7c7c;"readonly/>
						<input type="text" name="pass_no" value="" style="display:none;" readonly/>
					
						<%-- <input type="text" id ="coName" class="coName" name="coName" list ="coList"/>
						<select id="companyList" name="coCode">
							<option value="" disabled selected>직종</option>
							<c:forEach items="${companyList}" var="vo">
							<option value="${vo.co_code}">${vo.co_name}</option>
							</c:forEach>
						</select> --%>
						<%-- <input list="coList" name="coName" id="co_name" placeholder="기업명">
						<input name = "coCode">
						<datalist id="coList">
							<c:forEach items="${companyList}" var="vo">
								<option value="${vo.co_code}" >${vo.co_name} / ${vo.co_address}</option>
							</c:forEach>
						</datalist> --%>
					</td>
					<td>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-what="hello" style="margin-top: -30px;">전체기업조회</button>
					</td>
				</tr>

				<tr>
					<td><label for="occupationCode">직종</label><td>
						<select id="occupationCode" name="occupationCode" required>
							<option value="" disabled selected>직종</option>
							<option value="1">서비스업</option>
							<option value="2">제조/화학</option>
							<option value="3">의료/제약/복지</option>
							<option value="4">유통/무역/운송</option>
							<option value="5">교육업</option>
							<option value="6">건설업</option>
							<option value="7">IT/웹/통신</option>
							<option value="8">미디어/디자인</option>
							<option value="9">은행/금융업</option>
							<option value="10">기관/협회</option>
						</select>
				</tr>
				<tr>
					<td><label for="employmentType">고용형태</label></td>
					<td>
						<select id="employmentType" name= "employmentType" required>
							<option value="" disabled selected>고용형태</option>
							<option value="인턴직">인턴직</option>
							<option value="아르바이트">아르바이트</option>
							<option value="정규직">정규직</option>
							<option value="계약직">계약직</option>
							<option value="프리랜서">프리랜서</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
			</table>
			<hr />
			<table class="tb1">
				<tr>
					<td><label for="title">제목</label></td>
					<td><input type="text" id="title" placeholder="면접에서 채용까지의 과정 요약" name="title" required/></td>
				</tr>
				<tr>
					<td><label for="interviewQuestion">면접질문</label></td>
					<td><textarea name="interviewQuestion" id="interviewQuestion" cols="30" rows="10" placeholder="최소 1개 이상의 질문을 입력해주세요." required></textarea></td>
				</tr>
				<tr>
					<td><label for="interviewAnswer">면접답변</label></td>
					<td><textarea name="interviewAnswer" id="interviewAnswer" cols="30" rows="10" placeholder="면접답변 혹은 느낀점을 입력해주세요." required></textarea></td>
				</tr>
				<tr>
					<td><label for="interviewDifficulty">면접난이도</label></td>
					<td>
						<select name="interviewDifficulty" id="interviewDifficulty" required>
							<option value="" disabled selected>선택해주세요.</option>
							<option value="20">매우 쉬움</option>
							<option value="40">쉬움</option>
							<option value="60">보통</option>
							<option value="80">어려움</option>
							<option value="100">매우 어려움</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="interviewEvaluation">면접평가</label></td>
					<td>
						<select name="interviewEvaluation" id="interviewEvaluation" required>
							<option value="" disabled selected>(A~E)</option>
							<option value="5">A</option>
							<option value="4">B</option>
							<option value="3">C</option>
							<option value="2">D</option>
							<option value="1">E</option>
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
							<option value="온라인지원">온라인지원</option>
							<option value="직원추천">직원추천</option>
							<option value="헤드헌터">헤드헌터</option>
							<option value="공개채용">공개채용</option>
							<option value="학교 취업지원 센터">학교 취업지원 센터</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="">면접일자</label></td>
					<td>
						<select class="interviewYear" name= "interviewYear" required>
							<option disabled selected>년</option>
								<option value="2022">2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
						</select>
						<select class="interviewMonth" name="interviewMonth" required>
								<option disabled selected>월</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="announcementTime"></label></td>
					<td><input type="text" id="announcementTime" name="announcementTime" placeholder="면접 결과 발표까지 걸린 시간" name="announcementTime" required/>&nbsp;&nbsp;일</td>
				</tr>
				<tr>
					<td><label for="">채용절차</label></td>
					<td>
						<div id="recruitment_method">
							<div class="interview">
								<h6 class="group_title">면접</h6>
								<div class="checkbox_group" >
									<label for="case"><input type="checkbox" id="case" name="recruitmentMethod" value="케이스면접"/>케이스면접</label>
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
			<button class="btn" id="submit" type="submit">등록</button>
			<button class="btn" id="cancel" type="button" onclick="history.go(-1)">취소</button>		
		</div>
	</form>
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
				                <!-- 무슨 회사가 있는지 확인만 할수있게 진행 -->
					              <c:forEach items="${companyList}" var="vo">
				                  <tr>
				                    <td style="display:none;">${vo.co_code}</td>
				                    <td>${vo.co_name}</td>
				                    <td>${vo.co_address}</td>
				                    <td></td>
				                  </tr>
					              </c:forEach>
				                </tbody>
				              </table>
				              ${pagebar}
					      	</div>
					      </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close" >취소</button>
					        <!-- <button type="button" class="btn btn-primary">등록</button> -->
					      </div>
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
		    dataType: "json", // 서버에서 보내줄 데이터의 타입
		    success : function(data) {
              
               $('.tb2 > tbody').empty();
               for(var i = 0; i<data.length; i++){
            	   if(!data[i].CO_ADDRESS){
            		   $('.tb2 > tbody').append('<tr>'
                  			 +'<td style="display:none;">'+data[i].CO_CODE+'</td>'	
                  			 +'<td>'+data[i].CO_NAME+'</td>'	
                  			 +'<td></td>'	
                  			 + '<td></td>'
                  	   +'</tr>');
            	   }else{
            		   $('.tb2 > tbody').append('<tr>'
                  			 +'<td style="display:none;">'+data[i].CO_CODE+'</td>'	
                  			 +'<td>'+data[i].CO_NAME+'</td>'	
                  			 +'<td>'+data[i].CO_ADDRESS+'</td>'	
                  			 + '<td></td>'
                  	   +'</tr>');
            	   }
            	 
               }

            }, error : function(data) {
                console.log('오류다');
                
            }
	    });
	    
	});

});

//테이블의 Row 클릭시 값 가져오기
$(document).on('click', '.tb2 tbody tr', function(){
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
 		console.log("coCode = " + coCode);
 		console.log("coName = " + coName);
 		console.log("coAddr = " + coAddr);
	});

//전송하기 전에 확인 작업하는 코드
/* function check_code(){
	let co_code = document.boardFrm.co_code.value;
	if(co_code == ""){
		document.boardFrm.co_code.focus();
	}
}
 */
//
//주소를 보여주기 위함
	$("[name=co_code]").on("change", function () { 
		var value = $(this).val(); 
		var subValue = $(this).find("option:selected").data("sub").split(","); 
		console.log(subValue[0]);
		console.log(subValue[1]);
		$("[name=co_addr]").val(subValue[0] == "" ? "회사주소가 없습니다." : subValue[0]);
		$("[name=pass_no]").val(subValue[1]);
	});
</script>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
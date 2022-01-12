<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="zoom 조회" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>

<!-- 해당 면접관리자의 zoom List를 가져와서 수정/삭제 만들기-->
<!-- 삭제를 누르기 전에 이부분에  -->
<!--  -->
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<div id = "zoomSection" style="height: 900px;" class="text-align-center">
	<h2 style="margin-top:50px"><img src="${pageContext.request.contextPath}/resources/images/untact_interview_statistics_practice/zoomUse/zoom_logo_icon_189240.png" width="45px"/>Zoom 회의실 리스트</h2>
	<label style="font-size : 9px; color : #808080;">회의실을 삭제하면 해당 면접자의 회의실 배정도 다시해야됩니다</label>
	<table class="zoomListTb">
		<tr>
			<th>번호</th>
			<th>회의실번호</th>
			<th>api key</th>
			<th>배정된 인원(면접관)</th>
			<th>배정된 인원(면접자)</th>
			<th>수정</th>
			<th>삭제</th>
			
		</tr>
		
<c:if test="${!empty zoomList}">
<!-- 		<tr>
			<td>zoom_no</td>
			해당 api_key를 가져올때는 앞에 5자만 보여주고 나머지는 *처리하기
			<td><input type="text" id = "api_key" name = "api_key" width ="100px" readonly></td>
			면접관/면접자 인원수에 마우스를 hover하면 이름과 면접시간 출력되게 하기
			<td>면접관 인원수</td>
			<td>면접자 인원수</td>
			<td style="display:none;"><input type="hidden" class="zoom_txt" id = "id" name="id"></td>
			<td><input type="button" class="interview_btn" id = "zoomUpdateBtn" value="수정"></td>
			<td><input type="button" class="interview_btn" id = "zoomDeleteBtn" value="삭제"></td>
			<td><input type="hidden" class="zoom_txt" id = "id" name="id"></td>해당 zoom 정보를 추가한 면접관리자 id
		</tr> -->

				<script>		
/* 					var I = "<span class = 'zoom_number'>";
					var R = "<span class = 'zoom_number'>";
					console.log("as" + as);
					var test = "";
					var booleans = false; */
					//해당 리스트에서 해당 회의실 번호가 포함된 데이터를 가져와서 이름부분 가져오기
				</script>
		<c:forEach items="${zoomList}" var="z" varStatus="status">
			<tr>
				<td><c:out value="${status.count}"/></td>
				<td>${z.zoom_number}</td>
				<!-- 해당 api_key를 가져올때는 앞에 5자만 보여주고 나머지는 *처리하기 -->
				<td><input type="text" id = "api_key" name = "api_key" width ="100px" value = '${z.api_key}' readonly></td> 
				
				<!-- 면접관/면접자 인원수에 마우스를 hover하면 이름과 면접시간 출력되게 하기-->
				<td>
					<span class = "zoom_number_R" id ="${z.zoom_number}_Rs" >${zoom_number[z.zoom_number += ',' +='R'] == null ? 0 : zoom_number[z.zoom_number += ',' +='R']} 명</span>
					<span class = "zoom_number" id ="${z.zoom_number}_R" ></span>

				</td>
				<td>
				<!--  해당 값 hover 시, 그 하위 요소 보이게 하기 -->
					<span class = "zoom_number_I" id ="${z.zoom_number}_Is">${zoom_number[z.zoom_number += ',' +='I'] == null ? 0 : zoom_number[z.zoom_number += ',' +='I']} 명</span>
					<span class = "zoom_number" id ="${z.zoom_number}_I"></span>
				</td>
				
				
				<td style="display:none;"><input type="hidden" class="zoom_txt" id = "id" name="id" value=""></td> <!-- 해당 세션에서 member_no 가져와야 됨-->
				<td><input type="button" class="button-hover button-basic table-button" value="수정" onclick="location='${pageContext.request.contextPath}/untactInterview/zoomDetail.do?zoom_no=${z.zoom_no}';"></td>
				<td><input type="button" class="button-hover button-basic table-button" value="삭제" onclick="location='${pageContext.request.contextPath}/untactInterview/zoomDelete.do?zoom_no=${z.zoom_no}';"></td>
			</tr>
			<script>

/* 				$(as).each(function(i, zooms){
					test = zooms.split("name=")[1].split(",")[0];
					booleans = zooms.split("zoom_number=")[1].split(",")[0] == "${z.zoom_number}";
					if("I" == zooms.split("role=")[1].split(",")[0] && booleans){							
						I += test ;
						if(as.length != i)
							I += "<br>";
					}
					else if("R" == zooms.split("role=")[1].split(",")[0] && booleans){							
						R += test ;
						if(as.length != i)
							R += "<br>";
					}
					console.log("I" + I);
					console.log("R" + R);
				});

				$("#${z.zoom_number}_Is").after(I+"</span>");
				$("#${z.zoom_number}_Rs").after(R+"</span>");
				
				I = "";
				R = "";
				booleans = false; */
			</script>
		</c:forEach>
</c:if>
	</table>
	<div style="margin-top:100px; ">
		${pagebar}
	</div>
</div>
	<script>
	names();
	function names(){
			const as = "${zoom}".replace("[","").replace("]","").replaceAll("Zoom(","").replaceAll("), ","/").replace(")","").split("/");
			var I = "";
			var R = "";
			var test = "";
			var zoom_no = "";

			$(as).each(function(i, zooms){
				I = "";
				R = "";
				test = zooms.split("name=")[1].split(",")[0];
				zoom_no = zooms.split("zoom_number=")[1].split(",")[0];
				
				//면접관/ 면접자 별로 나눠서 데이터 추가하기
				if("I" == zooms.split("role=")[1].split(",")[0]){	
					I += test ;
					if(as.length != i)
						I += "<br>";
				}
				else if("R" == zooms.split("role=")[1].split(",")[0]){							
					R += test ;
					if(as.length != i)
						R += "<br>";
				}
				$("#"+zoom_no+"_I").html($("#"+zoom_no+"_I").html()+I);
				$("#"+zoom_no+"_R").html($("#"+zoom_no+"_R").html()+R);
			});
			
			booleans = false;
		}

	
	$(() => {

	});
	$(".zoom_number_R").hover(function(){
		if($(this).next().text() != "")
			$(this).next().css('display','inline');
	}, function(){
		if($(this).next().text() != "")
			$(this).next().css('display','none');
	});
	$(".zoom_number_I").hover(function(){
		if($(this).next().text() != "")
			$(this).next().css('display','inline');
	}, function(){
		if($(this).next().text() != "")
			$(this).next().css('display','none');
	});
	</script>
	<jsp:include page="/WEB-INF/views/Interview_review_board/common/footer.jsp"></jsp:include>
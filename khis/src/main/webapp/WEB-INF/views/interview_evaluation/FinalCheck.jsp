<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/interview_evaluation/FinalEvaluation.css"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/header.jsp">
	<jsp:param value="최종 평가 페이지" name="title" />
</jsp:include>
<jsp:include page="/WEB-INF/views/interview_management/common/interviewSidebar.jsp"></jsp:include>

<div id="final">
	<h3>최종 평가</h3>
	<div class="interviewer inlinediv">
		<p>총 면접자 수 : ${iTotalCount}</p>
		<table id="interviewer" class="table table-sm">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
			</thead>
			<c:forEach items="${iList}" var="list">
				<tr>
					<td>${list.member_info_no}</td>
					<td id="${list.member_info_no}">${list.name}</td>
				</tr>
			</c:forEach>
		</table>
		${pagebar}
	</div>
	<input type="hidden" id="member_info_no_hidden" value="" />
	<input type="hidden" id="co_code_hidden" value="" />
	<input type="hidden" id="final_pass_hidden" value="" />
	<div id="interviewer-info" class="inlinediv interview">

	</div>
</div>

<script>
$("#interviewer td").click((e) => {
	$("#member_info_no_hidden").val($(e.target).attr('id'));
	/* $(document).on('click', '#complete', function(){
		
	}); */
	$.ajax({
		url: `${pageContext.request.contextPath}/evaluation/InterviewrDetail.do`,
		method: "GET",
		data: {
			member_info_no : $(e.target).attr('id'),
		},
		success(data){
			let pass = '';
			let html = `<br><br><table class="table" id="interviewertable">
							<thead class="thead-light">
								<tr>
									<th>번호</th>
									<th>면접관 번호</th>
									<th>평가 결과</th>
								</tr>
							</thead>`;
			let value = 0;
			$.each(data, function(index, item){
				pass = item.final_pass_check;
				html += `<tr>
							<td>`+(index+1)+`</td>
							<td style="color : ">`+item.assigned_interviewer+`</td>
							<td style="color : `+(item.passcheck == 'y' ? 'blue' : (item.passcheck == '미평가' ? 'green' : 'red'))+`">`+(item.passcheck == 'y' ? `합격` : (item.passcheck == 'n' ? `불합격` : item.passcheck)) +`</td>
						</tr>`;
				value += (item.passcheck == '미평가' ? 1 : 0);
			});
			console.log("pass = " + pass);
			console.log("value = " + value);
			html +=	`<tr>
						<td id="totalradio" colspan='3'>
							<input type="radio" id="pass" name="results" value="y" `+((value > 0) ? `disabled` : ``)+` `+((pass != null) ? `disabled` : ``)+` `+((pass == 'y' ? `checked` : ``))+`><label style="color: blue" for="pass">합격</label>
							<input type="radio" id="nonpass" name="results" value="n" `+((value > 0) ? `disabled` : ``)+` `+((pass != null) ? `disabled` : ``)+` `+((pass == 'n' ? `checked` : ``))+`><label style="color: red" for="nonpass">불합격</label>
						</td>
					</tr>
					 <tr>
						<td colspan='3'><input type="button" class="btn btn-outline-success" id="complete" style="width: 100%;" value="`+((value > 0) ? '평가 불가능' : '평가 완료')+`" `+((value > 0) ? `disabled` : ``)+` `+((pass != null) ? `disabled` : ``)+`/></td>
					 </tr>
					 </table>`;
			console.log("value = " + value);
			$("#interviewer-info").html(html);
			(value > 0) ? $("#complete").removeClass("btn-outline-success") : '';
			(value > 0) ? $("#complete").toggleClass("btn btn btn-danger") : '';
			$("#complete").val((pass != null ? '평가가 완료된 면접자입니다.' : $("#complete").val()));
			$("#complete").click((e) => {
				if(confirm("최종 평가를 완료하시겠습니까?")){
					$.ajax({
						url: `${pageContext.request.contextPath}/evaluation/insertFinalEvaluation.do`,
						method: "POST",
						data: {
							member_info_no : $("#member_info_no_hidden").val(),
							final_pass_check : $("input:radio[name=results]:checked").val()
						},
						success(data){
							alert('평가가 완료되었습니다.');
							$("#final_pass_hidden").val($("input:radio[name=results]:checked").val());
							alert($("#final_pass_hidden").val());
							$("input:radio[name=results]").attr('disabled', true);
							$("#complete").attr('disabled', true);
							$("#complete").val('평가가 완료된 면접자입니다.');
							$("#final_pass_hidden").val($("input:radio[name=results]:checked").val());
							
						},
						error: console.log
					})
				}
				else {
					
				}
			})
		},
		error: console.log
	});
});
</script>
<jsp:include
	page="/WEB-INF/views/Interview_review_board/common/footer.jsp"/>
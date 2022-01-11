<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/header.jsp"/>
<!-- 페이징 bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- 사용자 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Interview_review_board/boardDetail.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/untact_interview_statistics_practice/statistics/statistics.js"></script>
<div style="height:auto; background-color:#34495e; padding:20px;">
  <div class="board-container">
    <c:forEach items="${list}" var="co" varStatus="status" begin="0" end="0">
    <div id="foo">
      <div id="co_img"><img src="${co.OCCUPATION_IMG_URL}"/></div>
    </div>
    <div id="co_info">
      <div id = "bo_no" style="display:none;">${co.BOARD_NO}</div>
      <div id="co_name"><h3>${co.CO_NAME}</h3></div>
      <div id="occupation_name"><span>${co.OCCUPATION_NAME}</span></div>
      <span style="color:#2196f3;">★&nbsp;</span><span id="co_evaluation_avg">${score}</span>
      <div class="statics_form" style="display:flex; flex-direction: row;">
        <div class="difficulty_form">
          <div class="row_title" style="margin:10px;">면접 난이도 평균</div>
          <div class="score" style="text-align: center; margin: 20px;">
            <span style="font-size: xxx-large;">
              ${interViewAvg}
            </span>
          </div>
          <div style="text-align:center;">
            <div style="margin-bottom: 5px;">
            <input type="range" value="${interViewAvg}" min="1" max="100" id="myRange" disabled/>
            </div>
            <span style="margin-right:160px; ">쉬움(0)</span>
            <span>어려움(100)</span>
          </div>
        </div>
        <!-- <div class="graph_form"></div> -->
        <!-- <iframe src="/statistics/statistics.do" style="width: 440px; border: 0;" ></iframe>-->
        <div class="text-align-center" id = "zoomSection">
        <!-- 선택하는거에 따라서 나이별/경력별 나오게 하기 -->
          <input type="hidden" name="urlContextPath" style="dispaly:none;" value="${pageContext.request.contextPath}"/>
          <input type="hidden" name="co_code" style="dispaly:none;" value="${co.CO_CODE}"/>
          
          <select name="satisticsKind" onChange="statisticsKindFunc();" style="margin-top:10px;">
            <option value="age">나이별</option>
            <option value="career">경력별</option>
          </select>
          <label>(소수점 셋째자리에서 반올림)</label>
          <div class="text-align-center margin-auto-basic" id="columnchart_material" style="width: 380px; height: 200px;">
            <h3 style="margin-top:30px;"><img src="">▲ 종류를 선택해주세요.</h3>
          </div>
        </div>
      </div>
    </div>
    </c:forEach>
    <div class="content">
			<c:forEach items="${list}" var="board">
				<div class="content_box1">
					<div class="content-top">
						<img src="https://i.ibb.co/6FCnkc5/profile-user.png" alt="" />
						<div class="content-top-text">
							<span>${board.EMPLOYMENT_TYPE}</span> <span>/</span> <span>${board.REG_DATE}</span>
						</div>
						<c:if test="${board.MEMBER_NO == MemberNo}">
							<div class="btn">
								<a
									href="${pageContext.request.contextPath}/Interview_review_board/boardUpdate.do?boardNo=${board.BOARD_NO}">수정</a>
								<a
									href="${pageContext.request.contextPath}/Interview_review_board/boardDelete.do?boardNo=${board.BOARD_NO}"
									id="delete_btn">삭제</a>
							</div>
						</c:if>
					</div>
					<div class="content_box2">
						<div class="menu">
							<span class="menu_title">면접난이도</span><br>
							<c:choose>
								<c:when test="${board.INTERVIEW_DIFFICULTY eq 20}">
									<span class="difficulty"
										style="background-color: #6fba1f; color: #fff;">매우쉬움</span>
									<br>
								</c:when>
								<c:when test="${board.INTERVIEW_DIFFICULTY eq 40}">
									<span class="difficulty"
										style="background-color: #8ad43b; color: #fff;">쉬움</span>
									<br>
								</c:when>
								<c:when test="${board.INTERVIEW_DIFFICULTY eq 60}">
									<span class="difficulty"
										style="background-color: #fb9f00; color: #fff;">보통</span>
									<br>
								</c:when>
								<c:when test="${board.INTERVIEW_DIFFICULTY eq 80}">
									<span class="difficulty"
										style="background-color: #fb6400; color: #fff;">어려움</span>
									<br>
								</c:when>
								<c:when test="${board.INTERVIEW_DIFFICULTY eq 100}">
									<span class="difficulty"
										style="background-color: #e7391d; color: #fff;">매우어려움</span>
									<br>
								</c:when>
							</c:choose>
							<br> <span class="menu_title">면접일자</span><br> <span>${board.INTERVIEW_DATE}</span><br>
							<br> <span class="menu_title">면접경로</span><br /> <span>${board.INTERVIEW_PATH}</span>
						</div>
						<div class="review">
							<div class="review_box">
								<div class="title">
									<h4 style="margin-top: 0; font-weight: bold;">“
										${board.TITLE} ”</h4>
								</div>
								<div class="question">
									<span class="row_title">면접질문</span><br>
									${board.INTERVIEW_QUESTION}
								</div>
								<div class="answer">
									<span class="row_title">면접답변 혹은 느낀점</span><br>
									${board.INTERVIEW_ANSWER}
								</div>
								<div class="employment">
									<span class="row_title">채용방식</span><br>
									${board.RECRUITMENT_METHOD}
								</div>
								<div class="announcement">
									<span class="row_title">발표시기</span><br>
									${board.ANNOUNCEMENT_TIME}일 후
								</div>
							</div>
							<div class="result">
								<div class="passcheck" style="margin-right: 50px;">
									<span class="row_title">면접결과</span>
									<c:choose>
										<c:when test="${board.PASSCHECK eq 'Y'}">
											<span class="check_yn"> 합격 </span>
										</c:when>
										<c:otherwise>
											<span class="check_yn"> 불합격 </span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="evaluation">
									<span class="row_title">면접평가</span>
									<c:choose>
										<c:when test="${board.INTERVIEW_EVALUATION eq 5}">
											<span class="abcde">A</span>
										</c:when>
										<c:when test="${board.INTERVIEW_EVALUATION eq 4}">
											<span class="abcde">B</span>
										</c:when>
										<c:when test="${board.INTERVIEW_EVALUATION eq 3}">
											<span class="abcde">C</span>
										</c:when>
										<c:when test="${board.INTERVIEW_EVALUATION eq 2}">
											<span class="abcde">D</span>
										</c:when>
										<c:when test="${board.INTERVIEW_EVALUATION eq 1}">
											<span class="abcde">E</span>
										</c:when>
									</c:choose>
								</div>
							</div>
							<div class="comment-list" data-board-no="${board.BOARD_NO}">
								[댓글<span id="toc-toggle-count"></span>개]<span id="toc-toggle">
									보기</span> <br />
								<br />
								<div id="toc-content">
									<input type="checkbox" class="secretBtn"
										value="commentSecretYN"> <label class="secretlb">[비밀댓글]</label>
									<br /> <input class="comment-input" type="text"
										placeholder="20글자 내로 적어주세요.:)" name="commentsTitle">
									<button class="add" type="button"
										style="border: none; outline: none;">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
    ${pagebar}
  </div>
</div>
<script id="template" type="text/template">
  <div class="comment">
    <span class="cmt-nm"></span> <span class="cmt-text"></span> <span class="cmt-dt"></span>
    <span class="cmt-del">삭제</span> <span class="cmt-up">수정</span>
  </div>
</script>
<script>
  var contextPath = `${pageContext.request.contextPath}`;
  $(function(){
    var template = $('script#template').text(); // template text
    $('.comment-list').each(function(){
      var boardNo = $(this).attr('data-board-no');
      var $add = $(this).find('.add');
      var $input = $(this).find('.comment-input');
      var $secretBtn = $(this).find('.secretBtn');
      var content = $(this).find('#toc-content')[0];
      var toggle = $(this).find('#toc-toggle')[0];
      var commentCount = $(this).find('#toc-toggle-count')[0];
      
      
      /* 댓글 불러오기 */
      $.get(contextPath + '/boardComment/commentList.do?boardNo=' + boardNo, function(data) {
        //alert(data.length)
        commentCount.textContent = data.length
        data.forEach(function(comment){
          $add.after(createComment(comment));
        });
      })
      toggle.onclick = function() {
        if( content.style.display === 'block') {
          content.style.display = 'none';
          toggle.textContent = ' 보기';
        } else {
          content.style.display = 'block';
          toggle.textContent = ' 닫기';
        }
      }
      $add.click(function(){ // 등록 버튼 클릭
        var commentContent = $input.val();
        $input.val('');
        if (!commentContent.trim()) return; // 빈칸 등록 방지
        var comment = {
          boardNo: boardNo,
          commentContent: commentContent,
          commentSecretYN: $secretBtn.prop("checked")? "y":"n",
        };
        function success(res){
          if (!res.success) {
            alert(res.message);
          } else {
            comment.commentDate = res.commentDate;
            comment.commentNo = res.commentNo;
            comment.writerName = `${loginMember.name}`;
            comment.writerNo = `${loginMember.memberNo}`;
            $add.after(createComment(comment));
          }
        }
        $.ajax({
          url: contextPath + '/boardComment/insertComment.do',
          method: 'post',
          data: comment,
          success: success
        })
      });
      function createComment(comment){
        var $comment = $(template); // template text를 jQuery 객체로
        $comment.attr('data-comment-no', comment.commentNo);
        var $cmtText = $comment.find('.cmt-text');
        $cmtText.html(comment.commentSecretYN == 'y'? '<font color="#FF0000">[비밀댓글]</font> ' + comment.commentContent : comment.commentContent);
        $comment.find('.cmt-nm').text(comment.writerName);
        $comment.find('.cmt-dt').text(comment.commentDate.split(' ')[0]);
        $comment.find('.cmt-up').show();
        $comment.find('.cmt-del').show();
        console.log("봐봐 -> " + comment.writerNo + " ::: " + ${loginMember.memberNo})
        if (comment.writerNo == ${loginMember.memberNo}) {
          $comment.find('.cmt-up').show();
          $comment.find('.cmt-del').show();
                            
                          } else {
                            $comment.find('.cmt-up').hide();
                            $comment.find('.cmt-del').hide();
                            
                          }     
        
        $comment.find('.cmt-up').click(function() {
          comment.commentContent = prompt('댓글 수정', $comment.commentContent);
          if(!comment.commentContent) return; // 수정 취소
          $.ajax({
            url: contextPath + '/boardComment/commentUpdate.do',
            method: 'post',
            data: comment,
            success: function(res){
              if(res.success){
                $cmtText.html(comment.commentSecretYN == 'y'? '<font color="#FF0000">[비밀댓글]</font> ' + comment.commentContent : comment.commentContent);
              }
            }
          });
        });
        $del = $comment.find('.cmt-del').click(function() {
          $.ajax({
            url: contextPath + '/boardComment/deleteComment.do',
            method: 'post',
            data: comment,
            success: function(res){
              if(res.success){
                content.removeChild($comment[0]);
              }
            }
          });
        });
        return $comment;
      }
    });
  });
</script>
<jsp:include page="/WEB-INF/views/homepage_introduce_interview_pass/common/footer.jsp"/>
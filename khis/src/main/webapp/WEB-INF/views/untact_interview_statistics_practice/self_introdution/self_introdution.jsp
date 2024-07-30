<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/self_introduction.css" />

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
 

<fmt:requestEncoding value="utf-8"/>
<style>
	#submit_link, #Extraction{
		opacity: 0.5;
	}
</style>
<div class="text-align-center margin-top-basic">
	<h2>이미지 저장</h2>
	<form
		name = "ExtractionAddFrm"
		action = "${pageContext.request.contextPath}/selfIntroduce/introduceExtraction.do"
		method = "post"
	>
		<table id = "imgAddTb">
			<tr>
				<td colspan = "2">
						<!-- 파일 추가-->
						1. <input type="file" id="file" class="btn-file" name="file"
						                   onchange="getfile();" style="display : none;">   
	                       <input type="button" id ="insteadBtn" name="insteadBtn" class="button-hover button-basic" value="이미지 선택" onclick="$('#file').trigger('click');"><input placeholder="파일선택" name="filebox" style="height: 30px;" readonly>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;진행률 : <progress value="0" id="uploader" max="100">0%</progress><br><br>
						<!-- firebase로 제출-->
						2. <button type="button" class="button-hover button-basic" id="submit_link" name="saveBtn"onclick="myfunction()" disabled>이미지 저장</button>						
						<br><br>
						3. <input type="button" name = "Extraction" id = "Extraction" class="button-hover button-basic" value="텍스트 추출하기" disabled/>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		<input type = "hidden" name="file_url" class="button-hover" style="display:none;"/>
	</form>
	<hr class="margin-top-basic">
	<div class="margin-top-basic">
	<h2>텍스트 추출</h2>
		<textarea id = "data_extraction" placeholder="이미지를 저장을 먼저 해주세요." readonly>
		</textarea>
	</div>
</div>
<script>
//firebase api

// firebase 초기화
firebase.initializeApp(firebaseConfig);

var selectedFile;

// 파일 가져오기
function getfile()
{
      var pic = document.getElementById("file");

       // selected file is that file which user chosen by html form
      selectedFile = pic.files[0];

       // 파일선택을 해서 파일을 업로드 하면 firebase에 저장하는 id='submit_link' 활성화
       let pic_name = pic.value.split("\\");

       $("[name=filebox]").val(pic_name[pic_name.length-1]);
      if($("[name=filebox]").val() == null || $("[name=filebox]").val() == ""){
	      document.getElementById('submit_link').setAttribute('disabled', 'true');    	  
	      document.getElementById('submit_link').style.opacity = "0.5";    	  
	      document.getElementById('Extraction').setAttribute('disabled', 'true');    	  
	      document.getElementById('Extraction').style.opacity = "0.5";    	  
      }else{
    	  document.getElementById('submit_link').removeAttribute('disabled');     	  
	      document.getElementById('submit_link').style.opacity = "1";    	  
      }
 }

// firebase에 저장하는 함수
  function myfunction()
  {
      // 시간을 통해 고유한 이름 만들기
      // Date.now() is function that give current timestamp
      var name="123"+Date.now();

      // images 폴더에 저장하기
      var storageRef = firebase.storage().ref('/pdf/'+ name);

      // firebase에 선택한 파일 넣기
      var uploadTask = storageRef.put(selectedFile);

      // 업로드 수치, 잘 되고 있는지 확인
      uploadTask.on('state_changed', function(snapshot){
        var progress = 
         (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          var uploader = document.getElementById('uploader');
          uploader.value=progress;
          switch (snapshot.state) {
            case firebase.storage.TaskState.PAUSED:
              console.log('Upload is paused');
              break;
            case firebase.storage.TaskState.RUNNING:
              console.log('Upload is running');
              break;
          }
      }, function(error) {console.log(error);
      }, function() {

           // 업로드한 url 반환
           uploadTask.snapshot.ref.getDownloadURL().then(
            function(downloadURL) {

           // 다운로드 된 url -> downloadURL 변수에 저장
            $("[name=file_url]").val(downloadURL);
            
           // 텍스트 추출 버튼 활성화
     	  document.getElementById('Extraction').removeAttribute('disabled');     	  
	      document.getElementById('Extraction').style.opacity = "1";   
        });
      });
  }
 $("[name=Extraction]").click(function(){
	 console.log($("[name=file_url]").val());
	 const  file_urls = $("[name=file_url]").val();
	  //ajax
	  $.ajax({
		  url : `${pageContext.request.contextPath}/selfIntroduce/introduceExtraction.do`,
		  type : 'POST',
		  data : {file_url : file_urls},
		  success(data){
			  console.log(data);
			  $("#data_extraction").append(data);
			  alert((data == 'null' || data == null || data == '') ? '데이터가 전송되지 않았습니다.\n파일 추출을 다시 진행해주세요.' : '데이터 추출에 성공했습니다.\n해당 값에서 원하는 정보를 복사하여(Ctrl + C) 사용해 주세요');
		  },
		  error : console.log
	  });
	  if( $("#data_extraction").text() == 'null' || $("#data_extraction").text() == null || $("#data_extraction").text() == ''){
		  alert('데이터가 전송되지 않았습니다.\n파일 추출을 다시 진행해주세요.');
		  $("#Extraction").css({
			  "background": "#1365e8",
			  "color" : "white"
		  });	  
	  }else{
		  $("#Extraction").css({
			  "background": "black",
			  "color" : "white"
		  });
	  }
 });
</script>
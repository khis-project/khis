<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/untact_interview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/untact_interview_statistics_practice/interview_practice.css" />
<script>
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>
</script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    function create2DArray(rows, columns) {
        var arr = new Array(rows);
        for (var i = 0; i < rows; i++) {
            arr[i] = new Array(columns);
        }
        return arr;
    }
      function statisticsKindFunc(){
    	  //해당 부분에 ajax 사용해서 누를때마다 해당 종류의 값들 가져와서 차트에 넣어주기.
    	  $.ajax({
				type : 'GET',
				url : n${pageContext.request.contextPath}/statistics/selectStatisticsKind.do',
				contentType : 'application/json; charset=UTF-8',
				traditional: true ,
				dataType : "json",
				data : {'satisticsKind' : $("[name=satisticsKind]").val()},
				success(datas){
					var arr = [];
					// 값을 가져오고 그 값을.........
					// data에 추가해야되는데 어떻게 추가하지...?
					// map으로 더해주기.
					var arrNumber = new Array(); //배열선언
					var booleans =$("[name=satisticsKind]").val()=="career"?"년":"대";
					$.map(datas,function(value,index){
						value.unshift(index+booleans);
						arrNumber = value;
						arr.push(arrNumber);
					});
					arr.unshift(['', '불합격','합격', '미지정']);
					if($("[name=satisticsKind]").val() == "career"){
				        var data = google.visualization.arrayToDataTable(arr);
				          var options = {
				            chart: {

				            }
				          };
	
				          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
				          chart.draw(data, google.charts.Bar.convertOptions(options));
				          google.charts.load('current', {'packages':['bar']});
					}else{
						
				        var data = google.visualization.arrayToDataTable(arr);

				          var options = {
				            chart: {

				            }
				          };

				          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

				          chart.draw(data, google.charts.Bar.convertOptions(options));
				          google.charts.load('current', {'packages':['bar']});
					}
				},
				error : console.log
			});   
      }
       google.charts.load('current', {'packages':['bar']});
       google.charts.setOnLoadCallback(drawChart);
       function drawChart() {
      } 
    </script>
    
<div class="text-align-center" id = "zoomSection">
<!-- 선택하는거에 따라서 나이별/경력별 나오게 하기 -->
	<select name="satisticsKind" onChange="statisticsKindFunc();">
		<option value="age">나이별</option>
		<option value="career">경력별</option>
	</select>
	<label>(소수점 셋째자리에서 반올림)</label>
	<div class="text-align-center margin-auto-basic" id="columnchart_material" style="width: 380px; height: 210px;"></div>
</div>
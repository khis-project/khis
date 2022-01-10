    function create2DArray(rows, columns) {
        var arr = new Array(rows);
        for (var i = 0; i < rows; i++) {
            arr[i] = new Array(columns);
        }
        return arr;
    }
      function statisticsKindFunc(){
			let a = "${pageContext.request.contextPath}";
			console.log(a);
			console.log($("[name=urlContextPath]").val() + "?");
			console.log($("[name=co_code]").val() + "?");
    	  //해당 부분에 ajax 사용해서 누를때마다 해당 종류의 값들 가져와서 차트에 넣어주기.
    	  $.ajax({
				type : 'GET',
				url : $("[name=urlContextPath]").val()+'/statistics/selectStatisticsKind.do',
				contentType : 'application/json; charset=UTF-8',
				traditional: true ,
				dataType : "json",
				data : {'satisticsKind' : $("[name=satisticsKind]").val(), 'co_code' : $("[name=co_code]").val()},
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

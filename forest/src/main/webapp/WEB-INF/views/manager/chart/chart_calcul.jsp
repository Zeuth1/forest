
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<!--  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Press+Start+2P"
	rel="stylesheet">
<!--  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
#container {
	width: 82.5%;
	height: auto;
	border: 3px solid white;
	margin-left: 12.5%;
	margin-top: -51%;
	border-radius: 10px;
	border: 1px solid gray;
}

#searchbar {
	margin-top: -20px;
}

#board_table {
	background: white;
}

#board_table th {
	text-align: center;
}

#addData tr:hover {
	background: snow;
}

#chart_div {
	width: 600px;
	height: 400px;
}

#barchartMale {
	display: inline-block;
}

#barchartFemale {
	display: inline-block;
}
.board_table th {
	text-align: center;
	background: gray;
	color: white;
}
#yearSelect{
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">사이트 매출 추이</h2>
		<hr>
		년도 선택:
		<select id=yearSelect onchange="drawChart()">
			<option value=2018>2018</option>
			<option value=2019>2019</option>				
		</select>
		<div id=linechart_material></div>
		<br>
		<table  class="table table-bordered board_table">
		<tr>
			<th width="25%">년/월</th>
			<th width="25%">후원액</th>
			<th width="25%">환급액</th>
			<th width="25%">수수료 및 세금</th>
		</tr>
		<tbody id="calTable"></tbody>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script type="text/javascript">

	 google.charts.load('current', {'packages':['line']});
	 google.charts.setOnLoadCallback(drawChart);
	
	 function drawChart() {
		 var data = new google.visualization.DataTable();
		 var year = $("#yearSelect").val();
		 console.log(year);
		
	      $.ajax({
		    	url:"a_calcul.man",
		    	data:{
		    		'onclick':'onclick',
		    		year:year
		    	},
		    	type:'post',
		    	dataType:'json',
		    	success:function(list){

					data.addColumn('string', '년/월');
					data.addColumn('number', '후원액');
					data.addColumn('number', '환급액');
					data.addColumn('number', '수수료 및 세금');
					
					data.addRows(12);
					
					calTable.innerHTML="";
					
					for(var i=0;i<list.length;i++){
						data.setCell(i,0,list[i].ym);
						data.setCell(i,1,list[i].amount);
						data.setCell(i,2,list[i].refund);
						data.setCell(i,3,list[i].tax);
					calTable.innerHTML+="<tr><td>"+list[i].ym+"</td>"+"<td>"+list[i].amount+"</td>"+"<td>"+list[i].refund+"</td>"+"<td>"+list[i].tax+"</td></tr>";
					}
					
		 		}
		    	
		    	
		      });

	      var options = {
	        chart: {
	          title: '사이트 매출통계',
	          subtitle: '단위 : 원'
	        },

	        height: 500,
	        axes: {
	          x: {
	            0: {side: 'top'}
	          }
	        }
	      };

	      var chart = new google.charts.Line(document.getElementById('linechart_material'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }

  </script>

</body>
</html>
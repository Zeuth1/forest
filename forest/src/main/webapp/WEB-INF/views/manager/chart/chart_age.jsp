
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
<style type="text/css">
#container {
	width: 82.5%;
	height: 100%;
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

body {
	background: #edf1f5;
}
</style>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>


		<hr>
		<div id="columnchart_values" style="width: 600px; height: 500px;"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script type="text/javascript">
		var agelist = [];
		
		var list10=[];
		var list20=[];
		var list30=[];
		var list40=[];
		var list50=[];
		var list60=[];
		$(document).ready(function() {
			$.ajax({
				url : "a_chartAgeNum.man",
				data : {
					onclick : "onclick"
				},
				type : 'post',
				dataType : "json",
				success : function(list) {
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						agelist[i] = list[i];
					}
				}
			});
			
			$.ajax({
				url : "a_chartAgeNum.man",
				data : {
					onclick : "onclick"
				},
				type : 'post',
				dataType : "json",
				success : function(list) {
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						agelist[i] = list[i];
					}
				}
			});
		});

		
		
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(drawStuff);

		function drawStuff() {
			var data = new google.visualization.arrayToDataTable([
					[ '연령대', '명' ], [ "10대", agelist[0] ],
					[ "20대", agelist[1] ], [ "30대", agelist[2] ],
					[ "40대", agelist[3] ], [ "50대", agelist[4] ],
					[ "60대 이상", agelist[5] ] ]);

			var options = {
				width : 800,
				legend : {
					position : 'none'
				},
				chart : {
					title : '연령별 회원가입수',
					subtitle : '단위:명'
				},
				axes : {
					x : {
						0 : {
							side : 'top',
							label : 'White to move'
						}
					// Top x-axis.
					}
				},
				bar : {
					groupWidth : "90%"
				}
			};

			var chart = new google.charts.Bar(document
					.getElementById('columnchart_values'));
			// Convert the Classic options to Material options.
			chart.draw(data, google.charts.Bar.convertOptions(options));
		};
	</script>
</body>
</html>
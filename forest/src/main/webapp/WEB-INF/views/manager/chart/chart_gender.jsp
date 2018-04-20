
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

#barchartMale {
	display: inline-block;
}

#barchartFemale {
	display: inline-block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>


		<hr>
		<div id="donutchart" style="width: 900px; height: 500px;"></div>
		<div id="barchartMale" style="width: 600px; height: 400px;"></div>
		<div id="barchartFemale" style="width: 600px; height: 400px;"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		var male = 0;
		var female = 0;
		var malelist;
		var femalelist;

		$(document).ready(function() {
			$.ajax({
				url : "a_chartGenderNum.man",
				dataType : "json",
				type : 'post',
				data : {
					onclick : "onclick"
				},
				success : function(list) {
					console.log("success");
					male = list[0];
					female = list[1];

				},
				complete : function() {
					console.log(male + " " + female);
				}
			});

			$.ajax({
				url : "a_chartGenderByTop3Male.man",
				dataType : "json",
				type : 'post',
				data : {
					onclick : "onclick"
				},
				success : function(list) {
					console.log("success");
					console.log(list);
					malelist = list
				}
			});
			$.ajax({
				url : "a_chartGenderByTop3Female.man",
				dataType : "json",
				type : 'post',
				data : {
					onclick : "onclick"
				},
				success : function(list) {
					console.log("success");
					console.log(list);
					femalelist = list
				}
			});
		});
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {

			var data1 = google.visualization.arrayToDataTable([ [ '성별', '숫자' ],
					[ '남', male ], [ '여', female ] ]);

			var options1 = {
				title : '회원 남녀성비 조회',
				pieHole : 0.4,
			};
			//
			var data2 = google.visualization.arrayToDataTable([
					[ '순위', '금액', {
						role : 'annotation'
					}, {
						role : 'style'
					} ],
					[ '1위', malelist[0].rankAmuont, malelist[0].rankName,
							'royalblue' ],
					[ '2위', malelist[1].rankAmuont, malelist[1].rankName,
							'royalblue' ],
					[ '3위', malelist[2].rankAmuont, malelist[2].rankName,
							'royalblue' ] ]);
			var options2 = {
				title : '남성 작가 매출순위 TOP3',
			};

			var data3 = google.visualization.arrayToDataTable([
					[ '순위', '금액', {
						role : 'annotation'
					}, {
						role : 'style'
					} ],
					[ '1위', femalelist[0].rankAmuont, femalelist[0].rankName,
							'crimson' ],
					[ '2위', femalelist[1].rankAmuont, femalelist[1].rankName,
							'crimson' ],
					[ '3위', femalelist[2].rankAmuont, femalelist[2].rankName,
							'crimson' ] ]);
			var options3 = {
				title : '여성 작가 매출순위 TOP3',
			};

			var chart1 = new google.visualization.PieChart(document
					.getElementById('donutchart'));
			chart1.draw(data1, options1);
			var chart2 = new google.visualization.BarChart(document
					.getElementById('barchartMale'))
			chart2.draw(data2, options2);
			var chart3 = new google.visualization.BarChart(document
					.getElementById('barchartFemale'))
			chart3.draw(data3, options3);
		}
	</script>

</body>
</html>
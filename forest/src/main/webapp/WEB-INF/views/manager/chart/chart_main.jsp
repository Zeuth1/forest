
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
		<div id="chart_div"></div>
		<div id="linechart_material"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script type="text/javascript">
		// Load the Visualization API and the corechart package.
		google.charts.load('current', {
			'packages' : [ 'corechart','line' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart2);

		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {

			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', '성별');
			data.addColumn('number', '비율');
			data.addRows([ [ '남자', 150 ], [ '여자', 110 ] ]);

			// Set chart options
			var options = {
				'title' : '남녀 가입비율',
				'width' : 600,
				'height' : 400
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}

		function drawChart2() {
			var data = new google.visualization.DataTable();
			data.addColumn('number', 'Day');
			data.addColumn('number', 'Guardians of the Galaxy');
			data.addColumn('number', 'The Avengers');
			data.addColumn('number', 'Transformers: Age of Extinction');

			data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
					[ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
					[ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
					[ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
					[ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
					[ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
					[ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

			var options = {
				chart : {
					title : 'Box Office Earnings in First Two Weeks of Opening',
					subtitle : 'in millions of dollars (USD)'
				},
				width : 900,
				height : 500
			};

			var chart = new google.charts.Line(document.getElementById('linechart_material'));

			chart.draw(data, google.charts.Line.convertOptions(options));
		}
	</script>
</body>
</html>
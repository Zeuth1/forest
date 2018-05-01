
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
		<h2 align="center">연령별 작가매출순위 -</h2>
		<hr>


		<hr>
		<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['작가', '매출액'],
        ['2014', 1000],
        ['2015', 1170],
        ['2016', 660],
        ['2017', 1030]
      ]);

      var options = {
        chart: {
          title: 'Company Performance',
          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        }
      };

      var chart = new google.charts.Bar(document.getElementById('columnchart_values'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
  </script>

</body>
</html>

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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<!--  -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	background: gray;
	color: white;
}

#addData tr:hover {
	background: snow;
}

#divbox {
	border: 1px solid gray;
	display: inline-block;
	vertical-align: top;
	width: 30%;
	font-family: 'Do Hyeon', sans-serif;
	color:white;
	padding: 10px;
	margin-top: 10px;
	background: black;
	border-radius: 10px;
	font-size:20px;
}

#subbox {
	width:90%;
	height:50%;
	padding: 10px;
	float: right;
	color:black;
	background: white;
	
}
.functionbox{
display: inline-block;
float: right;
}
</style>
</head>

<body>

	<jsp:include page="admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>


		<hr>
		<div>
			<div id=divbox >
				회원 중점관리
				<div id=subbox>오늘의 회원가입자 <div class=functionbox>명</div></div>
				<div id=subbox>신고 미처리 <div class=functionbox>건</div></div>
				<div id=subbox>전체 회원가입자 <div class=functionbox>명</div></div>
			</div>
			<div id=divbox>
				환급/후원 중점관리
				<div id=subbox>오늘의 후원 <div class=functionbox>건</div></div>
				<div id=subbox>오늘의 환급 <div class=functionbox>건</div></div>
				<div id=subbox>환급 미처리 <div class=functionbox>건</div></div>
			</div>
			<div id=divbox>
				통계보기
				<div id=subbox>성별 <div class=functionbox>▶</div></div>
				<div id=subbox>작가별 <div class=functionbox>▶</div></div>
				<div id=subbox>연령별 <div class=functionbox>▶</div></div>
			</div>
		</div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		
	</script>

</body>
</html>
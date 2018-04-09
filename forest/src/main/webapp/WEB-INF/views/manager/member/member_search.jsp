
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>
		<button onclick="memberSerchAll()">전체회원조회</button>
		<hr>
		<table id=board_table class="table table-bordered">
			<tr>
				<!-- <th>삽입부분 -->
				<th>USER_NO</th>
				<th>USER_ID</th>
				<th>USER_PWD</th>
				<th>BIRTHDAY</th>
				<th>GENDER</th>
				<th>PHONE</th>
				<th>EMAIL</th>
				<th>STATUS</th>
				<th>USER_LEVEL</th>
				<th>ENROLL_DATE</th>
			</tr>
			<!-- 테이블 줄 데이터 추가 부분 -->
			<tbody id=addData>
			</tbody>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		function memberSerchAll() {
			var onclick="check";
			$.ajax({
				uri:"a_memberSerchAll.man",
				type:"get",
				data:{
					onclick:onclick
				},
				success:function(data){
					
				}
			});
		}
	</script>

</body>
</html>
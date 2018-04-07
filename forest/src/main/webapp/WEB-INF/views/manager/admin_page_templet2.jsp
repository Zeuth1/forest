
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/contain.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE - </h2>
		<hr>


		<hr>
		<table id=board_table class="table table-bordered">
			<tr>
				<!-- <th>삽입부분 -->
				<th>데이터 드가야됨</th>
			</tr>
			<!-- 테이블 줄 데이터 추가 부분 -->
			<tbody id=addData>
			</tbody>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		
	</script>

</body>
</html>
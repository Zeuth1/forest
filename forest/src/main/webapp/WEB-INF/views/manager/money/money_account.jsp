
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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>
		<button onclick="pageAccountAll();">전체계좌조회</button>
		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="username">예금주</option>
				<option value="birth">생년월일/사업자</option>
			</select> <input type="text" id=searchval>
			<button onclick="SearchPage()">검색</button>
		</div>

		<hr>
		<table id=board_table class="table table-bordered">
			<thead>
				<!-- <th>삽입부분 -->
				<tr>
					<th>ROWNUM</th>
					<th>USER_NAME</th>
					<th>BANK_NO</th>
					<th>ACCOUNT_NO</th>
					<th>ACCOUNT_INFO</th>
				</tr>
			</thead>
			<!-- 테이블 줄 데이터 추가 부분 -->
			<tbody id=addData>

			</tbody>
		</table>
		<div id=pageset align="center"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		function pageAccountAll() {
			var page = 0;
			$
					.ajax({
						url : "a_CountAccount.man",
						data : {
							onclick : "onclick",
							page : page
						},
						dataType : "json",
						type : 'post',
						success : function(list) {
							console.log(list);
							page = list;
							pageset.innerHTML = "";
							for (var i = 0; i < page; i++) {
								pageset.innerHTML += "<button onclick='SelectAccountAll(\""
										+ (i + 1)
										+ "\");'>"
										+ (i + 1)
										+ "</button> ";
							}
						}

					});
			SelectAccountAll(1);
		}
		function SelectAccountAll(page) {
			$.ajax({
				url : "a_AccountSearchAll.man",
				data : {
					onclick : "onclick",
					page : page
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						addData.innerHTML += "<tr><td>" + list[i].rownum
								+ "</td><td>" + list[i].user_name + "</td><td>"
								+ list[i].bank_no + "</td><td>"
								+ list[i].account_no + "</td><td>"
								+ list[i].account_info;
					}
				}
			});
		}
		function SearchPage() {
			var searchcon = $("#searchcon").val();
			var searchval = $("#searchval").val();
			console.log(searchcon+searchval)
			$.ajax({
				url : "a_AccountSearch.man",
				data : {
					onclick : "onclick",
					searchcon : searchcon,
					searchval : searchval

				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						addData.innerHTML += "<tr><td>" + list[i].rownum
								+ "</td><td>" + list[i].user_name + "</td><td>"
								+ list[i].bank_no + "</td><td>"
								+ list[i].account_no + "</td><td>"
								+ list[i].account_info;
					}
				}
			});
		}
	</script>

</body>
</html>
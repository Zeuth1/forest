
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
	background: gray;
	color: white;
}

#addData tr:hover {
	background: snow;
}

body {
	background: #edf1f5;
}

.readonly {
	background: gray;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">신고조회/제재</h2>
		<hr>
		<button onclick="pageReportStatusNoAll()">전체미처리조회</button>
		<button onclick="pageReportStatusYesAll()">전체처리조회</button>
		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="id">아이디</option>
				<option value="reason">신고사유</option>
			</select> <input type="text" id=searchval>
			<button onclick="pageReportSearch()">검색</button>
		</div>
		<hr>
		<table id=board_table class="table table-bordered">
			<thead>
				<!-- <th>삽입부분 -->
				<tr>
					<th>BAN_NO</th>
					<th>USER_NO</th>
					<th>TREE_NO</th>
					<th>BAN_REASON</th>
					<th>BAN_RESULT</th>
					<th>STATUS</th>
					<th>ACTION</th>
					<th>BAN_DATE</th>
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
		function pageReportStatusNoAll() {
			$
					.ajax({
						url : "a_memberReportStatusNoAllcount.man",
						data : {
							onclick : "onclick"
						},
						dataType : 'json',
						type : 'post',
						success : function(list) {
							console.log(list);
							pageset.innerHTML = "";
							for (var i = 0; i < list; i++) {
								pageset.innerHTML += "<button onclick='ReportStatusNoAll(\""
										+ (i + 1)
										+ "\");'>"
										+ (i + 1)
										+ "</button> ";
							}
							ReportStatusNoAll(1);
						}

					});
		}

		function ReportStatusNoAll(page) {

			$.ajax({
				url : "a_memberReportStatusNoAll.man",
				data : {
					page : page
				},
				dataType : 'json',
				type : 'post',
				success : function(list) {

					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						var judgelist = "<td>" 
								+ "&nbsp&nbsp<button onclick='judgeMember(\""
								+ list[i].user_id + "\",\""
								+ "warning" + "\");'>경고</button>"
								+ "&nbsp&nbsp<button onclick='judgeMember(\""
								+ list[i].user_id + "\",\""
								+ "out" + "\");'>탈퇴</button>"
								+ "</td>"
						addData.innerHTML += "<tr>" + "<td>" + list[i].ban_no
								+ "</td>" + "<td>" + list[i].user_id + "</td>"
								+ "<td>" + list[i].tree_no + "</td>"
								+ "<td>" + list[i].ban_reason + "</td>" + "<td>"
								+ list[i].ban_result + "</td>" + "<td>"
								+ list[i].status + "</td>" + judgelist+ "<td>"
								+ list[i].ban_date + "</td>"
								+ "</tr>";
					}

				}

			});

		}
		function judgeMember(userId,judge) {
			console.log(userId+judge);
			$.ajax({
				url : "a_judgeMember.man",
				data : {
					userId : userId
					,judge:judge
				},
				dataType : 'json',
				type : 'post',
				success : function(list) {
					console.log(list);
				}
			});
		}

		function pageReportStatusYesAll() {
			$
					.ajax({
						url : "a_memberReportStatusYesAllcount.man",
						data : {
							onclick : "onclick",

						},
						dataType : 'json',
						type : 'post',
						success : function(list) {
							console.log(list);
							pageset.innerHTML = "";
							for (var i = 0; i < list; i++) {
								pageset.innerHTML += "<button onclick='ReportStatusYesAll(\""
										+ (i + 1)
										+ "\");'>"
										+ (i + 1)
										+ "</button> ";
							}
							ReportStatusYesAll(1);
						}

					});
		}

		function ReportStatusYesAll(page) {
			$.ajax({
				url : "a_memberReportStatusYesAll.man",
				data : {
					page : page
				},
				dataType : 'json',
				type : 'post',
				success : function(list) {
					
					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						addData.innerHTML += "<tr>" + "<td>" + list[i].ban_no
								+ "</td>" + "<td>" + list[i].user_id + "</td>"
								+ "<td>" + list[i].tree_no + "</td>"
								+ "<td>" + list[i].ban_reason + "</td>" + "<td>"
								+ list[i].ban_result + "</td>" + "<td>"
								+ list[i].status + "</td>" + "<td>"
								+ "처리되었습니다." + "</td>"+ "<td>"
								+ list[i].ban_date + "</td>";
					}

				}

			});
		}

		function pageReportSearch() {
			var searchcon = $("#searchcon").val();
			var searchval = $("#searchval").val();
			console.log(searchcon + searchval);
			$
					.ajax({
						url : "a_memberReportSearchCount.man",
						data : {
							onclick : "onclick",
							searchcon : searchcon,
							searchval : searchval
						},
						dataType : 'json',
						type : 'post',
						success : function(list) {
							console.log(list);
							pageset.innerHTML = "";
							for (var i = 0; i < list; i++) {
								pageset.innerHTML += "<button onclick='ReportSearch(\""
										+ (i + 1)
										+ "\",\""
										+ searchcon
										+ "\",\""
										+ searchval
										+ "\");'>"
										+ (i + 1) + "</button> ";
							}
							ReportSearch(1, searchcon, searchval);
						}

					});
		}

		function ReportSearch(page, searchcon, searchval) {
			console.log(searchcon + searchval);
			$.ajax({
				url : "a_memberReportSearch.man",
				data : {
					onclick : "onclick",
					searchcon : searchcon,
					searchval : searchval,
					page : page
				},
				dataType : 'json',
				type : 'post',
				success : function(list) {

					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						if (list[i].status == "N") {
							var judgelist = "<td>" 
								+ "&nbsp&nbsp<button onclick='judgeMember(\""
								+ list[i].user_id + "\",\""
								+ "warning" + "\");'>경고</button>"
								+ "&nbsp&nbsp<button onclick='judgeMember(\""
								+ list[i].user_id + "\",\""
								+ "out" + "\");'>탈퇴</button>"
								+ "</td>"
							addData.innerHTML += "<tr>" + "<td>" + list[i].ban_no
							+ "</td>" + "<td>" + list[i].user_id + "</td>"
							+ "<td>" + list[i].tree_no + "</td>" + "<td>"
							+ list[i].ban_reason + "</td>" + "<td>"
							+ list[i].ban_result + "</td>" + "<td>"
							+ list[i].status + "</td>" + judgelist + "<td>"
							+ list[i].ban_date + "</td>"+"</tr>";
						} else {
							addData.innerHTML += "<tr>" + "<td>"
									+ list[i].ban_no + "</td>" + "<td>"
									+ list[i].user_id + "</td>" + "<td>"
									+ list[i].tree_no + "</td>" + "<td>"
									+ list[i].ban_reason + "</td>" + "<td>"
									+ list[i].ban_result + "</td>" + "<td>"
									+ list[i].status + "</td>"+ "<td>"
									+ list[i].ban_date + "</td>";
						}
					}

				}

			});
		}
	</script>

</body>
</html>
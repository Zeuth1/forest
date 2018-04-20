
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>
		<button onclick="memberSerchAll();">전체회원조회</button>
		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="gender">성별</option>
			</select> <input type="text" id=searchval>
			<button onclick="memberSearchOne();">검색</button>
		</div>
		<hr>
		<table id=board_table class="table table-bordered">
			<thead>
				<!-- <th>삽입부분 -->
				<tr>
					<th>USER_NO</th>
					<th>USER_ID</th>
					<th>USER_PWD</th>
					<th>USER_NAME</th>
					<th>BIRTHDAY</th>
					<th>GENDER</th>
					<th>PHONE</th>
					<th>EMAIL</th>
					<th>STATUS</th>
					<th>USER_LEVEL</th>
					<th>ENROLL_DATE</th>
					<th>수정하기</th>
				</tr>

			</thead>
			<!-- 테이블 줄 데이터 추가 부분 -->
			<tbody id=addData>

			</tbody>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		function memberSerchAll() {
			var tbody = document.getElementById("addData");
			$.ajax({
				url : "a_memberSerchAll.man",
				data : {
					"onclick" : "onclick"
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log("success");
					tbody.innerHTML = ""
					for (var i = 0; i < list.length; i++) {
						console.log(list[i]);
						tbody.innerHTML += "<tr><td>" + list[i].mNo + "</td>"
								+ "<td>" + list[i].mId + "</td>" + "<td>"
								+ list[i].mPwd + "</td>" + "<td>"
								+ list[i].mName + "</td>" + "<td>"
								+ list[i].mBirth + "</td>" + "<td>"
								+ list[i].mGender + "</td>" + "<td>"
								+ list[i].mPhone + "</td>" + "<td>"
								+ list[i].mEmail + "</td>" + "<td>"
								+ list[i].mStatus + "</td>" + "<td>"
								+ list[i].mLevel + "</td>" + "<td>"
								+ list[i].mEnrollDate + "</td>" + "<td>"
								+ "<button onclick='gotoupdate(\""
								+ list[i].mNo + "\");'>수정하기</button> "
								+ "</td>" + "</tr>";
					}

				}
			});
		}

		function memberSearchOne() {
			var tbody = document.getElementById("addData");
			var searchval = $("#searchval").val();
			var searchcon = $("#searchcon").val();
			var data = [ searchval, searchcon ];
			$.ajax({
				url : "a_memberSerchOne.man",
				data : {
					"searchval" : searchval,
					"searchcon" : searchcon
				},
				type : 'post',
				dataType : "json",
				success : function(list) {
					console.log("success");
					tbody.innerHTML = ""
					for (var i = 0; i < list.length; i++) {
						console.log(list[i]);
						tbody.innerHTML += "<tr><td>" + list[i].mNo + "</td>"
								+ "<td>" + list[i].mId + "</td>" + "<td>"
								+ list[i].mPwd + "</td>" + "<td>"
								+ list[i].mName + "</td>" + "<td>"
								+ list[i].mBirth + "</td>" + "<td>"
								+ list[i].mGender + "</td>" + "<td>"
								+ list[i].mPhone + "</td>" + "<td>"
								+ list[i].mEmail + "</td>" + "<td>"
								+ list[i].mStatus + "</td>" + "<td>"
								+ list[i].mLevel + "</td>" + "<td>"
								+ list[i].mEnrollDate + "</td>" + "<td>"
								+ "<button onclick='gotoupdate(\""
								+ list[i].mId + "\");'>수정하기</button> "
								+ "</td>" + "</tr>";
					}

				}
			});
		}

		function gotoupdate(mId) {
			console.log(mId);
			location.href="a_memberUpdateView.man?mId="+mId;
		}
	</script>

</body>
</html>
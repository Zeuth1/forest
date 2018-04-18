
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int mId = (Integer) request.getAttribute("mId");
%>
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
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>


		<hr>
		<table id=board_table class="table table-bordered">
			<tr>
				<th>USER_NO</th>
				<td><input type="text" id=mNo class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>USER_ID</th>
				<td><input type="text" id=mId class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>USER_PWD</th>
				<td><input type="password" id=mPwd class="form-control"></td>
			</tr>
			<tr>
				<th>BIRTHDAY</th>
				<td><input type="text" id=mBirth class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td><input type="text" id=mGender class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" id=mPhone class="form-control"></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" id=mEmail class="form-control"></td>
			</tr>
			<tr>
				<th>STATUS</th>
				<td><input type="text" id=mStatus class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>USER_LEVEL</th>
				<td><input type="text" id=mLevel class="form-control"></td>
			</tr>
			<tr>
				<th>ENROLL_DATE</th>
				<td><input type="text" id=mEnrollDate
					class="readonly form-control" readonly="readonly"></td>
			</tr>
			<tr>
				<th>NICK_NAME</th>
				<td><input type="text" id=mNickName class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><button onclick="memberUpdate()" class="btn">수정하기</button>
					<button onclick="location.reload()" class="btn">다시하기</button></td>

			</tr>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		$(document).ready(function() {
			$.ajax({
				url : "a_memberSerchOne.man",
				data : {
					"searchval" :
	<%=mId%>
		,
					"searchcon" : "id"
				},
				type : 'post',
				dataType : "json",
				success : function(list) {
					console.log(list);
					$("#mNo").val(list[0].mNo);
					$("#mId").val(list[0].mId);
					$("#mPwd").val(list[0].mPwd);
					$("#mName").val(list[0].mName);
					$("#mBirth").val(list[0].mBirth);
					$("#mGender").val(list[0].mGender);
					$("#mPhone").val(list[0].mPhone);
					$("#mEmail").val(list[0].mEmail);
					$("#mStatus").val(list[0].mStatus);
					$("#mLevel").val(list[0].mLevel);
					$("#mEnrollDate").val(list[0].mEnrollDate);
					$("#mNickName").val(list[0].mNickName);

				}
			});
		}

		);

		function memberUpdate() {
			$.ajax({
				url : "a_memberUpdate.man",
				data : {
					mNo:$("#mNo").val(),
					mPwd : $("#mPwd").val(),
					mPhone : $("#mPhone").val(),
					mEmail : $("#mEmail").val(),
					mLevel : $("#mLevel").val(),
					mNickName : $("#mNickName").val()
				},
				type : 'post',
				dataType : "json",
				success : function(list) {

				}
			});
		}
	</script>

</body>
</html>
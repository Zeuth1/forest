
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
	height: auto;
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
.th25p{
	width: 25%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">회원상세정보</h2>
		<hr>


		<hr>
		<table id=board_table class="table table-bordered">
			<tr>
				<th colspan="2">회원 기본정보</th>
			</tr>
			<tr>
				<th class="th25p">USER_NO</th>
				<td><input type="text" id=mNo class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">USER_ID</th>
				<td><input type="text" id=mId class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">USER_NAME</th>
				<td><input type="text" id=mName class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">BIRTHDAY</th>
				<td><input type="text" id=mBirth class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">GENDER</th>
				<td><input type="text" id=mGender class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">PHONE</th>
				<td><input type="text" id=mPhone class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">EMAIL</th>
				<td><input type="text" id=mEmail class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">STATUS</th>
				<td><input type="text" id=mStatus class="readonly form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">USER_LEVEL</th>
				<td><input type="text" id=mLevel class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">ENROLL_DATE</th>
				<td><input type="text" id=mEnrollDate
					class="readonly form-control" readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">NICK_NAME</th>
				<td><input type="text" id=mNickName class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th class="th25p">SOCIAL_ID</th>
				<td><input type="text" id=mSocialId class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr id=action1>
				<th>ACTION</th>
				<td><button onclick='memberReturnRetire()'>탈퇴/복구</button></td>
			</tr>
		</table>
		<table id=board_table class="table table-bordered">
			<tr>
				<th colspan="5">회원 제재정보</th>
			</tr>
			<tr>
				<th class="th25p" >BAN_NO</th>
				<th class="th25p" >TREE_NO</th>
				<th class="th25p" >BAN_REASON</th>
				<th class="th25p" >BAN_RESULT</th>
			</tr>
			<tbody id=addData>

			</tbody>
		</table>

		<table id=board_table class="table table-bordered">
			<tr>
				<th colspan="5">회원 후원정보</th>
			</tr>
			<tr>
				<th>GIVE_COUNT</th>
				<td id=donate1 class="th25p" align="right"></td>
				<th>TAKE_COUNT</th>
				<td id=donate2 class="th25p"  align="right"></td>
			</tr>
			<tr>
				<th>DONATE_AMOUNT</th>
				<td id=donate3 class="th25p"  align="right"></td>
				<th>DONATE_AMOUNT</th>
				<td id=donate4 class="th25p"  align="right"></td>
			</tr>
		</table>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		$(document).ready(function() {
			$.ajax({
				url : "a_memberSerchOne.man",
				data : {
					"searchval" :<%=mId%>,
					"searchcon" : "id"
				},
				type : 'post',
				dataType : "json",
				success : function(list) {
					console.log(list);
					$("#mNo").val(list[0].mNo);
					$("#mId").val(list[0].mId);
					$("#mName").val(list[0].mName);
					$("#mBirth").val(list[0].mBirth);
					if (list[0].mGender == "M") {
						$("#mGender").val("남자");
					} else {
						$("#mGender").val("여자");
					}
					$("#mPhone").val(list[0].mPhone);
					$("#mEmail").val(list[0].mEmail);
					if (list[0].mStatus == "N") {
						$("#mStatus").val("탈퇴");
					} else {
						$("#mStatus").val("활성");
					}
					$("#mLevel").val(list[0].mLevel);
					$("#mEnrollDate").val(list[0].mEnrollDate);
					$("#mNickName").val(list[0].mNickName);
					$("#mSocialId").val(list[0].mSocialId);
					memberReportStatus();
					memberDonateStatus(list[0].mName);
				}
			});

		}

		);
		function memberReportStatus() {
			var addData1 = document.getElementById("addData1");
			$.ajax({
				url : "a_memberReportAll.man",
				data : {
					searchval : <%=mId%>
				},
				type : 'post',
				dataType : 'json',
				success : function(list) {
					console.log(list.length);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						addData.innerHTML += "<tr>" + "<td>" + list[i].ban_no
								+ "</td>" + "<td>" + list[i].tree_no + "</td>"
								+ "<td>" + list[i].ban_reason + "</td>"
								+ "<td>" + list[i].ban_result + "</td>"
								+ "</tr>";

					}
				}
			});
		}

		function memberDonateStatus(name) {
			$.ajax({
				url : "a_donateSearchIDAll.man",
				data : {
					"searchval" : name
				},
				type : 'post',
				dataType : 'json',
				success : function(list) {
					console.log(list);
					donate1.innerHTML = list[0]+"건";
					donate2.innerHTML = list[2]+"건";
					donate3.innerHTML = list[1]+"원";
					donate4.innerHTML = list[3]+"원";

				}
			});
		}
		function memberReturnRetire(){
			$.ajax({
				url : "a_memberReturnRetire.man",
				data : {
					"searchval" : <%=mId%>
				},
				type : 'post',
				dataType : 'json',
				success : function(list) {
					console.log(list,mStatus.value);
					if(mStatus.value=="Y"){
						alert("탈퇴완료");
						location.reload();
					}
					else{
						alert("복구완료");
						location.reload();
					}
				}
			});
		}
		
	</script>

</body>
</html>
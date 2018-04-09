<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  -->
<<<<<<< HEAD
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/sidebar.css" />
=======
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

#sidebar {
	width: 10%;
	height: 100%;
	display: inline-block;
	background: SteelBlue;
	color: white;
	font-weight: bold;
}

#sidebar a {
	color: white
}

#divbutton {
	cursor: pointer;
	border-bottom: 1px solid;
}

#divlist {
	margin-left: 5px;
	display: none;
}

#divlist div:hover {
	background: LightBlue;
	color: white;
	margin-left: 1%;
}
#tie{
	background: teal;
}
</style>
>>>>>>> Junghoon
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id=sidebar>
		<div id=title align="center">
<<<<<<< HEAD
			<h3>ADMIN PAGE</h3>
		</div>

		<div id=divbutton>
			<hr>
			<h4>회원관리</h4>
=======
			<br>
			<h3>ADMIN PAGE</h3>
			<br>
		</div>
		<div>
			<img src=""> <br> 님이 접속하셨습니다.
			<hr>
		</div>
		<!--  -->
		<div id=divbutton>
			<h4>&nbsp;회원관리 ▼</h4>
>>>>>>> Junghoon
			<hr>
			<div id=divlist>
				<div>
					<h5>
<<<<<<< HEAD
						<a href="<%=request.getContextPath()%>/member/member_search.jsp">[정보조회]</a>
					</h5>
=======
						<a href="a_memberSearchView.ad">[정보조회]</a>
					</h5>
				<div id="tie">
				</div>	
>>>>>>> Junghoon
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/member/member_report.jsp">[신고조회]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/member/member_judge.jsp">[제재조회]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/member/member_QR.jsp">[탈퇴/복구]</a>
					</h5>
				</div>
			</div>
<<<<<<< HEAD

		</div>


		<div id=divbutton>
			<hr>
			<h4>결제관리</h4>
=======
		</div>

		<!--  -->
		<div id=divbutton>
			<h4>&nbsp;게시판관리 ▼</h4>
>>>>>>> Junghoon
			<hr>
			<div id=divlist>
				<div>
					<h5>
<<<<<<< HEAD
						<a href="<%=request.getContextPath()%>/money/money_donation.jsp">[후원내역조회]</a>
=======
						<a href="a_moneyDonationView.ad">[후원내역조회]</a>
>>>>>>> Junghoon
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_return.jsp">[환급신청내역조회]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_account.jsp">[계좌인증조회]</a>
					</h5>
				</div>
			</div>
		</div>
<<<<<<< HEAD
		<div id=divbutton>
			<hr>
			<h4>통계관리</h4>
=======

		<!--  -->
		<div id=divbutton>
			<h4>&nbsp;결제관리 ▼</h4>
			<hr>
			<div id=divlist>
				<div>
					<h5>
						<a href="a_moneyDonation.ad">[후원내역조회]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_return.jsp">[환급신청내역조회]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_account.jsp">[계좌인증조회]</a>
					</h5>
				</div>
			</div>
		</div>

		<!--  -->
		<div id=divbutton>
			<h4>&nbsp;통계관리 ▼</h4>
>>>>>>> Junghoon
			<hr>
			<div id=divlist>
				<div>
					<h5>
<<<<<<< HEAD
=======
						<a href="a_chartMainView.ad">[요약]</a>
					</h5>
				</div>
				<div>
					<h5>
>>>>>>> Junghoon
						<a href="<%=request.getContextPath()%>/money/money_donation.jsp">[연령별]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_return.jsp">[작가별]</a>
					</h5>
				</div>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_account.jsp">[성별]</a>
					</h5>
				</div>
			</div>
		</div>
<<<<<<< HEAD
=======

>>>>>>> Junghoon
	</div>
	<script type="text/javascript">
		$("#divbutton ").click(function() {
			$(this).children("#divlist").css({
				"display" : "block"
			});
		});
		$("#divlist ").mouseleave(function() {
			$(this).css({
				"display" : "none"
			});
		});
	</script>

</body>
</html>
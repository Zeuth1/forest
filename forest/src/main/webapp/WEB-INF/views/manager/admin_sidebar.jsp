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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/sidebar.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id=sidebar>
		<div id=title align="center">
			<h3>ADMIN PAGE</h3>
		</div>

		<div id=divbutton>
			<hr>
			<h4>회원관리</h4>
			<hr>
			<div id=divlist>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/member/member_search.jsp">[정보조회]</a>
					</h5>
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

		</div>


		<div id=divbutton>
			<hr>
			<h4>결제관리</h4>
			<hr>
			<div id=divlist>
				<div>
					<h5>
						<a href="<%=request.getContextPath()%>/money/money_donation.jsp">[후원내역조회]</a>
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
		<div id=divbutton>
			<hr>
			<h4>통계관리</h4>
			<hr>
			<div id=divlist>
				<div>
					<h5>
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
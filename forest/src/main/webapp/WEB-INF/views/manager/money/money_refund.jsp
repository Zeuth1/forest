
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
		<button onclick="pageNotRefundAll();">전체미환급조회</button>
		<button onclick="pageRefundAll();">전체환급조회</button>

		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="username">신청자</option>
			</select> <input type="text" id=searchval>
			<button onclick="pageSearchRefund();">검색</button>
		</div>

		<hr>
		<table id=board_table class="table table-bordered">
			<thead>
				<!-- <th>삽입부분 -->
				<tr>
					<th>ROWNUM</th>
					<th>USER_NAME</th>
					<th>REFUND_AMOUNT</th>
					<th>REFUND_TAX</th>
					<th>STATUS</th>
					<th>ACTION</th>
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
		$(function() {

			var IMP = window.IMP; // 생략가능
			IMP.init('imp33916581'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		});

		function pageNotRefundAll() {
			var page = 0;
			$
					.ajax({
						url : "a_CountNotRefund.man",
						data : {
							page : page
						},
						dataType : "json",
						type : 'post',
						success : function(list) {
							console.log(list);
							page = list;
							pageset.innerHTML = "";
							for (var i = 0; i < page; i++) {
								pageset.innerHTML += "<button onclick='SearchNotRefundAll(\""
										+ (i + 1)
										+ "\");'>"
										+ (i + 1)
										+ "</button> ";
							}
							SearchNotRefundAll(1);
						}
					})

		}

		function SearchNotRefundAll(page) {
			$.ajax({
				url : "a_SearchNotRefundAll.man",
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

						addData.innerHTML += "<tr>" + "<td>" + list[i].rownum
								+ "</td>" + "<td>" + list[i].user_name
								+ "</td>" + "<td>" + list[i].refund_amount
								+ "</td>" + "<td>" + list[i].refund_tax
								+ "</td>" + "<td>" + list[i].status + "</td>"
								+ "<td>" + "<button onclick='payment(\""
								+ list[i].refund_amount + "\",\""
								+ list[i].rownum + "\");'>환급하기</button>"
								+ "</td></tr>";

					}
				}
			})
		}

		function pageRefundAll() {
			var page = 0;
			$
					.ajax({
						url : "a_CountRefund.man",
						data : {
							page : page
						},
						dataType : "json",
						type : 'post',
						success : function(list) {
							console.log(list);
							page = list;
							pageset.innerHTML = "";
							for (var i = 0; i < page; i++) {
								pageset.innerHTML += "<button onclick='SearchRefundAll(\""
										+ (i + 1)
										+ "\");'>"
										+ (i + 1)
										+ "</button> ";
							}
							SearchRefundAll(1);
						}
					})

		}

		function SearchRefundAll(page) {
			$.ajax({
				url : "a_SearchRefundAll.man",
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

						addData.innerHTML += "<tr>" + "<td>" + list[i].rownum
								+ "</td>" + "<td>" + list[i].user_name
								+ "</td>" + "<td>" + list[i].refund_amount
								+ "</td>" + "<td>" + list[i].refund_tax
								+ "</td>" + "<td>" + list[i].status + "</td>"
								+ "<td>" + "환급완료 " + "</td></tr>";
						;

					}
				}
			})
		}

		function pageSearchRefund() {
			var page = 0;
			var searchval = $("#searchval").val();

			$.ajax({
				url : "a_CountSearchRefund.man",
				data : {
					page : page,
					searchval : searchval
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					page = list;
					pageset.innerHTML = "";
					for (var i = 0; i < page; i++) {
						pageset.innerHTML += "<button onclick='SearchRefund(\""
								+ (i + 1) + "\",\"" + searchval + "\");'>"
								+ (i + 1) + "</button> ";
					}
					SearchRefund(1, searchval);
				}
			})

		}
		function SearchRefund(page, searchval) {
			console.log(page, searchval);
			$.ajax({
				url : "a_SearchRefund.man",
				data : {
					page : page,
					searchval : searchval
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {

						if ((list[i].status) == "Y") {
							addData.innerHTML += "<tr>" + "<td>"
									+ list[i].rownum + "</td>" + "<td>"
									+ list[i].user_name + "</td>" + "<td>"
									+ list[i].refund_amount + "</td>" + "<td>"
									+ list[i].refund_tax + "</td>" + "<td>"
									+ list[i].status + "</td>" + "<td>"
									+ "환급완료 " + "</td></tr>";
						} else {
							addData.innerHTML += "<tr>" + "<td>"
									+ list[i].rownum + "</td>" + "<td>"
									+ list[i].user_name + "</td>" + "<td>"
									+ list[i].refund_amount + "</td>" + "<td>"
									+ list[i].refund_tax + "</td>" + "<td>"
									+ list[i].status + "</td>" + "<td>"
									+ "<button onclick='payment(\""
									+ list[i].refund_amount + "\",\""
									+ list[i].rownum + "\");'>환급하기</button>"
									+ "</td></tr>";
						}

					}

				}
			})

		}

		//결제 부분
		function payment(amount, number) {
			var refund_number = number;
			console.log(amount+number)
			IMP
					.request_pay(
							{
								pg : 'inicis', // version 1.1.0부터 지원.
								pay_method : 'card',
								merchant_uid : 'merchant_'
										+ new Date().getTime(),
								name : '주문명:결제테스트',
								amount : amount,
								buyer_email : 'iamport@siot.do',
								buyer_name : '구매자이름',
								buyer_tel : '010-1234-5678',
								buyer_addr : '서울특별시 강남구 삼성동',
								buyer_postcode : '123-456',
								m_redirect_url : 'http://localhost:8002/forest/a_moneyRefundView.man'
							}, function(rsp, refund_number) {
								if (rsp.success) {
									var msg = '결제가 완료되었습니다.';
									msg += '고유ID : ' + rsp.imp_uid;
									msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '결제 금액 : ' + rsp.paid_amount;
									msg += '카드 승인번호 : ' + rsp.apply_num;
									updateNumber(number);

								} else {
									var msg = '결제에 실패하였습니다.';
									msg += '에러내용 : ' + rsp.error_msg;
								}
								alert(msg);
							});
		}
		function updateNumber(number) {
			console.log(number);
			$.ajax({
				url : "a_UpdateRefundStatus.man",
				data : {
					number : number
				},
				dataType : 'json',
				type : 'post',
				success : function(list) {
					console.log(list);
				}
			});
		}
	</script>

</body>
</html>
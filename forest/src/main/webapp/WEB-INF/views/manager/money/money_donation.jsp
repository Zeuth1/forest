
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>

	<jsp:include page="../admin_sidebar.jsp" />
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE -</h2>
		<hr>
		<button onclick="CountdonateSearchAll();">전체후원조회</button>
		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="gname">기부자이름</option>
				<option value="gsum">기부자이름합산</option>
				<option value="tname">후원자이름</option>
				<option value="tsum">후원자이름합산</option>
			</select> <input type="text" id=searchval>
			<button onclick="evokebutton()">검색</button>
		</div>

		<hr>
		<table id=board_table class="table table-bordered">
			<tr id=Theader>
				<!-- <th>삽입부분 -->
				<th>DONATE_NO</th>
				<th>GIVER_NAME</th>
				<th>TAKER_NAME</th>
				<th>DONATE_DATE</th>
				<th>DONATE_AMOUNT</th>
			</tr>
			<!-- 테이블 줄 데이터 추가 부분 -->
			<tbody id=addData>
			</tbody>
		</table>
		<div id=pageset align="center"></div>
	</div>

	<!-- 스크립트(ajax,jquery) 작성부분 -->
	<script>
		var Theader = document.getElementById("Theader");
		var addData = document.getElementById("addData");
		var pageset = document.getElementById("pageset");
		var page=0;
		
		function CountdonateSearchAll() {
			$.ajax({
				url : "a_countdonation.man",
				data : {
					page : page
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					page=list;
					console.log(page)
					pageset.innerHTML="";
					for(var i =0;i<page;i++)
						{
							pageset.innerHTML+= "<button onclick='donateSearchAll(\""+ (i+1) + "\");'>"+(i+1)+"</button> ";
						}
					donateSearchAll(1);
				}
			});
		}
		
		function donateSearchAll(page){
			$.ajax({
				url : "a_donateSearchAll.man",
				data : {
					onclick : "onclick",
					page:page
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					Theader.innerHTML = "<th>DONATE_NO</th>"
							+ "<th>GIVER_NAME</th>" + "<th>TAKER_NAME</th>"
							+ "<th>DONATE_DATE</th>" + "<th>DONATE_AMOUNT</th>"
					addData.innerHTML = "";
					for (var i = 0; i < list.length; i++) {
						addData.innerHTML += "<tr><td>" + list[i].donate_no
								+ "</td>" + "<td>" + list[i].giver_Nick
								+ "</td>" + "<td>" + list[i].taker_Nick
								+ "</td>" + "<td>" + list[i].donate_date
								+ "</td>" + "<td>" + list[i].donate_amount
								+ "</td><tr>";
					}
				}
			});
		}
		
		function evokebutton(){
			var searchcon = $("#searchcon").val();
			var searchval = $("#searchval").val(); 
			CountdonateSearch(searchcon,searchval);
		}
		
		function CountdonateSearch(searchcon,searchval) {
			$.ajax({
				url : "a_CountdonateSearch.man",
				data : {
					page : page,
					searchcon:searchcon,
					searchval:searchval
				},
				dataType : "json",
				type : 'post',
				success : function(list) {
					console.log(list);
					page=list;
					console.log(page)
					pageset.innerHTML="";
					for(var i =0;i<page;i++)
						{
							pageset.innerHTML+= "<button onclick='donateSearch(\""+ (i+1) + "\");'>"+(i+1)+"</button> ";
						}
					donateSearch(1);
				}
			});
		}
		


		function donateSearch(page) {
			var searchcon = $("#searchcon").val();
			var searchval = $("#searchval").val();

			switch (searchcon) {

			case "tname":
				$.ajax({
					url : "a_donateSearchTOne.man",
					data : {
						onclick : "onclick",
						searchval : searchval,
						page:page
					},
					dataType : "json",
					type : 'post',
					success : function(list) {
						console.log(list);
						Theader.innerHTML = "<th>DONATE_NO</th>"
								+ "<th>GIVER_NAME</th>" + "<th>TAKER_NAME</th>"
								+ "<th>DONATE_DATE</th>"
								+ "<th>DONATE_AMOUNT</th>"
						addData.innerHTML = "";
						for (var i = 0; i < list.length; i++) {
							addData.innerHTML += "<tr><td>" + list[i].donate_no
									+ "</td>" + "<td>" + list[i].giver_Nick
									+ "</td>" + "<td>" + list[i].taker_Nick
									+ "</td>" + "<td>" + list[i].donate_date
									+ "</td>" + "<td>" + list[i].donate_amount
									+ "</td><tr>";
						}
					}
				});
				break;
			case "tsum":
				$.ajax({
					url : "a_donateSearchTSum.man",
					data : {
						onclick : "onclick",
						searchval : searchval,
						page:page
					},
					dataType : "json",
					type : 'post',
					success : function(list) {
						console.log(list);
						Theader.innerHTML = "<th>DONATE_NO</th>"
								+ "<th>TAKER_NAME</th>"
								+ "<th>DONATE_AMOUNT</th>"
						addData.innerHTML = "";
						for (var i = 0; i < list.length; i++) {
							addData.innerHTML += "<tr><td>" + list[i].donate_no
									+ "</td>" + "<td>" + list[i].taker_Nick
									+ "</td>" + "<td>" + list[i].donate_amount
									+ "</td><tr>";
						}
					}
				});
				break;
			case "gname":
				$.ajax({
					url : "a_donateSearchGOne.man",
					data : {
						onclick : "onclick",
						searchval : searchval,
						page:page
					},
					dataType : "json",
					type : 'post',
					success : function(list) {
						console.log(list);
						Theader.innerHTML = "<th>DONATE_NO</th>"
								+ "<th>GIVER_NAME</th>" + "<th>TAKER_NAME</th>"
								+ "<th>DONATE_DATE</th>"
								+ "<th>DONATE_AMOUNT</th>"
						addData.innerHTML = "";
						for (var i = 0; i < list.length; i++) {
							addData.innerHTML += "<tr><td>" + list[i].donate_no
									+ "</td>" + "<td>" + list[i].giver_Nick
									+ "</td>" + "<td>" + list[i].taker_Nick
									+ "</td>" + "<td>" + list[i].donate_date
									+ "</td>" + "<td>" + list[i].donate_amount
									+ "</td><tr>";
						}
					}
				});
				break;
			case "gsum":
				$.ajax({
					url : "a_donateSearchGSum.man",
					data : {
						onclick : "onclick",
						searchval : searchval,
						page:page
					},
					dataType : "json",
					type : 'post',
					success : function(list) {
						console.log(list);
						Theader.innerHTML = "<th>DONATE_NO</th>"
								+ "<th>GIVER_NAME</th>"
								+ "<th>DONATE_AMOUNT</th>"
						addData.innerHTML = "";
						for (var i = 0; i < list.length; i++) {
							addData.innerHTML += "<tr><td>" + list[i].donate_no
									+ "</td>" + "<td>" + list[i].giver_Nick
									+ "</td>" + "<td>" + list[i].donate_amount
									+ "</td><tr>";
						}
					}
				});
				break;

			}
		}
	</script>

</body>
</html>
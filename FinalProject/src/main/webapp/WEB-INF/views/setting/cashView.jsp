<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
	background-color: lightblue;
	color:white;
	}
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
</head>
<body>
	<h1>후원금 내역</h1>
	<hr>
	<table class="table table-striped">
		<tr>
			<th>후원자</th>
			<th>금액</th>
			<th>날짜</th>
			<th>현재 후원금 잔액</th>
			<th>후원금 환급</th>
		</tr>
		<tr>
			<td>이훈택</th>
			<td>100,000 원</td>
			<td>2018-03-08</td>
			<td>300,000 원</td>
			<td><button class="btn" id="myBtn">환급신청</button></td>
		</tr>
		<tr>
			<td>이동준</th>
			<td>100,000 원</td>
			<td>2018-03-08</td>
			<td>200,000 원</td>
			<td><button class="btn">환급신청</button></td>
		</tr>
		<tr>
			<td>유민수</th>
			<td>100,000 원</td>
			<td>2018-03-08</td>
			<td>100,000 원</td>
			<td><button class="btn">환급신청</button></td>
		</tr>
	</table>
	 <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <table>
        	<tr>
        		<td><b>환급 금액 입력:</b></td>
        		
        		
        	</tr>
        	<tr>
        		<td><input type="text"><b>원</b></td>
        		<td align="right"><button class="btn">확인</button></td>
        	</tr>
        	
        </table>
      </div>
      <script type="text/javascript">
//Get the modal
 var modal = document.getElementById('myModal');
 
 // Get the button that opens the modal
 var btn = document.getElementById("myBtn");
 
 // Get the <span> element that closes the modal
 var span = document.getElementsByClassName("close")[0];                                          

 // When the user clicks on the button, open the modal 
 btn.onclick = function() {
     modal.style.display = "block";
 }
 

 // When the user clicks on <span> (x), close the modal
 span.onclick = function() {
     modal.style.display = "none";
 }
 
 
 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }


 </script>
</body>
</html>
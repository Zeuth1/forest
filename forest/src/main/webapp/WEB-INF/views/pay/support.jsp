<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/support.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://npmcdn.com/axios/dist/axios.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

	<div class="total-wrap">
	  	<div class="total-left">
	  		<div class="profile-wrap">
	  		<br>
	  		<br>
	  			<div class="profile">
	  			 	<!--회원 프로필 사진  -->
	  				<img src="<%=request.getContextPath() %>/resources/images/profile.jpg" class="profile-photo">
	  				<p>${loginUser.mId }</p>
	  				<p>${loginUser.mName }</p>
	  			</div>
	  		</div>
	  		<div class="price-wrap">
	  		
	  			<div class="price-wrap2">
	  			<br>
	  			 
	  				<font>5,500￦/월</font>
	  			 
	  			</div>	
	  		</div>	
	  	<div class="benefit-wrap">
	  		<br>
	  		<p style="font-weight:700">구독 혜택</p>
	  		<p style="font-size:13px">작가를 후원함으로 작가의 창작의욕 발생</p>
	  		<p style="font-size:13px">작가의 비공개 게시물 열람 가능</p>
	  	</div>
	  	</div>
	  	
	  	
		<div class="total-right">
			<h2>정기구독 시작</h2>
			<div class="choice-wrap">
				<div class="notice-wrap">
				<h3 style="font-weight:100">정기결제 선택</h3>
				</div>
			<div class="price-choice">
				<div class="right-price-wrap" id="wrap1" style="border:1px solid #3385ff ">
					<br>
					<font style="margin-left:15px;">5,500￦</font>
					<hr style="width:80%; margin-left:auto; margin-right:auto;">
					<input name="price" id="p1" type="radio" class="pickme" checked="checked">매월
				</div>
				<div class="right-price-wrap" id="wrap2">
					<br>
					<font style="margin-left:15px;" >5,500￦</font>
					<hr style="width:80%; margin-left:auto; margin-right:auto;">
					<input name="price" id="p2" type="radio" class="pickme">3개월</div>
				<div class="right-price-wrap" id="wrap3">
					<br>
					<font style="margin-left:15px;">5,500￦</font>
					<hr style="width:80%; margin-left:auto; margin-right:auto;">
					<input name="price" id="p3" type="radio" class="pickme">6개월
				</div>
			
			
			</div>
			
				<button style="float:right; margin-right:80px; background:#3385ff; color:white; border:none; padding:5px;" onclick="payment();">계속</button>
				
				<font style="float:right; margin-right:20px;"></font><font style="float:right; margin-right:20px;" id="total-price">5,500￦/1개월</font>
			
			</div>
			
			
			
		</div>
	
		
	</div>
	<script>
	
	
	
	function payment(){
		
		var price=$("#total-price").html();
		var uid="${loginUser.mName}"+"1"; //나중에 회원+작가 아이디로 결합
			
		  IMP.request_pay({ // param
			    pg: "inicis",
			    pay_method: "card", 
			    /* merchant_uid: 51515,  */
			    customer_uid: uid, 
			    name: "정기결제",
			    amount: 1000, 
			    buyer_email: "${loginUser.mEmail}",
			    buyer_name: "${loginUser.mName}",
			    buyer_tel: "${loginUser.mPhone}"
			}, function (rsp) { // callback
			    if (rsp.success) {
			        // 빌링키 발급 성공
			           // jQuery로 HTTP 요청
			           var msg="빌링키발급성공!";
			          	console.log(msg);
			          	console.log(rsp.success);
			          	console.log(rsp);
			          var shoot= {"merchant_uid":rsp.merchant_uid,"amount":"5500","schedule_at":"1527323833"};
			            console.log(shoot);
			           	
			           jQuery.ajax({
				    	   url: "https://api.iamport.kr/subscribe/payments/schedule/", // 서비스 웹서버
				            method: "POST",
				            headers: { "Content-Type": "application/json" },
				            data: {
				                customer_uid: rsp.imp_uid,
				                schedule_at : JSON.stringify(shoot)
				            },
				            success: function(data){
				            	
				            	console.log("data? 성공!"+data);
				            	
				            	
				            },
				            error:function(data){
				            	
				            	console.log("실패다실패!");
				            	
				            }
	        			});  
			    } else {
			        // 빌링키 발급 실패
			    }
			});   
		  
		
	}
	
	</script>
	
	<script>
	$(function(){
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp33916581');
	
	
	$("#p1").click(function(){
		
		 $("#total-price").html("5,500￦/1개월");
	     $("#wrap1").css("border","1px solid #3385ff");
	     $("#wrap2").css("border","1px solid black");
	     $("#wrap3").css("border","1px solid black");
	});

	$("#p2").click(function(){
	
		
	 	$("#total-price").html("5,500￦/3개월");
	    $("#wrap2").css("border","1px solid #3385ff");
	    $("#wrap1").css("border","1px solid black");
	    $("#wrap3").css("border","1px solid black");
	});
	
	$("#p3").click(function(){
		
		 $("#total-price").html("5,500￦/6개월");
		 $("#wrap3").css("border","1px solid #3385ff");
		 $("#wrap1").css("border","1px solid black");
		 $("#wrap2").css("border","1px solid black");
		});
		
	
	
	});
	
	
	
	
	
	</script>
	
	




</body>
</html>
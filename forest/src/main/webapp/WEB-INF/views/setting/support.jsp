<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
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
	  			 	<c:choose>
	  			 		<c:when test="${empty profile }">
	  				<img src="<%=request.getContextPath() %>/resources/images/default-user-image.png" class="profile-photo">
	  					</c:when>
	  					<c:otherwise>
	  				<img src="/tree/${profile }" class="proflie-photo" style="width:50%;">	
	  					</c:otherwise>
	  				</c:choose>	
	  				<p>${loginUser.mNickName }</p>
	  				<p>${loginUser.mName }</p>
	  				<br><br><br>
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
			<pre style="font-size:12px; ">빠르고 안전하게 구독을 신청하실 수 있습니다! 회원님의 후원이 미래의 예술의 씨앗이 됩니다.    
후원취소는 마이페이지에서 언제든지 하실 수 있습니다.</pre>
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
			
			
			<input type="hidden" id="total-price2">
		</div>
	
		
	</div>
	<script>
	
	
	
	function payment(){
		
		var price=$("#total-price2").val();
		var uid="${loginUser.mName}"+"1"; //나중에 회원+작가 아이디로 결합
		alert("들어오니?");
		console.log("웰컴?");
		
		var obj=new Object();
		obj.price=price;
		obj.uid=uid;
		var jsonData = JSON.stringify(obj);
		
		IMP.request_pay({ // param
			pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '작가후원 걸제',
		    amount : 1000,
		    buyer_email : '${loginUser.mId}',
		    buyer_name : '${loginUser.mName}',
		    buyer_tel : '${loginUser.mPhone}'
		}, function (rsp) { // callback
		    if (rsp.success) {
					
					$.ajax({
						
						url:"payment.set",
						method:"POST",
						headers: { "Content-Type": "application/json" },
				        data: jsonData,
				        success:function(data){
				        	
				        	swal("후원결제가 되었습니다 감사합니다.");
				        	
				       
				        
				        }
						
						
					})
					
		    	
		    	
		    	
		    } else {
		      swal("결제에 실패하였습니다.")
		        
		    }
		});
		
	}
	</script>
	
	<script>
	$(function(){	
		
		
	var IMP = window.IMP; // 생략가능
	IMP.init('imp33916581');
	$("#total-price2").val("5500");
	
	$("#p1").click(function(){
		 $("#total-price2").html("5500")
		 $("#total-price").html("5,500￦/1개월");
	     $("#wrap1").css("border","1px solid #3385ff");
	     $("#wrap2").css("border","1px solid black");
	     $("#wrap3").css("border","1px solid black");
	});

	$("#p2").click(function(){
	
		$("#total-price2").html("15500")
	 	$("#total-price").html("5,500￦/3개월");
	    $("#wrap2").css("border","1px solid #3385ff");
	    $("#wrap1").css("border","1px solid black");
	    $("#wrap3").css("border","1px solid black");
	});
	
	$("#p3").click(function(){
		$("#total-price2").html("33000")
		 $("#total-price").html("5,500￦/6개월");
		 $("#wrap3").css("border","1px solid #3385ff");
		 $("#wrap1").css("border","1px solid black");
		 $("#wrap2").css("border","1px solid black");
		});
		
	
	
	});
	
	
	
	</script>
	<script>
	 	 var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
	    var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
	    var appCtx = pathname.substring(0, pathname.indexOf("/",2));
	    var root = url+appCtx;


		
		var wsUri = "ws://"+root+"/echo";
			
		function send_message(){
			
			websocket = new WebSocket(wsUri);
			websocket.onopen =function(evt){
				onOpen(evt);
				
			}
			websocket.onmessage = function(evt){
				
				onMessage(evt);
				
			};
			websocket.onerror = function(evt){
				onError(evt);
			}
			
			
			
		}
		
		function onOpen(evt){
			
			websocket.send("${loginUser.mName}");
		}
		function onMessage(evt){
		
		/* 메세지 받을부분 */
		
		}
		
		function onError(evt){
			
			
		}
		$(function(){
			
			send_message();
		})
	
	</script>
	


	
	
	


</body>
</html>
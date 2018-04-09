<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/support.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="support-frame">
	  
		<div class="profile-frame">
			<img src="<%=request.getContextPath() %>/image/support/profile.jpg">
			<div>서은영 작가</div>
		</div>
		<div class	="check-money">5,500/월</div>
		<div class="service">
				<p class="service-text strong-text">정기구독 혜택</p>
				<br>
				<p class="service-text">작가 직접 후원</p>
				<p class="service-text">실루엣 글 보기 가능</p>
		</div>
		<div class="explain-frame">
			<h2>정기구독 시작</h2>
			<div class="chice-frame">
			<h3>정기결제 시작</h3>
			
			<hr class="highlight">
			
			
			<div class="check-amount">
				<div class="price-check" >
				<span id="price1">5.00$</span>
				</div>
				<div>
				
				<input name="price" type="radio" id="p1" checked>
				<span>매월</span>
					
				</div>
				
				
			</div >
			<div class="check-amount">
					<div class="price-check">
				<span id="price2">20.00$</span>
				</div>
				<div>
				
				<input name="price" type="radio" id="p2">
				<span>매월</span>
				
				</div>
				
				
			
				
			
			</div>
			<div class="check-amount">
			
				<div class="price-check">
				<span id="price3">15.00$</span>
				</div>
				<div class="month-check">
				<input name="price" type="radio" id="p3">
				<span>매월</span>
				</div>
			</div>
			
			
			
			<div class="total-price-wrap">
				<div class="total-price-frame">
					
					<span class="total-price-word">소계</span>
					<span class="total-price" id="total-price">5.00$</span>
					
				</div>	
				
			 	<div class="check-btn-frame">
			 			<button class="next-btn">계속</button>
			 	
			 	</div>
			
			</div>
				
			
			
			
			</div>
		 
			
		
		
		</div>
		
		
		
	</div>
	
	<script>
	

	$(function(){
		
	
	$("#p1").click(function(){
		
		 $("#total-price").html("5.00$");
		
		
	});

	$("#p2").click(function(){
	
		
	 	$("#total-price").html("$15.00$");
	 
		
	});

	$("#p3").click(function(){
		
		 $("#total-price").html("$25.00");
		
		
	});
		
	
	
	});
	
	
	
	
	
	</script>
	
	
	
	



</body>
</html>
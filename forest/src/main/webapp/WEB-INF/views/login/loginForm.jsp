<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/loginForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>




<body>



	
	<div class="background" >
		<img  id="background" src="resources/images/${aName}" style="position:absolute; width:100%;height:100%; margin-left:-880px;">
		
		<div class="login-form">
			<div class="logo">
				<img  src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:30%; height:auto; ">
			</div>
			<div class="enter" style="cursor:pointer" onclick="newMember();">
			
					회원가입
			</div>
			<div class="login" style="cursor:pointer" onclick="enter();">
				
					로그인
			</div>
			<div class="social-login">
				가지고 있는 계정으로 시작하기
				<br>
				<br>
				<div class="naver">
					<img src="<%=request.getContextPath()%>/resources/images/naver.png" style="width:75%; height:auto; border-radius:5px; cursor:pointer;">
				</div>
				<div class="google">
					<img src="<%=request.getContextPath()%>/resources/images/google.png" style="width:80%; height:auto; border-radius:5px; cursor:pointer;">
				 </div>
				<div class="facebook">
					<img src="<%=request.getContextPath()%>/resources/images/facebook.jpg" style="width:62%; height:auto; border-radius:5px;cursor:pointer;" >
				</div>
			
			</div>
			
			
		</div>
	
	
	
	</div>
	
	<script>
	
		
		$(function(){
			var date=new Date();
			timer = setInterval( function () {
			
				
				$.ajax ({
					url : "changePic.lo",
					method:"post",
					success : function (data) { 
						console.log(data.aName);
						$("#background").attr("src","resources/images/"+data.aName).fadeOut(700).stop(true,true).fadeIn(1200);
							
					}
				});

			},10000);
			
		});
	
	
	
		function newMember(){
			
			location.href="enter.lo";
	
			
		}
		
		function enter(){
			
			location.href="gotomain.lo";
			
		}
		
		
	
	</script>
	
	
	
	
</body>
</html>
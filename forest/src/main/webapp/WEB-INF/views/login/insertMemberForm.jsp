<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    
<!DOCTYPE html >
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/insertMemberForm.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	

	
		<form action="insertMember.lo" method="post" id="login-Form2">
		 <div class="background" >
		<img  id="background" src="/tree/${ aName }" style="position:absolute; width:100%;height:100%; margin-left:-880px;"/>
		
		<div class="login-form" id="login-form">
			<div class="logo">
				<img  src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:30%; height:auto; ">
			</div>
			
			
			<div class="first-wrap" id="first-wrap">
		<input  class="enterPhone" id="id" placeholder="휴대폰 번호" maxlength="11" name="mId">
			<input type="password" class="enterpassword" id="password" placeholder="비밀 번호"  maxlength="20" name="mPwd">
			 
			<button class="nextbtn" id="check-btn" onclick="checknext();" type="button">다음</button>
			<div class="check-phone" id="check-phone">휴대폰 번호를 제대로 입력해주세요.</div>
			<div class="check-pwd" id="check-pwd">비밀번호는 3글자 이상입니다.</div>
			
			
			
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
		 <div class="second-wrap" id="second-wrap">
			이메일
			<div class="nick-name">
				<input type="email" id="email" class="input-name" placeholder=" 이메일" name="mEmail">
				<div class="input-name-wrap" style="margin-left:5px;" >
				<hr>
				<p style="font-weight:100;">아이디/비밀번호 찾기 시 이용됩니다.</p>	
				</div>
				<p id="wrong-email" style="color:red; margin-top:15px;">이메일 주소를 제대로 입력하여 주세요.</p>
				<p id="wrong-email2" style="color:red; margin-top:15px;">이메일이 중복됩니다.</p>
			</div>
			
			이름
			<div class="nick-name">
				<input type="text" class="input-name" id="mName" placeholder=" 이름" name="mName">
				<div class="input-name-wrap" style="margin-left:5px;">
				<hr>
				<p style="font-weight:100;">후원/후원 받기 시 사용될 이름입니다.</p>	
				</div>
				<p id="wrong-name" style="color:red; margin-top:15px;">이름을 제대로 입력해 주세요.</p>
			</div>
			
			닉네임
			<div class="nick-name">
				<input type="text" class="input-name" id="mNickName" placeholder=" 닉네임" name="mNickName">
				<div class="input-name-wrap" style="margin-left:5px;">
				<hr>
				<p style="font-weight:100;">사이트 내에서 사용될 이름입니다.</p>	
				</div>
				<p id="wrong-nick" style="color:red; margin-top:15px;">중복된 닉네임입니다.</p>
				<p id="wrong-nick2" style="color:red; margin-top:15px;">닉네임은 세글자 이상입니다.</p>	
				<p id="wrong-nick3" style="color:red; margin-top:15px;">닉네임이 중복됩니다.</p>	
			</div>
			<br>
			성별
			<div class="gender"> 
			 	 
				<div class="gender-box" >
					<input type="radio"  value="M"   name="mGender">남자
					<input type="radio"  value="F"  style="margin-left:15px;" name="mGender">여자
				</div>
				<p id="wrong-gender" style="color:red; margin-top:15px;">성별을 체크해 주세요</p>
			</div>
			생일
			<div class="birth" style="margin-top:20px;">
					
					
				<select id="year" title="select-year" style="width:80px;padding-left:35px" name="year">
					<option selected="selected">년</option>
					<c:forEach begin="0" end="100" var="year">
						<option>${ 2018-year }</option>
					</c:forEach>
				</select>
			
				<select id="month" style="width:80px; padding-left:50px;" name="month">
					<option selected="selected">월</option>
					<c:forEach begin="1" end="9" var="month" >
					  	<option>0${month }</option>
					</c:forEach>
						<option>10</option>
						<option>11</option>
						<option>12</option>
				</select>
				
				<select id="day"  style="width:55px; padding-left:20px;" name="day">
				
					<option selected="selected">일</option>
					<c:forEach begin="1" end="9" var="day">
						<option>0${day }</option>
					</c:forEach>
					<c:forEach begin="10" end="31" var="day">
						<option>${day }</option>
					</c:forEach>
				</select>
				<p id="wrong-birth" style="color:red; margin-top:15px;">생년월일을 제대로 입력해주세요.</p>	
			</div>
				<button type="button" class="sign-up-btn" onclick="signUp()" >가입하기</button>
			</div> 
			<input style='display:none
			' name="mBirth" id="birth-">
		</div>
		
	</div>
	</form>
	
	<script>
	
	
	$(function(){
		var date=new Date();
		timer = setInterval( function () {
		
			
			$.ajax ({
				url : "changePic.lo",
				method:"post",
				success : function (data) { 
					console.log(data.aName);
					$("#background").attr("src","/tree/"+data.aName).fadeOut(700).stop(true,true).fadeIn(1200);
						
				}
			});

		},10000);
		
	});
	
	
	
	$(function(){
		
		 $("#check-phone").hide();
		$("#check-pwd").hide(); 
		$("#second-wrap").hide();
		$("#wrong-email").hide();
		$("#wrong-email2").hide();
		$("#wrong-nick").hide();
		$("#wrong-birth").hide();
		$("#wrong-gender").hide();
		$("#wrong-nick2").hide();
		$("#wrong-nick3").hide();
		$("#wrong-name").hide();
	})	
	
	
 	
		
	function checknext(){
		$(".first-wrap").animate({left:'-150px;'})
		var check=  /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/;
		var id=$("#id").val();
		var pwd=$("#password").val();
		console.log(id);
		
		if(check.test(id)&& pwd.length>=3){
			$("#first-wrap").hide();
			$("#login-form").animate({"height":"89%"});
			$("#check-phone").hide();
			$("#check-pwd").hide(); 
			$("#second-wrap").fadeIn(); 	
			$("#login-form").css("margin-top","40px");
			$(".logo").css("height","15%");
		}
		if(!check.test(id)){
				
			if(pwd.length>=3){
				
				$("#check-phone").show();
				$("#check-pwd").hide(); 
				$("#login-form").css("height","55%");
				
			}else{
				
				 $("#check-phone").show();
				$("#check-pwd").show(); 
				$("#login-form").css("height","58%");
			}
				
		}
		if(pwd.length<3){
				
				if(check.test(id)){
					
					$("#check-phone").hide();
					$("#check-pwd").show(); 
					$("#login-form").css("height","55%");
				}
				
		}
			
			
	
		
		
		
	}
	function signUp(){
		
		
		var id=$("#id").val();
		var pwd=$("#password").val();
		
		
		var mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email=$("#email").val();
	
		var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var name=$("#mName").val();
		var birthExp= /^[0-9]{6}$/;
		
		var nick=$("#mNickName").val();
		var gender=$('input:radio[name="mGender"]').is(":checked") ;
		var birth=$("#year").val().substring(2,4)+$("#month").val()+$("#day").val();
			$("#birth-").val(birth);
	
		
		
		
		if(mailExp.test(email) && nameExp.test(name) && nick.length>=3 &&gender==true && birthExp.test(birth) ){
			
			var email=$("#email").val();
			var nick=$("#mNickName").val();
			var check= [email,nick]; 
			$.ajax({
			
				url: "checkContent.lo",
				type:"post",
				data:{email:email, nick:nick	},
				
				
				success:function(data){
					
					alert(data.message);
					if(data.message==0){
						
						$("#login-Form2").submit();
						
						
					}
				    if(data.message==1){
				    	$("#wrong-email2").show();
				    	$("#wrong-nick3").hide();
					    
				    }
					if(data.message==2)
						{
						$("#wrong-nick3").show();
						 $("#wrong-email2").hide();
						
						}
					if(data.message==3){    
						$("#wrong-nick3").show();
					    $("#wrong-email2").show();
					}
					
				},
				error:function(data){
					alert("실패");
				}
				
			})
			
			
			
			
		}
		if(!mailExp.test(email)){
			
			$("#wrong-email").show();
			$("#wrong-nick3").hide();
			 $("#wrong-email2").hide();
			
		
		}else{
			
			$("#wrong-email").hide();
		}
		
		
		if(!nameExp.test(name)){
			$("#wrong-nick3").hide();
			 $("#wrong-email2").hide();
			$("#wrong-name").show();
			
		}else{
			
			$("#wrong-name").hide();
			
		}
		if(nick.length<3){
			$("#wrong-nick3").hide();
			 $("#wrong-email2").hide();
			$("#wrong-nick2").show();
			
		}else{
			
			$("#wrong-nick2").hide();
		}
		
		if(gender==false){
			$("#wrong-nick3").hide();
			 $("#wrong-email2").hide();
			$("#wrong-gender").show();
			
		}else{
			
			$("#wrong-gender").hide();
			
		}
		if(!birthExp.test(birth)){
			$("#wrong-nick3").hide();
			 $("#wrong-email2").hide();
			$("#wrong-birth").show();
		}else{
			
			$("#wrong-birth").hide();
		}
		
	}
	
	
	</script>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/loginForm.css">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="569688176866-2fhuueq4kb1pddacn6jlomi8q5siqd48.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


<title>Insert title here</title>

</head>

<form action="enter.lo" method="post" id="socialLogin">
	

		<input type="hidden" name="socialId">
		<input type="hidden" name="mName">
		<input type="hidden" name="mEmail">

</form>


<body>



	
	<div class="background" >
		<img  id="background" src="/tree/${aName}" style="position:absolute; width:100%;height:100%; margin-left:-880px;">
		
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
				<div id="naverIdLogin"  ></div>
				<div  class="g-signin2" data-onsuccess="onSignIn" style="width:184.96px; margin-left:auto; margin-right:auto; margin-top:10px;">
					
							
			</div>
			
			
		</div>
	
	
	</div>
	</div>
	<input type="hidden" id="google-id" name="socialId">
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
	
	
	
		function newMember(){
			
			$("#socialLogin").submit();
	
			
		}
		
		function enter(){
			
			location.href="gotomain.lo";
			
		}
		
		</script>
	

	<script>
			
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  var id_token = googleUser.getAuthResponse().id_token;
		  var Email= profile.getEmail();
		  var Name= profile.getName();
		  var xhr = new XMLHttpRequest();
		  
		  xhr.onreadystatechange = function() { // 요청에 대한 콜백
			  if (xhr.readyState === xhr.DONE) { // 요청이 완료되면
			    if (xhr.status === 200) {
			    	var response= eval("("+xhr.responseText+")");
			    	if(response.check==0){
			    		
			    		$("input[name=socialId]").val(response.socialId);
						$("input[name=mName]").val(response.mName);
						$("input[name=mEmail]").val(response.mEmail);
						
						
						$("#socialLogin").submit();
						
						
			    		}
			    	else{
			    		
			    		location.href="mainBoard.ma";
			    		
			    		
			    	}
			    } else {
			      console.error("201리스폰스?:"+xhr.responseText);
			      
			    }
			  }
			};
		  
		  xhr.open('POST', 'google.lo');
		  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		
		  xhr.send('idtoken=' + id_token);
		 
		}
		
	
	
	</script>
	<!-- RestAPI-->
	<!-- RestAPI에서 scope한 api자료 인코딩해서 붙여넣고 Redirection주소 인코딩해서 붙여넣은다음 발급받은 client ID를 붙여넣으면 됨-->
	
	<!--  http://localhost:8001/forest/enter.lo?state=state_parameter_passthrough_value&code=4/AABi25JujwMWY-oYtlFvV9e4Kd6_wYAwJVBy0wJqK5xob4E_6eGBBCfwLdHNqBVPTpPpMnH018f-d7Jz2rnkY60&scope=https://www.googleapis.com/auth/plus.me+https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/plus.profile.agerange.read+https://www.googleapis.com/auth/plus.profile.language.read#
	
	
	https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile

	-->
	
	
	<!--https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile-->
	


<!-- 네이버로그인단  -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "a6glrihgFQY0OYBb4qYz",
			callbackUrl: "http://localhost:8001/forest/login.lo",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 40} /* 로그인 버튼의 타입을 지정 */
			}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var mEmail=naverLogin.user.getEmail();
					if( mEmail == undefined || mEmail == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							console.log("이게안된다는건가?");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
							naverLogin.reprompt();
					}
					var clientId=naverLogin.clientId;
					$.ajax({
						
						url:"naver.lo",
						method:"post",
						data:{clientId:clientId},
						success:function(data){
							console.log(data);
							if(data.check==0){
								
								$("input[name=socialId]").val(naverLogin.clientId);
								$("input[name=mName]").val(naverLogin.user.getName());
								$("input[name=mEmail]").val(naverLogin.user.getEmail());
								$("#socialLogin").submit();
							}else{
								
								location.href="mainBoard.ma";
								
							}
							
							
						}
						
					})
				
				} else {
				console.log("callback 처리에 실패하였습니다.");
			}
			
			


		});
	});
	
	
	$(function(){
		console.log("되는건가!!")
		moveBgAround();
		
	});
	
	function moveBgAround() {
		var x = Math.floor(Math.random()*401);
		var y = Math.floor(Math.random()*401);
		
		var time = Math.floor(Math.random()*1001) + 2000;
	
		$('.background').animate({
			backgroundPosition: '(' + (x * -1) + 'px ' + (y * -1) + 'px)'
		}, time, "swing", function() {
			moveBgAround();
		});
	}
	
</script>



</body>
</html>
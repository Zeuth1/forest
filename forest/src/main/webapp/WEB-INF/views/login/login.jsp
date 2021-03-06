<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>



<html>
<style>

@CHARSET "UTF-8";



.background{
	
	 width:100%;
	height:100%;
	  text-align:center;
	
	position:absolute;
	
}

.login-form{
	
	
	background-color: #ffffff;
   	opacity:0.95;
	width:17%;
	height:45%;
	border-radius:5px;
    margin-left:auto;
	margin-right:auto;
	margin-top:150px;
	padding-top:20px;
	
	
}

.first-wrap{

	
}


.logo{
	
	width:90%;
	height:20%;
	margin-left:auto;
	margin-right:auto;
	margin-top:9px;
	
	
}
body {overflow:hidden}


.social-login{
	
	background:#f3f3f3;
	color:black;
	font-size:8px;
	padding-top:9px;
	padding-bottom:9px;
	width:90%;
	height:110px;
	margin-top:5px;
	margin-left:15px;
	
	
	
}
.enterPhone{
	
	margin-top:20px;
	padding:10px;
	padding-right:80px;
	
    border-radius: 5px 5px 0 0;
	
}
.enterpassword{
	
	padding:10px;
	padding-right:80px;
	border-radius: 0 0  5px 5px;
}

.nextbtn{
	
    background: #25c6ff;
    color: white;
    border: none;
    margin-top: 10px;
    padding: 10px 107px;
    margin-left: 5px;
    margin-bottom: 5px;
    border-radius: 5px;
	
}


.naver{
	margin-top:10px;
	display:block;
	float:left;
	width:30%;
	height:50%;
	
	margin-left:15px;
	
}
.facebook{
	
	margin-top:10px;
	display:block;
	float:left;
	width:30%;
	height:50%;
	
	
}
.check-phone, .check-pwd{
	
	color:white;
	margin-left:20px;
	width:80%;
	padding:10px 10px; 
	border:none;
	background:rgba(0,0,0,.3); 
	font-size:12px;
	margin-top:3px;
	border-radius:3px;
}




.google{
	
		margin-top:10px;
	display:block;;
	float:right;
	width:30%;
	height:50%;
	
	margin-right:10px;
	
	
}

.enter-site{

	font-size:11px;
	background:#25c6ff;
	color:white;
	border:none;
	border-radius:5px;
	padding: 11px 9px;
	margin-left: 790px;
	position:absolute;
	z-index:1;

}

.find-ID{

	margin-left:180px;
	color:black;
	font-size:11px;
	text-decoration:none;
}


</style>
<head>

<meta  charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="569688176866-2fhuueq4kb1pddacn6jlomi8q5siqd48.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>



<div class="background" >
	<button class="enter-site" id="enter-site" onclick="location.href='enter.lo'">회원가입</button>

	<img  id="background" src="/tree/${ aName }" style="position:absolute; width:100%;height:100%; margin-left:-880px;">
	

	<div class="login-form" id="login-form">
			<div class="logo">
				<img  src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:30%; height:auto; ">
			</div>
			
			
			<div class="first-wrap" id="first-wrap">
			<input class="enterPhone" id="id" placeholder="이메일주소" name="mId">
			
			<input type="password" class="enterpassword" id="password" placeholder="비밀 번호"  maxlength="20" name="mPwd">
			 
			<button class="nextbtn" id="check-btn" onclick="checknext();" type="button">로그인</button>
			<div class="check-phone" id="check-phone">메일주소를 제대로 입력해주세요.</div>
			<div class="check-pwd" id="check-pwd">비밀번호는 3글자 이상입니다.</div>
			<br>		
				<a href="find.lo" class="find-ID">ID/비밀번호 찾기</a>
			
			
			
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
						$("#background").attr("src","/tree/"+data.aName).fadeOut(700).stop(true,true).fadeIn(1200);
							
					}
				});

			},10000);
			
		});
		
		

		 $("#check-phone").hide();
		$("#check-pwd").hide(); 
		
		function checknext(){
			$(".first-wrap").animate({left:'-150px;'})
			var mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
			var id=$("#id").val();
			var pwd=$("#password").val();
			console.log(id);
			
			if(mailExp.test(id)&& pwd.length>=3){
				
				$.ajax({
					
					url:"checkMember.lo",
					type:"post",
					data:{mId:id, mPwd:pwd},
					success:function(data){
						if(data.result !=0) alert("아이디/비밀번호를 다시 확인 해 주세요.")
						else location.href="mainBoard.ma";
					},
					error:function(data){
						
						alert("실패");
						
					}
					
				})
				
				
				
			}
			if(!mailExp.test(id)){
					
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
					
					if(mailExp.test(id)){
						
						$("#check-phone").hide();
						$("#check-pwd").show(); 
						$("#login-form").css("height","55%");
					}
					
			}
				
				
		
			
			
			
		}
		
		
		
		</script>
		
		<!-- 구글로그인단 -->
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
			    		
			    		
						
						var socialId=response.socialId;
						var mName=response.mName;
						var mEmail=response.mEmail;
						location.href="enter.lo?socialId="+socialId+"&mName="+mName+"&mEmail="+mEmail; 
			    		
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
					
					var mEmail = naverLogin.user.getEmail();
					var mName = naverLogin.user.getName();
					var socialId=naverLogin.clientId;
					if( mEmail == undefined || mEmail == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
							naverLogin.reprompt();
					}
					
				location.href="enter.lo?mEmail="+mEmail+"&mName="+mName+"&socialId="+socialId;
				
				
				} else {
				console.log("callback 처리에 실패하였습니다.");
			}
			
			


		});
	});
	</script>	

</body>
</html>
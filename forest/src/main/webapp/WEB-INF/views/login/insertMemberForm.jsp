<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="569688176866-2fhuueq4kb1pddacn6jlomi8q5siqd48.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/insertMemberForm.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<input type="hidden" id="google-id">
	<form action="insertMember.lo" method="post" id="login-Form2">
		<c:if test="${socialId!=null}">
			<input id="socialId" type="hidden" value="${socialId }"
				name="socialId">

		</c:if>
		<div style="display:none">
		<input type="submit" onclick="return false;" />
		<input type="text"/>
			</div>


		<div class="background">
			<img id="background" src="/tree/${ aName }"
				style="position: absolute; width: 100%; height: 100%; margin-left: -880px;">

			<div class="login-form" id="login-form">
				<div class="logo">
					<img src="<%=request.getContextPath()%>/resources/images/logo.png"
						style="width: 30%; height: auto;">
				</div>


				<div class="first-wrap" id="first-wrap">

					
							<input type="email" id="email" class="email" placeholder=" 이메일"
								name="mId">
							<button class="mail-check-btn" type="button" onclick="mailCheck();">인증</button>
							<input type="hidden" id="code1"  class="enterCode">
							<input type="hidden" id="code2" value="1">

			
					<button class="nextbtn" type="button" id="check-btn" onclick="checknext();"
						style="display:none;">다음</button>
					
					<div class="check-phone" id="wrong-email">이메일 주소를 제대로 입력하여 주세요.</div>
					<div class="check-phone" id="wrong-email2">이메일이 중복됩니다.</div>
					


					<div class="social-login" id="social-login">
						가지고 있는 계정으로 시작하기 <br> <br>
						<div id="naverIdLogin"></div>
						<div class="g-signin2" data-onsuccess="onSignIn"
							style="width: 184.96px; margin-left: auto; margin-right: auto; margin-top: 10px;"></div>

					</div>

				</div>
				<div class="second-wrap" id="second-wrap">
					<div id="password-wrap">
					 <c:choose>
					 	<c:when test="${empty socialId }">
						비밀번호/비밀번호확인
							<input type="password" class="enterpassword" id="password1" placeholder="비밀번호" maxlength="20" name="mPwd" style="float:left;">
							<input type="password" class="enterpassword" id="password2" placeholder="비밀번호 확인" maxlength="20" name="mPwd" style="float:right;">		
							<p id="check-pwd" style="color: red; margin-top: 15px;">비밀번호는 세글자 이상입니다.</p>
							<p id="check-pwd2" style="color: red; margin-top: 15px;">비밀번호가 일치하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<input type="hidden" class="enterpassword" id="password1" value="${socialId }" placeholder="비밀번호" maxlength="20" name="mPwd" style="float:left;">
							<input type="hidden" class="enterpassword" id="password2" value="${socialId }"  placeholder="비밀번호 확인" maxlength="20" name="mPwd" style="float:right;">		
							<p id="check-pwd" style="color: red; margin-top: 15px;">비밀번호는 세글자 이상입니다.</p>
							<p id="check-pwd2" style="color: red; margin-top: 15px;">비밀번호가 일치하지 않습니다.</p>
						</c:otherwise>
					</c:choose>
					</div>
					<br><br><br>
					휴대폰번호
					<div class="nick-name">
						<c:choose>
							<c:when test="${!empty socialId }">
								<input class="enterPhone" id="id" placeholder="휴대폰 번호" name="mPhone" maxlength="11">
							</c:when>
							<c:otherwise>
								<input class="enterPhone" id="id" placeholder="휴대폰 번호" maxlength="11" name="mPhone">
							</c:otherwise>
						</c:choose>
						<div class="input-name-wrap" style="margin-left: 5px;">
							<hr>
							<p style="font-weight: 100;">아이디/비밀번호 찾기 시 이용됩니다.</p>
						</div>
						<p id="check-phone" style="color: red; margin-top: 15px;">휴대폰 번호를 제대로 입력해주세요.</p>

					</div>

					이름
					<div class="nick-name">
						<c:choose>
							<c:when test="${!empty mName }">
								<input type="text" class="input-name" id="mName"
									placeholder=" 이름" name="mName" value="${mName }">
							</c:when>
							<c:otherwise>
								<input type="text" class="input-name" id="mName"
									placeholder=" 이름" name="mName">


							</c:otherwise>

						</c:choose>
						<div class="input-name-wrap" style="margin-left: 5px;">
							<hr>
							<p style="font-weight: 100;">후원/후원 받기 시 사용될 이름입니다.</p>
						</div>
						<p id="wrong-name" style="color: red; margin-top: 15px;">이름을
							제대로 입력해 주세요.</p>
					</div>

					닉네임
					<div class="nick-name">
						<input type="text" class="input-name" id="mNickName"
							placeholder=" 닉네임" name="mNickName">
						<div class="input-name-wrap" style="margin-left: 5px;">
							<hr>
							<p style="font-weight: 100;">사이트 내에서 사용될 이름입니다.</p>
						</div>
						<p id="wrong-nick" style="color: red; margin-top: 15px;">중복된
							닉네임입니다.</p>
						<p id="wrong-nick2" style="color: red; margin-top: 15px;">닉네임은
							세글자 이상입니다.</p>
						<p id="wrong-nick3" style="color: red; margin-top: 15px;">닉네임이
							중복됩니다.</p>
					</div>
					 성별
					<div class="gender">

						<div class="gender-box">
							<input type="radio" value="M" name="mGender">남자 <input
								type="radio" value="F" style="margin-left: 15px;" name="mGender">여자
						</div>
						<p id="wrong-gender" style="color: red; margin-top: 15px;">성별을
							체크해 주세요</p>
					</div>
					생일
					<div class="birth" style="margin-top: 20px;">


						<select id="year" title="select-year"
							style="width: 80px; padding-left: 35px" name="year">
							<option selected="selected">년</option>
							<c:forEach begin="0" end="100" var="year">
								<option>${ 2018-year }</option>
							</c:forEach>
						</select> <select id="month" style="width: 80px; padding-left: 50px;"
							name="month">
							<option selected="selected">월</option>
							<c:forEach begin="1" end="9" var="month">
								<option>0${month }</option>
							</c:forEach>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select> <select id="day" style="width: 55px; padding-left: 20px;"
							name="day">

							<option selected="selected">일</option>
							<c:forEach begin="1" end="9" var="day">
								<option>0${day }</option>
							</c:forEach>
							<c:forEach begin="10" end="31" var="day">
								<option>${day }</option>
							</c:forEach>
						</select>
						<p id="wrong-birth" style="color: red; margin-top: 15px;">생년월일을
							제대로 입력해주세요.</p>
					</div>



					<button type="button" class="sign-up-btn" onclick="signUp()">가입하기</button>
				</div>
				<input style='display: none' name="mBirth" id="birth-">
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
		$("#check-pwd2").hide();
	})	
	
	
 	
		
	function checknext(){
		
		$(".first-wrap").animate({left:'-150px;'})
		var check=  /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/;
		var id=$("#id").val();
		var pwd=$("#password").val();
		var mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email=$("#email").val();
		var code1=$("#code1").val();
		var code2=$("#code2").val();
	
		
		if(code1==code2){
				$("#first-wrap").hide();
				$("#login-form").animate({"height":"96%"});
				$("#wrong-email").hide();
				$("#wrong-email2").hide();
				$("#check-pwd").hide(); 
				$("#second-wrap").fadeIn(); 	
				$("#login-form").css("margin-top","10px");
				$(".logo").css("height","15%"); 
				$("body").css("overflow","auto");
			}
		
		else {
			$("#wrong-email").hide();
			$("#wrong-email2").hide();
			swal("이메일 코드 오류","이메일 코드인증번호를 확인해 주십시오.","error");
		}
					
				
			
						
				
				
				
		}
			
			
			
		
		function signUp(){
		
		var check=  /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/;
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
		
		
		var pwd1=$("#password1").val();
		var pwd2=$("#password2").val();
			
		
		if(pwd1==pwd2&&pwd1.length>=3&&check.test(id) && nameExp.test(name) && nick.length>=3 &&gender==true && birthExp.test(birth) ){
			$.ajax({
			
				url: "checkContent.lo",
				type:"post",
				data:{nick:nick},
				
				
				success:function(data){
					
					if(data.message==0){
						
						$("#login-Form2").submit();
						
						
					}
				    if(data.message==1){
				    	
				    	$("#wrong-nick3").show();
					    
				    }
					
				},
				error:function(data){
					alert("실패");
				}
				
			})
			
			
			
			
		}
		if(pwd1!=pwd2|| pwd1.length<3){
			
				if(pwd1!=pwd2){
					
					$("#check-pwd2").show();
							
					
				}	
				if(pwd1.length<3){
					
					$("#check-pwd").show();
					
					
				}
		}else{
			
			$("#check-pwd").hide();
			$("#check-pwd2").hide();
			
			
		}
		
		if(!check.test(id)){
			
			 $("#check-phone").show();
			 $("#wrong-nick3").hide();
			   
		
		}else{
			
			 $("#check-phone").hide();
			 $("#wrong-nick3").hide();
		}
		
		
		if(!nameExp.test(name)){
			$("#wrong-nick3").hide();
			$("#wrong-name").show();
			 $("#wrong-nick3").hide();
			
		}else{
			
			$("#wrong-name").hide();
			 $("#wrong-nick3").hide();
		}
		if(nick.length<3){
			$("#wrong-nick3").hide();
			$("#wrong-nick2").show();
			 $("#wrong-nick3").hide();
		}else{
			 $("#wrong-nick3").hide();
			$("#wrong-nick2").hide();
		}
		
		if(gender==false){
			$("#wrong-gender").show();
			 $("#wrong-nick3").hide();
		}else{
			
			$("#wrong-gender").hide();
			 $("#wrong-nick3").hide();
		}
		if(!birthExp.test(birth)){
			 $("#wrong-nick3").hide();
			$("#wrong-birth").show();
		}else{
			 $("#wrong-nick3").hide();
			$("#wrong-birth").hide();
		}
	
		
	}
	
	
	</script>

	<!--REST API google API oauth 에서 안내->OAUTH 2.0 for side web apps....>>step5. follwing sample  -->
	<!--POST /oauth2/v4/token HTTP/1.1  <-- googleapis.com/뒤에올것
Host: www.googleapis.com
Content-Type: application/x-www-form-urlencoded <=enctype
---밑의정보 붙이기--
code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7&
client_id=your_client_id&
client_secret=your_client_secret&
redirect_uri=https://oauth2.example.com/code&
grant_type=authorization_code  -->

	<!--enctype은 컨트롤 스페이스로 생성되는것  -->


	<!-- 구글로그인 -->
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
			    		$("#email").val(mEmail);
						$("#mName").val(mName);
						$("#socialId").val(socialId);
						$("#password").val(socialId);
						$("#password").attr("type","hidden");
						
				
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

	<!-- 네이버로그인단  -->
	<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "a6glrihgFQY0OYBb4qYz",
			callbackUrl: "http://localhost:8001/forest/enter.lo",
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
				
					$("#email").val(mEmail);
					$("#mName").val(mName);
					$("#socialId").val(socialId);
					$("#password").val(socialId);
					$("#password").attr("type","hidden");
					
				} else {
				console.log("callback 처리에 실패하였습니다.");
			}
			
			


		});
	});
	
	function mailCheck(){
		
		var mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email=$("#email").val();
		
	  if(mailExp.test(email)){
		$.ajax({
			
			url: "checkMail.lo",
			type:"post",
			data:{email:email},
			success:function(data){
				
				if(data.result==0){
						swal("이메일로 코드가 발송되었습니다.","화면이 전환되면 코드를 입력해 주십시오.");
					
						$("#login-form").css("height","53%");
						$("#wrong-email").hide();
						$("#wrong-email2").hide();
						$(".mail-check-btn").css("display","none");	
						$.ajax({
							 
							url:"sendMail.lo",
							type:"post",
							data:{email:email},
							success:function(data){
								$("#check-btn").css("display","block");
								$("#code2").val(data.code);
								$("#code1").attr("type","text");
							
							}
						  })
					    }else{
							$("#wrong-email2").show();
							$("#wrong-email").hide();
							$("#social-login").css("height","110px");
						}
					}
				})
	  }else{
		  $("#wrong-email2").hide();
		  $("#wrong-email").show();
		  
			
			
	  
	  } 
	  }
	

	$(function(){
		var socialId="";
	
		if(${!empty socialId}) { 
			
			socialId='${socialId}';
			$("#first-wrap").hide();
			$("#second-wrap").show();
			$("#email").val("${mEmail}");
			$("#mName").val("${mName}");
			$("#login-form").css("height","55%");
			$("#login-form").css("margin-top","80px");
			$(".logo").css("height","10%");
			$(".login-form").css("height","80%");
			$(".sign-up-btn").css("margin-top","30px");
		}
		
		
		
		
		
	});
	
	
	

</script>


</body>
</html>
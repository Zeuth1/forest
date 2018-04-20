<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/changePwd.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>


	<div class="background"  >
	<button class="enter-site"  onclick="location.href='enter.lo'">회원가입</button>
	<button class="enter-site2"  onclick="location.href='gotomain.lo'">로그인</button>
	
	<img  id="background" class="background" src="/tree/${ aName }"/>
			<div class="find-id-wrap">
				<div class="find-id" >
						<h3>비밀번호 변경</h3>
						<hr>	
			<form action="changePwd.lo" method="post" id="form">
					<div class="exp-wrap">
						<p style="font-size:12px; margin-top:30px;">변경할 비밀번호를 입력하세요.</p>
						<input id="pwd1" type="password" name="mPwd" maxlength="11" id="phone-check" placeholder="비밀번호" style="width:13.5%; position:absolute; margin-top:-7px;">
						<p style="font-size:12px; margin-top:30px;">비밀번호를 다시 입력하여 주세요</p>
						<input id="pwd2" type="password" maxlength="11" id="phone-check" placeholder="비밀번호 확인" style="width:13.5%; position:absolute; margin-top:-7px;">
						
						<p id="check-pwd1" style="color:red; font-size:10px; margin-top:35px;">비밀번호가 일치하지 않습니다.</p>
						<p id="check-pwd2"style="color:red; font-size:10px; margin-top:35px;">비밀번호는 세글자 이상이어야 합니다.</p>
						<input type="hidden" name="mId" value="${mId }">
						</div>
			
			</form>
				</div>
				<div id="check-btn-wrap" class="check-btn-wrap">
						<button type="button" class="find-btn" onclick="change();">변경하기</button>
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
		
	$(function(){
		
		$("#check-pwd1").hide();
		$("#check-pwd2").hide();
		
	})
	
	function change(){
		id=${mId};
		pwd1=$("#pwd1").val();
		pwd2=$("#pwd2").val();
		
		if(pwd1.length>=3 && pwd1==pwd2){
			
			$("#form").submit();
			
			
		}
		
		
		if(pwd1.length<3) {
			$("#check-pwd1").hide();
			$("#check-pwd2").show();
			$("#check-btn-wrap").css("margin-top","30px");
			
		}
		if(pwd1!=pwd2){
			
			$("#check-pwd2").hide();
			$("#check-pwd1").show();
			$("#check-btn-wrap").css("margin-top","30px");
			
		}
		
		
	}


</script>





</body>
</html>
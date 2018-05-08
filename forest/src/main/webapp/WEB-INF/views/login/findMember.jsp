<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/findMember.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="background"  >
	<button class="enter-site"  onclick="location.href='enter.lo'">회원가입</button>
	<button class="enter-site2"  onclick="location.href='gotomain.lo'">로그인</button>
	
	<img  id="background" class="background" src="/tree/${ aName }" >
	
			<div class="find-id-wrap">
				<div class="find-id" >
						<h3>계정 찾기</h3>
						<hr>	
					<div class="exp-wrap">
						<p style="font-size:12px;">가입하신 메일로 인증 번호를 발송합니다.</p>
						<input  id="phone-check" placeholder="이메일을 입력하세요." style="width:13.5%; position:absolute; margin-top:-7px;">
						<p id="check-phone"style="color:red; font-size:10px; margin-top:30px;">이메일 주소를 제대로 입력하세요</p>
						<p id="check-phone2"style="color:red; font-size:10px; margin-top:30px;">존재하지 않는 아이디 입니다.</p>
						<p id="code-font" style="font-size:12px; display:none;">인증코드를 입력해주세요</p>
						<input id="check-code" style="width:13.5%; position:absolute; margin-top:-7px;" type="hidden">
						<input id="check-code2" type="hidden">
					</div>
			
				</div>
				<div id="check-btn-wrap" class="check-btn-wrap">
						<button class="cancel-btn" onclick="location.href='login.lo'">취소</button><button class="find-btn" onclick="find();">검색</button>
				</div>	
				<div id="check-btn-wrap2" class="check-btn-wrap" style="display:none;">
						<button class="cancel-btn" onclick="location.href='login.lo'">취소</button><button class="find-btn" onclick="sendCode();">발송</button>
				
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
		
		$("#check-phone").hide();
		$("#check-phone2").hide();
		
	})
	
	function sendCode(){
		var id=$("#phone-check").val();
		var code1=$("#check-code").val();
		var code2=$("#check-code2").val();
		
		if(code1==code2)  location.href="checkPwd.lo?mId="+id; 
		
		
		
		
	}
	
	
	
	
	
	

	function find(){
		var mailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var id=$("#phone-check").val();
		
		if(mailExp.test(id)){
			
			$.ajax({
			
				url:"checkPhone.lo",
				type:"post",
				data:{id:id},
				success:function(data){
					
				
					if(data.check==0) {
						$("#check-phone2").show();
						$("#check-phone").hide();
						$("#check-btn-wrap").css("margin-top","0");
				
						
					}
					else{
						
						$.ajax({
						
							url:"sendCode.lo",
							type:"get",
							data:{id:id},
							success:function(data){
								
								
								$("#check-code2").val(data.code);
								
							}
							
						})
						
						
						$("#check-phone2").hide();
						$("#check-phone").hide();
						$("#phone-check").attr("type","hidden");
						$("#code-font").css("display","block");
						$("#check-code").attr("type","text");
						$(".check-btn-wrap").css("display","none");
						$("#check-btn-wrap2").css("display","block");
						$(".check-btn-wrap").css("margin-top","13px");
						
					}
						
					 
					
					
				}
				
				
				
				
				
			});
			
			
			
			 
		}else{
			
			$("#check-phone").show();
			$("#check-btn-wrap").css("margin-top","0");
			$("#check-phone2").hide();
			
		}
		
		
		
		
		
	}



</script>





</body>
</html>
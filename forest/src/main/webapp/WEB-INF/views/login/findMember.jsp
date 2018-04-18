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
	
	<img  id="background" class="background" src="resources/images/${ aName }" >
	
			<div class="find-id-wrap">
				<div class="find-id" >
						<h3>계정 찾기</h3>
						<hr>	
					<div class="exp-wrap">
						<p style="font-size:12px;">계정을 검색하시려면 전화번호를 입력하세요.</p>
						<input maxlength="11" id="phone-check" placeholder="휴대폰" style="width:13.5%; position:absolute; margin-top:-7px;">
						<p id="check-phone"style="color:red; font-size:10px; margin-top:30px;">휴대폰 번호를 제대로 입력하여 주십시오.</p>
						<p id="check-phone2"style="color:red; font-size:10px; margin-top:30px;">존재하지 않는 아이디 입니다.</p>
					
					</div>
			
				</div>
				<div id="check-btn-wrap" class="check-btn-wrap">
						<button class="cancel-btn" onclick="location.href='login.lo'">취소</button><button class="find-btn" onclick="find();">검색</button>
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
	
	$(function(){
	
		$("#check-phone").hide();
		$("#check-phone2").hide();
		
	})
	

	

	function find(){
		
		var check=  /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/;
		var id=$("#phone-check").val();
		
		if(check.test(id)){
			
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
					else location.href="checkPwd.lo?mId="+id;
					 
					
					
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
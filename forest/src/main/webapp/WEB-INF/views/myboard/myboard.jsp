<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width:100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  #MyImage{
  	border-radius: 50%;
    width: 200px; 
    height: 200px;
	margin-top:60px;
  }
  .selectmenu{
  	margin-right:1005px;
  }
  .lockImages{
  	width:40px;
  	height:40px;
  }
    input {
  	  border: 2px solid #7BA7AB;
  	  border-radius: 5px;
 	  outline: none;
	  color: #9E9C9C;
	}
	input:active,input:hover{
		background: #F9F0DA;
	}
	#boardImages{
		margin:10px;
		width:370px;
		height:200px;
	}
	#boardImages2{
		margin:10px;
		width:370px;
		height:200px;
	}
	.col-sm-4{
		display: inline-block;
		width:380px;
		height:260px;
	}
	.col-sm-3{
		display: inline-block;
		width:380px;
		height:260px;
	}

	#mem{
		margin-top:65px;
	}
	#SI{
		margin-right:850px;
	}
	
		.overlay {
  display: none;
  z-index: 100;
  position: fixed;
  width: 100%; height: 100%;
  left: 0; top: 0;
  background-color: rgba(0,0,0, 0.4);
  overflow-x: hidden;
}
	#modal{
    z-index:200;
  }
	
	
#blurExample, #noneblurExample {

background-size:cover;
width:370px;
height:200px;
position: relative;
z-index:1;
float:left;
margin:10px;
overflow:hidden;
}

.bgBlur:before {
  content: '';
  position: absolute;
  top: 0; left:0; right:0; bottom:0;
  background: inherit;
  z-index:-1;
  filter: blur(5px); 
  -webkit-filter: blur(6px); 
  -moz-filter: blur(6px);
  -o-filter: blur(6px);
  -ms-filter: blur(6px);
  filter: url(#blur);
}

  </style>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
		<div class="overlay"></div>
   		<div id="main" style="width:1278.4; height:250px; border-top:1px solid; border-bottom:1px solid; border-style:inset;">
			<div style="float:left; width:900px; height:250px; margin-right:200px;" align="center">
   		   		<div style="margin-right:300px; margin-top:80px;">

   		   			<label style="font-size:50px; color:#696969;">${ sessionScope.loginUser.mNickName  }</label>
   		   			
   		   			<div style="margin-top:20px;">
   		   			<label onclick="" style="color:#808080;">팔로워:1</label>
   		   			<label onclick="" style="color:#808080;">팔로윙:1</label>
   		   			<p><textarea cols="60" rows="3" style="outline:none; resize:none; border:0px; margin-left:200px" disabled;>몸매도좋아 얼굴도이뻐 다좋아.</textarea></p>
   		   			</div>
   		   		</div>
			</div>			
			<div style="float:left; width:300px; height:250px;">
				<img src="<%= request.getContextPath() %>/resources/images/test2.jpg" id="MyImage" style="cursor: pointer;">
			</div>
		</div>   		      
    
  		<br>
		<div class="container text-center">    
 		 <div class="selectmenu" style="margin-left:160px;">
 		 <button class="btn btn-default">작품</button>
 		 <!-- <button class="btn btn-default" onclick="location.href='myBoardFin.my'">핀</button> -->
 		 <button class="btn btn-default">보드</button>
 				<select id="korea" class="btn btn-default" style="float:right; margin-right:-800px;">
 			 		<option value="가나다순">가나다순</option>
 			 		<option value="abcd순">abcd순</option>
 				</select>
 		 </div>
 		 <br>
  		<div class="row" id="SF" style="margin-left:150px;" >
  		<input type="hidden" id="User_No" name="User_No" value="${ sessionScope.loginUser.mNo }">
  		  <div class="col-sm-3">
    		  <img id="boardAdd" src="<%= request.getContextPath() %>/resources/images/addimages.jpg" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
   		 </div>



<!--  <div id="blurExample" class="bgBlur" style="background:url(/tree/0test4.jpg); width:380px; height:260px; ">
	<img >
</div>
<div id="blurExample" class="bgBlur" style="background:url(/tree/0test4.jpg);">
	<img style="background:url(/tree/0test4.jpg);">
</div>
<div id="blurExample" class="bgBlur" style="background:url(/tree/0test4.jpg);">
	<img style="background:url(/tree/0test4.jpg);">
</div>
<div id="blurExample" class="bgBlur" style="background:url(/tree/0test4.jpg);">
	<img style="background:url(/tree/0test4.jpg);">
</div>	
<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
   <filter id="blur">
   <feGaussianBlur stdDeviation="6" />
   </filter>
</svg> -->

		
		</div>
 		 <hr>
		<div class="row">
			<div align="center">
				<p style="margin-right:490px"><img class="lockImages" src="<%= request.getContextPath() %>/resources/images/Lock.jpg"><label>비밀보드!</label></p>
				<label>회원님과 회원님이 초대한 사람들만이 이 보드들을 볼 수있습니다. </label> <label><a style="cursor: pointer">자세히알아보기</a></label>
			</div>
		</div>
		<hr>
		<div class="col-sm-4" onclick="gomodal();" style="margin-left:150px;">
    		  <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  <p>비밀보드</p>
   		</div>
		</div><br>
		
		
		<hr>
		<footer class="container-fluid text-center">
 			<p>Footer Text</p>
		</footer>



<div id="modal" style="background:white; position:fixed; top:10%; right:23%; ">

</div>		


<script>
	
	/* 셀렉트 보드! */
	$(function(){
		var User_No = $("#User_No").val();
		var korea = $("#korea").val();
		console.log("hihi"+korea);
		$.ajax({
			url:"myBoardSelect.my",
			method:"POST",
			data:JSON.stringify(User_No),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				var arr = data.userNo;
				var detail = data.userNo[i];
				console.log(data.userNo);
				for(var i = 0; i< arr.length; i++){
					console.log(data.userNo[i].board_No);
					var board = data.userNo[i].board_No;
					$("#SF").append(
							'<div style="text-align:center" class="col-sm-4" id="'+board +'">'+
							'<img id="boardImages2" src="/tree/0test4.jpg" class="img-responsive" style=" cursor: pointer;">'+
							'<lable>'+ data.userNo[i].board_Title +'</label>'+
							'</div>'
						);
				}
			}
		});
		var selectView = $("#selectView").val();
		console.log(selectView);
		$("#korea").click(function(){
			console.log($("#korea").val());
		})
		
	});
	
	$(document).on('click', function(e){
	   if( $(e.target).is( $('.col-sm-4') ) || $(e.target).parent().is( $('.col-sm-4') )  ){
		   if( $(e.target).is( $('.col-sm-4') ) ){
			   console.log( $(e.target).attr('id') );
		   }
		   if( $(e.target).parent().is( $('.col-sm-4') )  ){
			   console.log( $(e.target).parent().attr('id'));
			   location.href="myBoardStore.my?board="+$(e.target).parent().attr('id');
		   }
	   }
	   
	})
	
	$(document).on('click', function(e){
		if( $(e.target).is('#boardAdd') ){
			$('#modal').css('display','inline-block');
			$('#modal').load('boardAddForm.my');
			$('.overlay').css('display', 'inline-block');
			
		}
	})
	
	$(document).on('click', function(e){
		if( $(e.target).is('#action2') ){
			$('#modal').css('display','none');
			$('.overlay').css('display', 'none');
		}
	})	
	
	
	
	
	
	
	
</script>
</body>
</html>
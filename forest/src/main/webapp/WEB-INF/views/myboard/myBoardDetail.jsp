<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	.save-btn{
		position:absolute;	
	    margin-left: 315px;
  	    margin-top: 18px;
  	    border: none;
		display:none;
	}

    /* Remove the navbar's default margin-bottom and rounded borders */ 
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  #MyImage{
  	border-radius: 50%;
    width: 200px; 
    height: 200px;
    position: relative;
    display: inline-block;
    float:right;
    margin-top:200px;
    top:50px;
  }
  .selectmenu{
  	margin-right:950px;
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
		top:0px;
	}
	.title{
		font-size:50px;
		margin-left:410px;
	}
	.col-sm-4{
		top:0px;
	}
	.saveSelectBoard{
		background:lightgray;
		height:40px;
	}
	.saveSelectBoard:hover{
		background:white;
		cursor:pointer;
	}
	


  </style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
		<div>
  		  <div class="carousel-inner" role="listbox">
   		   <div class="item active">
   		   	<div class="carousel-caption">
   		   		<p style="font-size:50px">설 현 !</p>
   		   		<p>1핀</p>
   		   		<p></p>
   		   	</div>
   		   		<img>
   		   		 <div class="carousel-caption">
      		   		<img src="images/test.jpg" id="MyImage" style="cursor: pointer;">
    		    </div>      
    		  </div>
  		  </div>
		</div>
  		<br>
		<div class="container text-center">    
 		 <div class="selectmenu">
 		 	<p class="title">핀</p>
 		 	
 		 </div>	 
 	
  		<div class="row">
  		  <div class="col-sm-4" onclick="gomodal();">
    		  <img id="boardImages" src="images/addimages.jpg" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
   		 </div>
   		 <!-- 수정!!!!!!!!............... -->
   		
   		 <div class="col-sm-4">
   		 	<button id="goSave" onclick="goSave();" class="save-btn" type="button" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">저장</button>
   		   <img id="boardImages" src="images/test.jpg" class="classname" style="width:100%;cursor: pointer;" alt="보드만들기">
   		 </div>
   		 
   		 <div class="col-sm-4">
   			 <button id="goSave" onclick="goSave();" class="save-btn" type="button" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">저장</button>
   		   <img id="boardImages" src="images/test2.jpg" class="classname" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  
   		 </div>
   		 <div class="col-sm-4"> 
   		 <button id="goSave" onclick="goSave();" class="save-btn" type="button" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">저장</button>
   		   <img id="boardImages" src="images/test3.jpg" class="classname" style="width:100%;cursor: pointer;" alt="보드만들기">
    	   
   		 </div>
   		 <div class="col-sm-4"> 
   		 <button id="goSave" onclick="goSave();" class="save-btn" type="button" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">저장</button>
   		   <img id="boardImages" src="images/test4.jpg" class="classname" style="width:100%; height:auto;cursor: pointer;" alt="보드만들기">
    		   
   		 </div>
   		 <div class="col-sm-4"> 
   		 <button id="goSave" onclick="goSave();" class="save-btn" type="button" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">저장</button>
   		   <img id="boardImages" src="images/test5.jpg" class="classname" style="width:100%; height: 100%;cursor: pointer;" alt="보드만들기">
    	  
   		 </div>
   		 
 
		<hr>
		</div><br>
		</div>
		
		<hr>
		<footer class="container-fluid text-center">
 			<p>Footer Text</p>
		</footer>



		
<div class="modal" id="testModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-sm" style="width:700px; height:600px !important;">
		<div class="modal-content" style="width:700px; height:600px !important;">
			<div class="modal-body" style="width:700px; height:600px !important;">
				<h1 align="center">핀 추가하기</h1>
				<hr>
				<div style="width:300px; height:400px; float:left;">
					<!-- 이미지영역에 업로드할 파일들!!! -->
					<img src="../images/test.jpg" style="width:290px; height:400px;">
				</div>
				
				
				<div style="width:300px; height:400px; float:left;">
				<p>웹사이트</p>
				<input type="text" style="width:344px;">
				
				<p>설명<p>
				<textarea cols="45" rows="15" style="resize:none"></textarea>
				</div>
			</div>
			<div class="modal-footer" style="width:700px; height:100px !important;">
				<button type="button" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
				<button type="button" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
			</div>
		</div>
	</div>	
</div>

<!-- 저장용 테스트 모달!! -->
<div class="modal" id="save" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-sm" style="width:700px; height:600px !important;">
		<div class="modal-content" style="width:700px; height:600px !important;">
			
			<div class="modal-body" style="width:700px; height:600px !important;">

				<div style="width:300px; height:400px; float:left;">
					<!-- 이미지영역에 업로드할 파일들!!! -->
					<img src="../images/test.jpg" style="width:290px; height:400px;">
				</div>
				
				<div style="width:300px; height:300px; float:left; overflow-y: scroll">
				<p>보드선택</p>
					<div class="saveSelectBoard">
						보드모음집0
					</div>
					<div class="saveSelectBoard"> 
						보드모음집1
					</div>
					<div class="saveSelectBoard">
						보드모음집2
					</div>
					<div class="saveSelectBoard">
						보으모음집3
					</div>
				</div>
				
				<div style="margin-top:345px;">
				<p>보드생성명<p>
				<textarea id="input" cols="40" rows="1	" style="resize:none"></textarea>
				</div>
			</div>
				
			<div class="modal-footer" style="width:; height: !important;">
				<button type="button" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
				<button type="button" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
			</div>
			
		</div>
	</div>	
</div>


<br><br><br><br><br><br><br><br><br><br>

<script>
	function gomodal(){
		$("#testModal").modal();
	}
	
	function goSave(){
		$("#save").modal();
	}
	
	$("MyImage").mouseover(function(){
		$(this).append("")
	});
	
	$(".classname").mouseover(function(){
		$(".save-btn").show();
	}).mouseout(function(){
		$(".save-btn").css("display","none");
	});
	
</script>
</body>
</html>
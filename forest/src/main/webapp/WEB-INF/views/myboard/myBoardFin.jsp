<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
 .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:250px;
  } 
  
/*   #MyImage{
  	border-radius:50%;
    width: 300px;
    height: 250px;
    position: relative;
    display: inline-block;
  } */
  
  .selectmenu{
  	margin-right:950px;
  }
  #main{
  	
  }
  #follower:hover{
  	
  }
  input,textarea {
  	  border: 2px solid #7BA7AB;
  	  border-radius: 5px;
 	  outline: none;
	  color: #9E9C9C;
	}
	input:active,input:hover{
		background: #F9F0DA;
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
		<div id="main" style="width:1278.4; height:250px; border-top:1px solid; border-bottom:1px solid; border-style:inset;">
			<div style="float:left; width:900px; height:250px;" align="center">
					<p style="font-size:70px">태현 김</p>
   		   		<div>
   		   			<label onclick="" id="follower">팔로워:1</label>
   		   			<label onclick="" style="margin-left:50px;" id="follower">팔로윙:1</label>
   		   		</div>
			</div>
			<div style="float:left; width:300px; height:250px;">
				<img id="MyImage" src="<%=request.getContextPath() %>/resources/images/test.jpg" style="width:260px; height:250px; border-radius:50%; padding-top: 5px;padding-bottom: 5px;cursor: pointer;;">
			</div>
		</div>
		
  		<br>
		<div class="container text-center">    
 		 <div class="selectmenu">
 		 <button class="btn btn-default" onclick="location.href='myBoard.my'">보드</button>
 		 <button class="btn btn-default">핀</button>
 		 <button class="btn btn-default">내 보드</button>
 		 </div>
 		 <br>
  		<div class="row">
  		  <div class="col-sm-4">
    		  <img src="<%=request.getContextPath() %>/resources/images/addimages.jpg" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  	<a data-toggle="modal" href="finAddForm.my" data-target="#testModal" role="button" data-backdrop="static">
					<p>핀추가하기</p>
			    </a>
   		 </div>
   		 <div class="col-sm-4"> 
   		   <img id="boardImages" src="<%=request.getContextPath() %>/resources//images/test.jpg" class="img-responsive" style="width:100%; cursor: pointer;" alt="보드만들기">
    		  <label>이쁘당</label>
    		  <p>너도모르니여유를</p>
   		 </div>	 
 	 </div>
	</div><br>
	
		<footer class="container-fluid text-center">
 		 <p>푸터!!!!!!!</p>
		</footer>

<!-- 페이지에서 모달 다른 모달 페이지불러오게하는법 !!!!!! (핀만들기!)  -->
<!-- <form action="finAdd.my" method="post" encType="multipart/form-data"> -->
<div class="modal" id="testModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-sm" style="width:700px; height:600px !important;">
		<div class="modal-content" style="width:700px; height:600px !important;">
			
		</div>
	</div>	
</div>


<script>

</script>

</body>
</html>
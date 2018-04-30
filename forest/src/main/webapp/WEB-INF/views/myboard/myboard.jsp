<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
/*     .navbar {
      margin-bottom: 0;
      border-radius: 0;
    } */
    
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
	}
	.col-sm-4{
		
		width:380px;
		height:260px;
	}
	
  </style>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

		<div>
  		  <div class="carousel-inner" role="listbox">
   		   <div class="item active">
   		   	<div class="carousel-caption">
   		   		<p style="font-size:50px">${ sessionScope.loginUser.mNickName  }</p>
   		   		<p>팔로워:1</p>
   		   		<p>팔로윙:1</p>
   		   	</div>
   		   		<img>
   		   		 <div class="carousel-caption">
      		   		<img src="<%=request.getContextPath() %>/resources/images/profile.jpg" id="MyImage" style="cursor: pointer;">
    		    </div>      
    		  </div>
  		  </div>
		</div>
  		<br>
		<div class="container text-center">    
 		 <div class="selectmenu">
 		 <button class="btn btn-default">보드</button>
 		 <button class="btn btn-default" onclick="location.href='myBoardFin.my'">핀</button>
 		 <button class="btn btn-default">내 보드</button>
 	
 		 </div>
 		 	<div>
 		 		<select class="btn btn-default" style="float:right" >
 			 		<option>가나다순</option>
 			 		<option>최신항목순</option>
 			 		<option>오래된항목순</option>
 				</select>
 		 	</div>
 		 <br>
  		<div class="row">
  		  <div class="col-sm-4" onclick="gomodal();">
    		  <img id="boardImages" src="<%=request.getContextPath() %>/resources/images/addimages.jpg" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  <a data-toggle="modal" href="boardAddForm.my" data-target="#testModal" role="button" data-backdrop="static">
					<p>보드추가하기</p>
			    </a><p>혹시모르니한줄더여유를..</p>
   		 </div>
   		 <div class="col-sm-4" onclick="detailboard();" > 
   		   <img id="boardImages" src="<%=request.getContextPath() %>/resources/images/test.jpg" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  <label>설현...그녀는...</label>    
   		 </div>
   		 <div class="col-sm-4"> 
   		   <img id="boardImages" src="<%=request.getContextPath() %>/resources/images/test.jpg" class="img-responsive" style="width:100%; cursor: pointer;" alt="보드만들기">
    		  <label>이쁘당</label>
    		  <p>너도모르니여유를</p>
   		 </div>
   		 <div class="col-sm-4"> 
   		   <img id="boardImages" src="<%=request.getContextPath() %>/resources/images/test.jpg" class="img-responsive" style="width:100%" alt="보드만들기">
    		  <p></p>    
   		 </div>
   		 <div class="col-sm-4"> 
   		   <img id="boardImages"src="<%=request.getContextPath() %>/resources/images/test.jpg" class="img-responsive" style="width:100%" alt="보드만들기">
    		  <p></p>    
   		 </div>
   		 <div class="col-sm-4"> 
   		   <img id="boardImages" src="<%=request.getContextPath() %>/resources/images/test.jpg" class="img-responsive" style="width:100%" alt="보드만들기">
    		  <p></p>    
   		 </div>
   		 
 		 </div>
 		 <hr>
		<div class="row">
			<div align="center">
				<p style="margin-right:490px"><img class="lockImages" src="<%=request.getContextPath() %>/resources/images/Lock.jpg"><label>비밀보드!</label></p>
				<label>회원님과 회원님이 초대한 사람들만이 이 보드들을 볼 수있습니다. </label> <label><a style="cursor: pointer">자세히알아보기</a></label>
			</div>
		</div>
		<hr>
		<div class="col-sm-4" onclick="gomodal();">
    		  <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%;cursor: pointer;" alt="보드만들기">
    		  <p>비밀보드 만들기</p>
   		</div>
		</div><br>
		
		
		<hr>
		<footer class="container-fluid text-center">
 			<p>Footer Text</p>
		</footer>



		
<!-- <div class="modal" id="testModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-sm" style="width:700px; height:600px;">
		<div class="modal-content" >
			<div class="modal-body" style="width:700px; height:600px;">
				<h1>보드만들기</h1>
				<hr>
				이름: <input type="text" id="input">
			</div>
			<div class="modal-footer" style="width:350px; height:70px;">
				<button type="button" class="btn" data-dismiss="modal"style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
				<button type="button" class="btn" data-dismiss="modal"style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
			</div>
		</div>
	</div>
</div> -->

<br><br><br><br><br><br><br><br><br><br>

<script>

	function detailboard(){
		location.href="myBoardDetail.my";
	}
</script>
</body>
</html>
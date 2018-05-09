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
       /* Set width to 100% */
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
  	margin-top:65px;
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
	.col-sm-4{
		display: inline-block;
		width: 200px;
  		height: 100px;
  		margin: 1em;
	}
	.img-responsive{
		width:100%;
		height:200%;
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
  
  </style>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	<div class="overlay"></div>
		<div id="main" style="width:1278.4; height:250px; border-top:1px solid; border-bottom:1px solid; border-style:inset;">

			<div style="float:left; width:900px; height:250px; margin-right:200px;" align="center">
					<p style="font-size:70px; color:#696969;">${ sessionScope.loginUser.mNickName  }</p>

			
   		   		<div>
   		   			<label onclick="" style="color:#808080;">팔로워:1</label>
   		   			<label onclick="" style="margin-left:50px; margin-bottom:150px; color:#808080;">팔로윙:1</label>
   		   		</div>
			</div>
			<div style="float:left; width:300px; height:250px;">

				<img id="MyImage" src="<%=request.getContextPath() %>/resources/images/test.jpg" style="width:260px; height:250px; border-radius:50%; padding-top: 5px;padding-bottom: 5px;cursor: pointer;">
			</div>
		</div>
		
  		<br>
		<div class="container text-center">    
 		 <div class="selectmenu">
 		 <button class="btn btn-default" onclick="location.href='myBoard.my'">보드</button>
 		 <button class="btn btn-default">내 보드</button>
 		 </div>
 		 <br>
  		<div class="row" id="SF">
  		<input type="hidden" id="User_No" name="User_No" value="${ sessionScope.loginUser.mNo }">
  		<input type="hidden" id="STORE_NO" name="STORE_NO">
  		<input type="hidden" id="BOARD_NO" name="BOARD_NO">
  		  <div class="col-sm-4">

    		  <img id="finadd" src="<%= request.getContextPath() %>/resources/images/addimages.jpg" class="img-responsive" style="cursor: pointer;" alt="보드만들기">
    		  	<!-- <a data-toggle="modal" href="finAddForm.my" data-target="#testModal" role="button" data-backdrop="static"> -->
					
			    <!-- </a> -->
   		 </div>

 	 </div>
	</div><br>
	
		<footer class="container-fluid text-center">
 		 <p>푸터!!!!!!!</p>
		</footer>



<div id="modal" style="background:white; position:fixed; top:10%; right:23%; ">

</div>

<script>

//셀렉트 
var board = '${board}';
console.log(board);
	$(function(){
		var board = '${board}';
		console.log(board);
		var User_No = $("#User_No").val();
		var board = '${board}';
		var img = '<img id="boardImages" src="<%= request.getContextPath() %>/resources/images/test2.jpg" class="img-responsive" style="width:100%; cursor: pointer;">';
		$.ajax({
			url:"myBoardFinSelect.my",
			method:"POST",
			data:JSON.stringify(board),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log(data.board);
				var arr = data.board;
				console.log(arr.length);
				
				for(var i = 0; i < arr.length; i++){
					
					$("#SF").append(
							'<div class="col-sm-4">'+
							'<img id="boardImages" src="/tree/' + data.board[i].tree_After + '"'+'class="img-responsive" style=" cursor: pointer;">' +
							'</div>'
						);
				} 
				
			}
		});
		console.log("hi");
	});
	
	$(document).on('click', function(e){
		if( $(e.target).is('#finadd') ){
			$('#modal').css('display','inline-block');
			$('#modal').load('finAddForm.my');
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
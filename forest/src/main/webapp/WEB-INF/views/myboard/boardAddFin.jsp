<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardAddForm.my" id="fileUpload">
	<div class="modal-content" style="width:700px; height:600px !important;">
			
			<div class="modal-body" style="width:700px; height:600px !important;">

				<div style="width:300px; height:400px; float:left;">
					<!-- 이미지영역에 업로드할 파일들!!! -->
					
					<img src="<%= request.getContextPath() %>/resources/images/test4.jpg" style="width:290px; height:400px;">
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
				<button type="button" onclick="test();" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
				<button type="button" onclick="test1();" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
			</div>
			
		</div>
		</form>
	<script>
		function test(){
			$("#fileUpload").submit();
		}
		function test1(){
			$("#fileUpload").reset();
		}
	</script>
	
</body>
</html>
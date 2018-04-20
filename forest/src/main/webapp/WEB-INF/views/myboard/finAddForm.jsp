<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
 .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:250px;
  } 
  .selectmenu{
  	margin-right:950px;
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="finAdd.my"encType="multipart/form-data" id="fileUpload" name="fileUpload">
			<div class="modal-content" style="width:700px; height:600px !important;">
				<div class="modal-body" style="width:700px; height:600px !important;">
					<h1 align="center">핀 만들기</h1>
					<hr>
					<div style="width:300px; height:400px; float:left;">
						<input type="file" id="photo" name="Tree_Before" style="width:290px; height:400px;">
					</div>
					
					<div style="width:300px; height:400px; float:left;">
					<p>웹사이트XXXX뺼꺼임</p>
					<input type="text" style="width:344px;">
					
					<p>설명<p>
					<textarea id="content" name="Tree_Tag" cols="45" rows="15" style="resize:none"></textarea>
					</div>
				</div>
				<div class="modal-footer" style="width:700px; height:100px !important;">
					<button id="action" onclick="test();" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
					<button id="action2" onclick="test1();" class="btn" data-dismiss="modal" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
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
<<<<<<< HEAD
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
	.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
	
  
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="all">
	<form action="boardAdd.my" id="frm" name="frm" method="post">
			<div class="modal-content" style="width:700px; height:350px !important;">
				<div class="modal-body" style="width:700px; height:350px !important;">
					<h1 align="center">보드 만들기</h1>
					<hr>					
					<div style="width:50px; margin-left:50px;">
						<p>보드명<p>
					</div>
					<div style="float:right; margin-right:50px; margin-top:-38px; ">
						<input type="hidden" name="User_No" value="${ sessionScope.loginUser.mNo }">
						<input type="hidden" name="Board_No">
						<input type="hidden" name="Board_Date">
						<textarea id="content" name="Board_Title" cols="60" rows="1" style="resize:none"></textarea>
					</div>
					
					<div style="width:120px; float:left; margin-top:50px; margin-left:50px;">
						<p>비밀보드만들기</p>
					</div>
					
					<div style="float:left; margin-top:65px; margin-left:70px;">   
						<label class="switch">
  							<input type="checkbox" id="box">
  							<span class="slider round"></span>
						</label>
  						<input type="hidden" name="Board_Type" value="A">
     			    </div>
					
				</div>
				<div style="float:right; margin-right:50px; margin-bottom:30px;">
					<button id="action" type="button" onclick="test();" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">만들기</button>
					<button id="action2" type="button" onclick="test1();" style="border: 2px solid #7BA7AB;border-radius: 5px;outline: none;">닫기</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		$("#box").click(function(){
			console.log("1");
		})
		
		function test(){
			$("#p_name").val();
			$("#frm").submit();
			
		}

	</script>
	
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<div class="modal-body" style="width:700px; height:600px !important;">

				<div style="width:300px; height:400px; float:left;">
					<!-- 이미지영역에 업로드할 파일들!!! -->
					<img src="<%=request.getContextPath() %>/resources/images/test.jpg" style="width:290px; height:400px;">
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
		</form>
</body>
>>>>>>> 2743c033e4a70ffca4d7cbf94bd286ba425ecf25
</html>
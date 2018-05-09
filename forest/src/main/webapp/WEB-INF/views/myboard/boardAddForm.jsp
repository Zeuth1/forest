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

						<input type="hidden" name="User_No" id="User_No_AddForm" value="">
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
	</form>
		</div>
	<script>
	
	    $('#User_No_AddForm').val(User_No);
	
		$("#box").click(function(){
			console.log("1");
		})
		
		function test(){
		
			$("#p_name").val();
			$("#frm").submit();
			
		}

	</script>
	
</body>

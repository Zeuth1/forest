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
	<form action="finAdd.my" encType="multipart/form-data" id="frm" name="frm" method="post">
			
					<h1 align="center">핀 만들기</h1>
					<hr>
					<div id='View_area'  style="width:500px; height:500px; float:left; ">
						<input type="hidden" name="Tree_No">
						<input type="hidden" name="User_No" value="${ sessionScope.loginUser.mNo }">
						<input type="hidden" name="Tree_Date" >
						<input id="boardNo" type="hidden" name="board">
						<!-- <input type="file" id="photo" name="Tree_After" style="width:290px; height:400px;"> -->
						<input type="hidden" id="p_name"name="tree_before">	
						<input type="file" name="Tree_After" id="photo" onchange="previewImage(this,'View_area')" style="width:290px;">
						<div></div>
					</div>		<!-- id,name값    profile_pt -->
			
					<div style="width:300px; height:100px; float:left;">
					<p>설명<p>
					<textarea id="content" name="Tree_Tag" cols="40" rows="1" style="resize:none"></textarea>
					</div>
					<div style="">
						<label>비밀글설정</label>
						<p></p>
						<label class="switch">
  							<input type="checkbox" id="box">
  							<span class="slider round"></span>
						</label>
						<input type ="hidden" name="Tree_Type" id='treeType' value="A">
     			    </div>
				
					<div style="margin-top:250px; margin-right:20px; float:right;">
					<button type="button" id="action" onclick="test();">만들기</button>
					<button type="button" id="action2" onclick="test2();">닫기</button>
					</div>
	</form>
	</div>
	<script>
		/* 파일미리보기 */
	
	
	
	function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '85%'; 
			img.style.height = '90%';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
		
		console.log(board);
		function test(){
			$('#boardNo').val(board);
			
			$('#frm').submit();
		}
		/* function test2(){
			$('#frm').reset();
		} */
		
		$(document).ready(function(){
			$("#box").change(function(){
				if($("#box").is(":checked")){
					$("#treeType").val("N");
					console.log($("#treeType").val());
				}else{
					$("#treeType").val('A');
					console.log($("#treeType").val());
				}
			});
		});
		
		
		
		
	</script>
	
</body>
</html>
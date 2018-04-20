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
		</form>
</body>
</html>
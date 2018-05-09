<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $.noConflict();
    $( "#datepicker" ).datepicker();
    $("#datepicker2").datepicker();
  } );
  </script>
<title>Forest-MyPage</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myPage.css">
</head>
<body>
		 <jsp:include page="../common/menubar.jsp"/>
		
<div class="total-wrap">
	<div class="left-wrap">
			<p onclick="scrolling(100)">계정기본정보</p>
			<p onclick="scrolling(590)">프로필</p>
			<p onclick="scrolling(1000)">후원 내역 조회</p>
		
		
	</div>
	<div class="right-wrap">
		
			<h1 class="scroll1">계정 기본정보</h1>
			<p>이메일주소</p>
			<input type="email" value="${loginUser.mEmail }" class="mEmail" name="mId" readonly>
			<p>비밀번호</p>
			<button class="pwd-change-btn" id="myBtn">비밀번호 변경</button>
			<p>성별</p>
	 	<div class="gender-wrap">
	 	<c:choose>
	 		<c:when test="${loginUser.mGender=='M' }">
			<div class="checks">
                      <input type="radio" id="ex_rd"  value="M" name="mGender" checked="checked"> 
                      <label for="ex_rd">남성</label> 
                       <input type="radio" id="ex_rd2" value="F"name="mGender"> 
                      <label for="ex_rd2">여성</label> 
            </div>
            </c:when>
            <c:otherwise>
            			 <input type="radio" id="ex_rd" name="mGender"> 
                      <label for="ex_rd">남성</label> 
                       <input type="radio" id="ex_rd2" name="mGender" checked="checked"> 
                      <label for="ex_rd2">여성</label> 
            
            </c:otherwise>
         </c:choose>   
		</div>
		<p>검색기록</p>
		<button class="history-" type="button"  onclick="deleteSearch();">최근 검색 기록 지우기</button>
		
		 <b class="text">추천 검색어에서 최근 검색한 기록을 제거하세요.</b>	
		<br><br><br>
		
		계정
		<br>
		
		<button class="succession-btn" onclick="succession();">계정 비활성화</button>
		<br><br>
		<h1 class="scroll2">프로필</h1>
		 
		사진
		<br>
		<c:choose>
			<c:when test="${empty profile}">
		<img id="profile" src="<%=request.getContextPath()%>/resources/images/basic_profile.png" style="border-radius:50%; width:60px; margin-top:5px; position:absolute;">
			</c:when>
			<c:otherwise>
		<img id="profile" src="/tree/${profile }" style="border-radius:50%; width:60px; margin-top:5px; position:absolute;">
			</c:otherwise>
		</c:choose>	
		<!--사진변경모달  -->
		<button class="change-pic" id="myBtn2">사진 변경</button>
 
			    <!-- The Modal -->
			    <div id="myModal2" class="modal2">
			 
			      <!-- Modal content -->
						  	 <form id="fileForm" action="changePic.set" method="post" encType="multipart/form-data">
			      <div class="modal-content2">
			      <span class="close2">&times;</span> 
			       <div class="change-pic-subject">사진 변경 </div>
					 <div class="change-pic-btn">
			             <label class="fileContainer">
						  	 사진선택
						    <input type="file"onchange="changePic()" name="photo">
						</label>
					 </div>
			      </div>
			</form>
			 
   				 </div>
		
		<!--사진변경 모달끝  -->
		<br><br>
		사용자이름
		<br> 
		<input type="text" value="${loginUser.mName}" class="mName" name="mName">
		<br><br>
		자기소개
		<br>
		<c:choose>
			<c:when test="${empty introduce }">
		<textarea class="introduce" id="mIntroduce"></textarea>
			</c:when>
			<c:otherwise>
		<textarea class="introduce" id="mIntroduce" >${introduce }</textarea>	
			</c:otherwise>
		</c:choose>	
		<br><br>
		<h1 class="scroll3">후원 정보조회</h1>
		<div class="giver-wrap">
		<button id="giveMoney" class="giveMoney" onclick="giveMoney();">내가 참여한 후원</button><button id="takeMoney" class="takeMoney" onclick="takeMoney();">내가 받은 후원</button>
			<div class="switch-wrap">
			<p>후원내역보기</p>	
			<label class="switch" onclick="showGive();">
			  <input type="checkbox">
			  <span class="slider"></span>
			</label>
			</div>
		<hr>
		</div>	
		
		
		<div class="look-up-wrap" id="tab1">
			<div class="division-wrap">
				후원구분  
				<select>
					<option selected="selected">전체보기</option>
					<option>일시후원</option>
					<option>정기결제</option>
				</select>
				※ 최근 2년간의 정보가 조회 가능합니다.
			</div>
			<div class="term-set-wrap">
				기간설정 <button>1개월</button><button>3개월</button><button>6개월</button><button>1년</button><button>2년</button>
				<input type="text" id="datepicker" style="margin-left:10px;" class="datepicker">~<input type="text" id="datepicker2" class="datepicker">
				<button class="search">검색</button>
				<br>
				
			<br>
			
			</div>		
				<table class="table-wrap" id="table-wrap1">
					<thead>
					 <tr>
						<th class="first">후원자</th>
						<th>구분</th>
						<th>결제방법</th>
						<th>후원일자</th>
						<th>후원금액</th>
					 </tr>
					</thead>
			<c:choose>
				<c:when test="${empty donate }">
					<tbody>
						<tr>
						
							<td  colspan="5"style="text-align:center; padding: 15px; font-weight:200; font-size:14px; ">
						납부완료된 후원 내역이 없습니다.
							<td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody class="giver-wrap2">
						<c:forEach items="${donate }" var="item">
							<tr>
							<td class="first"> ${item.taker_no } </td><td>Card</td><td>일시후원</td>
							<td>${item.donate_date }</td><td class="last">${item.donate_amount }</td>
					
							</tr>
						</c:forEach>
					</tbody>
				</c:otherwise>	
					
			</c:choose>
					
				</table>
		</div>
		
		<div class="look-up-wrap" id="tab2">
			<div class="division-wrap">
				후원구분  
				<select>
					<option selected="selected">전체보기</option>
					<option>일시후원</option>
					<option>정기결제</option>
				</select>
				※ 최근 2년간의 정보가 조회 가능합니다.
			</div>
			<div class="term-set-wrap">
				기간설정 <button>1개월</button><button>3개월</button><button>6개월</button><button>1년</button><button>2년</button>
				<input type="text" id="datepicker" style="margin-left:10px;" class="datepicker">~<input type="text" id="datepicker2" class="datepicker">
				<button class="search">검색</button>
				<br>
			
			<br>
			</div>		
				<table class="table-wrap" id="table-wrap2">
					<thead>
					 <tr>
						<th class="first">후원자</th>
						<th>구분</th>
						<th>결제방법</th>
						<th>후원일자</th>
						<th>후원금액</th>
					 </tr>
					</thead>
			<c:choose>
				<c:when test="${empty takeM }">
					<tbody>
						<tr>
						
							<td  colspan="5"style="text-align:center; padding: 15px; font-weight:200; font-size:14px; ">
						납부완료된 후원 내역이 없습니다.
							<td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody class="taker-wrap">
				<c:forEach items="${ takeM }" var="item">
					  <tr>	
						<td class="first">${item.giver_no }</td><td>일시후원</td><td>카드</td><td>${item.donate_date }</td><td class="last">${item.donate_amount }</td>
						 </tr>
				</c:forEach>
					</tbody>
				
				</c:otherwise>	
					
			</c:choose>
					
				</table>
		</div>
		
	
	</div>
	<div style="width:100%; height:5%;  position:fixed;  margin-top:780px;">
		
		<button class="cancel-btn">취소</button><button class="enter-btn" onclick="saveBtn();">설정저장</button>
		
	</div>	
	
    <!-- Password Modal  -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <h2>비밀번호 설정</h2>
        <hr>
        <div class="upper-wrap">
        	새 비밀번호 <input type="password" id="new-pwd" class="change-pwd" onkeyup="comparePass();">
        	
        	<div class="error1 errorContent" >비밀번호가 일치하지 않습니다.</div>
			<div class="error1P errorContent"  ></div>
        	<br><Br>
        <hr>
        </div>
        <div class="bottom-wrap">
        	다시 입력 <input type="password" id="new-pwd2" class="change-pwd" onkeyup="comparePass();">
         	<div class="error2 errorContent2">비밀번호는 세글자 이상입니다.</div>
        	<div class="error2p errorContent2"></div>
        </div>
        <div style="position: absolute; margin-top:-30px;"><button id="pwd-cancel-btn" class="cancel-btn2" onclick="pwdCancel();">취소</button><button id="save-pwd"class="enter-btn2" onclick="changePwd();">설정저장</button></div>
      </div>
 
    </div>
	
	
</div>	



	<script>
		function giveMoney(){
			
			$("#tab2").hide();
			$("#tab1").show();
			$("#giveMoney").css({"background":"#3399ff","color":"white"});
			$("#takeMoney").css({"background":"white","color":"black"});
			
		}
		
		function takeMoney(){
			$("#tab2").show();
			$("#tab1").hide();
			$("#takeMoney").css({"background":"#3399ff","color":"white"});
			$("#giveMoney").css({"background":"white","color":"black"});
			
		}
	
		function showContent(){
			
			$("#table-wrap1").toggle();
			
		}
		function showGive(){
			
			
			
			
		}
		
	    // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target != $(".modal-content")) {
                modal.style.display = "none";
            }
        }
		function pwdCancel(){
			$("#new-pwd").val("");
			$("#new-pwd2").val("");
			
			  modal.style.display = "none";
			  
			
		}
		function changePwd(){
			var pwd=$("#new-pwd").val();
			$.ajax({
				
				url:"changePwd.set",
				type:"post",
				data:{pwd:pwd},
				success:function(data){
					
					swal("변경을 성공적으로 마무리 하였습니다.")
					$("#new-pwd").val("");
					$("#new-pwd2").val("");
					
					  modal.style.display = "none";
				}
				
			})
			
			
		}
		
		
        
        function comparePass(){
        	
			var pwd1=$("#new-pwd").val();
			var pwd2=$("#new-pwd2").val();
			
				$.ajax({
				
					url:"comparePass.set",
					type:"post",
					data:{pwd1:pwd1,pwd2:pwd2},
					success:function(data){
						
						if(data.result==1){
							$(".errorContent").hide();	
							$(".errorContent2").show();
							$("#new-pwd").css("border","1px solid #bd081c");
							$("#new-pwd2").css("border","1px solid #737373");
							$("#save-pwd").attr("disabled",true).css({"background":"#efefef","color":"black"});
						}
						if(data.result==2){
							$(".errorContent2").hide();
							$(".errorContent").show();	
							$("#new-pwd").css("border","1px solid #737373");
							$("#new-pwd2").css("border","1px solid #bd081c");
							$("#save-pwd").attr("disabled",true).css({"background":"#efefef","color":"black"});
						}
						if(data.result==3){
							$(".errorContent2").hide();
							$(".errorContent").hide();	
							$("#save-pwd").attr("disabled",false).css({"background":"#bd081c","color":"white"});
							
						}
					}
					
					
					
					
					
				})
		      
				
				
        	
        	
        }
        
        function deleteSearch(){
        	
        	console.log("웰컴")
        	
        	
        	swal("검색이력을 지우시겠습니까?")
        	.then((value) => {
        		
              $.ajax({
            	  
            	  url:"deleteSearch.set",
      			type:"post",
      			success:function(data){
      				
		        		swal("삭제되었습니다.");
      				
      			}
      				
            	  
              })		
        
        	});
        	
        }	
        </script>
        <script>
        /* 사진변경모달  */
		  // Get the modal
        var modal2 = document.getElementById('myModal2');
 
        // Get the button that opens the modal
        var btn2 = document.getElementById("myBtn2");
 
        // Get the <span> element that closes the modal
        var span2 = document.getElementsByClassName("close2")[0];                                          
 
        // When the user clicks on the button, open the modal 
        btn2.onclick = function() {
            modal2.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        span2.onclick = function() {
            modal2.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal2) {
                modal2.style.display = "none";
            }
        }
		/* 사진변경모달  */
		function  changePic(){
			var form=$("#fileForm")[0];
			var formData = new FormData(form);
			formData.append("photo",$("input[name=photo]")[0].files[0]);
			
			$.ajax({
				
				url:"changePic.set",
				 processData: false,
                 contentType: false,
                 data: formData,
                 type: 'POST',
				success:function(data){
					
					
					swal("업로드가 성공하였습니다.");
					 $("#profile").attr("src","/tree/"+data.profile);
					 modal2.style.display = "none";
				}

			
			})
			
			
			
			
		}
		
		function saveBtn(){
			
			var mGender=$("input:radio[name=mGender]:checked").val();
			var mName=$("input[name=mName]").val();
			var mIntroduce=$("#mIntroduce").val();
			
			var obj= new Object();
			
			obj.mGender=mGender;
			obj.mName=mName;
			obj.mIntroduce=mIntroduce;
			
			var jsonData = JSON.stringify(obj);
			
			$.ajax({
			
				url:"changeSet.set",
				dataType:"json",
				contentType : "application/json",
				type:"post",
				data:jsonData,
				
				success:function(data){
					
					swal("설정 변경에 성공하였습니다.");
					
				}
			
			
			})
		}
		
	</script>
	
        		
	<script>
		var pwd1=$("#new-pwd").val();
		var pwd2=$("#new-pwd2").val();

		$(document).on('click',function(e){
			
			if(!$(e.target).is($(".change-pwd"))){
				
				$(".errorContent").hide();
				$(".errorContent2").hide();
				
				if(pwd1.length>3 && pwd1==pwd2){
					
					$("#save-pwd").attr("disabled",false).css({"background":"#bd081c","color":"white"});
					
					
				}
				
			}
			if(!$(e.target).is($(".modal-content"))){
				$("#save-pwd").attr("disabled",true).css({"background":"#efefef","color":"black"});
				pwd1="";
				pwd2="";
				
			}
			
		});
		
		$(function(){
			
			$("#tab2").toggle();
			$("#save-pwd").attr("disabled",true);
			$(".errorContent").hide();				
			$(".errorContent2").hide();
		});
		
		 function scrolling(pos) {
		        $('html, body').animate({'scrollTop' : pos}, "slow");
		    }


	</script>
	
</body>
</html>
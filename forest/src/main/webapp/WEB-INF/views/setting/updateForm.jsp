<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
      body {
        margin: 0px;
        padding: 0px;
      }
      .jbTitle {
        text-align: center;
      }
      .jbMenu {
        text-align: center;
        background-color: lightblue;
        padding: 10px 0px;
        width: 100%;
      }
      .jbContent {
      	align:center;
        height: 800px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
      p.round2{
        border: 2px solid lightgray;
    	border-radius: 8px;
      }
      
       /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
      
    </style>
 <title>Insert title here</title>
 <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
    
    <!-- 포커스 스크립트 함수-->
    <script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>



</head>
<body>
	<div class="jbTitle" align="center">
      <h1>설정</h1>
    </div>
    <div class="jbMenu" align="center">
     <h4>
     	<a onclick="fnMove('1')"><b>계정 기본정보</b></a>&nbsp;&nbsp;&nbsp;
     	<a onclick="fnMove('2')"><b>프로필</b></a>
     </h4>
      
    </div>
    <div class="jbContent" id="div1" align="left" style="width:800px;">
    	<h1><b>계정 기본정보</b></h1><br>
    	<h4>이메일 주소</h4>
    	<p  class="round2">huni2013@naver.com</p>
    	<h4>비밀번호</h4>
    	<button class="btn-primary" id="myBtn">비밀번호 변경</button>
    	
    <hr>	
    <div id="div2">
    	<h1><b>프로필</b></h1><br>
    	<table>
    		<tr>
    			<td><h4>이름</h4></td>
    			<td><h4>성</h4></td>
    		</tr>
    		<tr>
    			<td><input type="text" border="1px" value="훈택"></td>
    			<td><input type="text" border="1px" value="이"></td>
    		</tr>
    		<tr>
    			<td>사진</td>
    		</tr>
    		<tr>
    			<td><img alt="" src="../img/default_75.png"> </td>
    			<td><button class="btn-primary" id="myBtn2">사진변경</button></td>
    		</tr>
    		<tr>
    			<td><h4>자기소개</h4></td>
    			
    		</tr>
    		<tr>
    			<td colspan="2">
    			<textarea rows="5" cols="50"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<td align="left">
    				<button class="btn-primary">취소</button>
    				<button class="btn-primary">설정저장</button>
    			</td>
    		</tr>
    	</table>
 <!-- Trigger/Open The Modal -->
   
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <table>
        	<tr>
        		<td>새 비밀번호:</td>
        		<td><input type="password"></td>
        		
        	</tr>
        	<tr>
        		<td>비밀번호확인:</td>
        		<td><input type="password"></td>
        	</tr>
        	<tr>
        		<td colspan="2">
        			<button class="btn">취소</button>
        			<button class="btn">완료</button>
        			
        		</td>
        	</tr>
        	
        </table>
      </div>
      
    
 <script type="text/javascript">
//Get the modal
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
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }


 </script>
    </div>
    	
    </div>
    </div>

</body>
</html>
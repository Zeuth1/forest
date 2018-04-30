<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
  body{
    background:rgba(0,0,0, 0.1);
  }
  .column{
    display:flex;
    flex-direction:column;
    border-radius:10px;
    margin-left:300px;
    margin-top:30px;
    width:1100px;
    background:white;
    
  }
  
   #homeBtn{
    
	position:fixed;
	left:37px;
	top:25px;
	padding:19px;
	padding-left:40px;
	padding-top:9px;
	padding-bottom:9px;
	border-radius:100px;
	font-weight: bolder;
	font-size:medium;
	color:rgba(0,0,0,0.8);
   }
   
   #homeBtn:hover{
     background:rgba(80,80,80,0.1);
     cursor:pointer;
   }
   
  #pre{
     
     position:fixed;
     top:27px; left:40px;
     padding:10px;
     padding-top:6px;
     padding-bottom:6px;
     font-size:25px;
     border-radius:50%;
   }
  
  #pre:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }

    .btnArea{
	    width:730px;
	    height:40px;
	    margin-top:15px;
	    margin-bottom:10px;
	    margin-left:-10px;
	    
	    display:flex;
    }
    
    #modifyBtn{
        
	    
		width:30px;
		padding-left:10px;
		margin-left:30px;
		padding-top:5px;
		padding-bottom:5px;
		border-radius:100px;
		font-size:20px;
		color:rgba(0,0,0,0.3);
    }
    
    #modifyBtn:hover{
	    background:rgba(80,80,80,0.1);
	    cursor:pointer;
    }
    
    #storeBtn{
	    font-size:17px;
	    padding:15px;
	    padding-top:9px;
	    padding-bottom:9px;
	    border-radius:7px;
	    width:58px;
	    color:white;
	    background:rgba(220, 0, 0);
	    font-weight:bolder;
    }
  
    #storeBtn:hover{
	    background:rgba(210, 0, 0);
	    cursor:pointer;
    }
      
    #downed{
        margin-left:500px;
	    font-size:17px;
	    padding:15px;
	    padding-top:9px;
	    padding-bottom:9px;
	    border-radius:7px;
	    color:(0,0,0, 0.2);
	    font-weight:bolder;
    }
    
   .figure{
     width:680px;
     margin-top:10px;
     margin-bottom:2%;
     margin-left: 25px;

   }
   
  .figure img{
    border-radius:10px;
    max-width:680px;
    width:100%;


    margin-left:auto;
    margin-right:auto;
  }
  
  .figure img:hover{
    cursor:pointer;
    background: rgba(80,80,80,0.1);
  }
  
   #description{
     display:flex;
     flex-direction:column;
    
     margin-left:25px;
     width:480px;
     
   }
   
   #goBoardText{
     text-align:center;
     
   }
   
   #goBoardBtn{
     display:flex;
     justify-content:center;
     align-items:center;
     width:680px;
     height:40px;
     border-radius:7px;
     font-weight: bolder;
	 font-size:large;
     background:rgba(80,80,80,0.1);
	 color:rgba(0,0,0,0.8);
	 
   }
   
   #goBoardBtn:hover{
     background:rgba(0,0,0, 0.2);
     cursor:pointer;
   }
   
   
   .uploadInfo{
     display:flex;
     flex-direction:row;
     width:680px;
     margin-top:3%;
     border-bottom:1px solid rgba(80,80,80,0.2);
   }
   
   .profile{
     width:50px;
     height:50px;
     border-radius:100%;
    }
    
   #uploadDetail{
     width:400px;
     margin-top:1%;
     margin-left:3%;
     max-height:80px; 
     overflow:hidden; 
     vertical-align:top; 
     text-overflow: ellipsis; 
     word-break:break-all; 
     
   }
   
   a{
     font-weight:900;
     text-decoration:none;
     color:black;
   }
   
   .commentary{
     display:flex;
     flex-direction:column;
     
     margin-left:25px;
     margin-top:10px;
     font-size:17px;
     width:1000px;
     margin-bottom:20px;
   }
   
   textArea{
  
     font-family: 'Nanum Gothic', sans-serif;
     width:605px;
     margin-left:20px;
     resize:none;
     
     border-bottom:1px solid rgba(80,80,80,0.1);
     border-top:0px;
     border-right:0px;
     border-left:0px; 
   } 
   
   .write{
     display:flex;
     margin-bottom:20px;
     
   }
   
   textArea:focus{
     border-bottom:1px solid black;
     border-top:0px;
     border-right:0px;
     border-left:0px; 
     outline:none;
   }
   
   #submit{
     display:inline-block;
     display:none;
     font-family: 'Nanum Gothic', sans-serif;
     border:0px;
     background:rgba(80,80,80,0.3);
     border-radius:5px;
     padding:10px;
     padding-left:15px;
     padding-right:15px;

     outline:none;
     
   }
   
   #submit:hover{
     cursor:pointer;
   }
   
   #erase{
     display:inline-block;
     display:none;
     border:0px;
     background:white;
     outline:none;
     margin-left:510px;
     font-family: 'Nanum Gothic', sans-serif;
   }
   
   #erase:hover{
     cursor:pointer;
   }
   
   .commentaryBoard{
     display:block;
      
   }
   
   
   
   #commentCount{
     width:100px;
   
   }
   
   
   #commentCount:hover{
     cursor:pointer;
   }
   
   .userProfile{
     width:50px;
     height:50px;
     border-radius:100%;
   }
   
   
   .userName{
     margin-top:0px;
     margin-bottom:0px;
     height:25px;
     
     font-family: 'Nanum Gothic', sans-serif;
     font-size:15px;
   }
   
   .commentDate{
     margin-left:5px;
     margin-top:0px;
     margin-bottom:0px;
     height:25px;
     
     align-self:center;
     font-family: 'Nanum Gothic', sans-serif;
     font-size:15px;
     color:rgba(80,80,80,0.5);
   }
   
   .commentContent{
     margin-top:0px;
     width:615px;
     font-family: 'Nanum Gothic', sans-serif;
     font-size:14px;
   }
   
   
</style>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script src="http://lib.inmu.net/autosize.js"></script>
<title>Insert title here</title>
</head>
<body>
	 
  
  <div class="column">
  
      <div class="btnArea">
	      <i class="fas fa-chevron-left" id="pre"></i>
	      <div id="homeBtn">이전 트리로 되돌아가기</div>
	      <div id="modifyBtn"><i class="fas fa-ellipsis-h" id="modify"></i></div>
	      <div id="downed"><i class="fas fa-thumbtack" style="font-size:15px; padding-right:5px; top:10px;"></i>${ detail.treeCtn }</div>
	      <div id="storeBtn"><i class="fas fa-thumbtack" style="font-size:15px; padding-right:5px;"></i>저장</div>
	      
      </div>
      
      <div class="figure">
        <img src="/tree/${ detail.treeAfter }"/>  
      </div>
      
      <div id="description">
      
        <div id="goBoardBtn" onclick="location.href='#'"><p id="goBoardText">${ detail.mNickName }의 보드 더보기</p></div>
        
        <div class="uploadInfo">
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png"" class="profile" id="ownerProfile"> 
	      	<p id="uploadDetail">
	      	  <a href="#">${ detail.mNickName }</a> 님이 <a href="#">${ detail.boardTitle }</a>에 저장함
	      	  <br>${ detail.treeTag }
	      	</p>
      	</div>
      
	    
	    
      </div>
	    <div class="commentary">
	      <p id="commentCount" style="margin-top:5px; margin-bottom:20px"></p>
	      <div class="write">
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png" class="profile" id="loginUserProfile">
	        <div style="display:flex; flex-direction:column">	
		        <textArea  placeholder="공개 댓글 추가..." rows="1"></textArea>
		        
		        <div style="display:flex; margin-top:10px;">
		        <button id="erase" type="button">CANCLE</button>
		        <button id="submit" type="button" disabled="">댓글</button>
		        </div>
		        
	        </div>
	      </div>
	      
	      <div class="commentaryBoard"></div>
	      
	    </div>
      
        
    
    
    </div>   

      
      <script>
      
	  autosize(document.querySelectorAll("textArea"));
	  
	  var loginUserProfile = "";
	  
	  $(function(){
		 //댓글 갯수 업데이트 
		  $.ajax({
			  url:"commentaryListCount.ma",
			  type:"POST",
			  data:JSON.stringify('${detail.treeNo}'),
			  dataType:'json',
			  contentType:'application/json',
			  success:function(data){
				  console.log(data);
				  $('#commentCount').text('댓글 ' + data + '개');
			  },
		      
			  
		  })
		  
		  //해당트리 작가 프로필사진 불러오기
		  $.ajax({
			  url:"getProfile.ma",
			  type:"POST",
			  data:JSON.stringify('${detail.mNickName}'),
			  dataType:"json",
			  contentType:"application/json",
			  success:function(data){
				  var ownerProfile = '/tree/' + data.profile;
				  
				   if(data != null){
					  $('#ownerProfile').attr('src', ownerProfile);
				  }
			  }
			  
		  })
		  
		  
		  //로그인 유저 프로필사진 불러오기
		  $.ajax({
			  url:"getProfile.ma",
			  type:"POST",
			  data:JSON.stringify('${loginUser.mNickName}'),
			  dataType:"json",
			  contentType:"application/json",
			  success:function(data){
				  loginUserProfile = '/tree/' + data.profile;
				  
				   if(data.profile !== null){
					  $('#loginUserProfile').attr('src', loginUserProfile);
				  }
			  }
			  
		  })
		  
		  //댓글내용 초기화
		  if( !$('textArea').val() == ''){
		  	$('textArea').val('');
		  }
	  })

      $('#erase').on('click', function(){
    	  
    	  $('textArea').val('');
    	  $('textArea').height(18);
      })
      
      $('textArea').on('keyup', function(){
    	  if( !$('textArea').val() == ''){
    	  	$('#submit').css('background','rgba(80,80,80,0.1)')
    	  	$('#submit').removeAttr('disabled');
    	  }
    	  
    	  if( $('textArea').val() == ''){
      	  	$('#submit').css('background','rgba(80,80,80,0.3)')
      	  	$('#submit').attr('disabled','true');
      	  }
    	  
      })
    	  
      $('textArea').on('click', function(){
    	  if( !$('textArea').val() == ''){
      	  	$('#submit').css('background','rgba(80,80,80,0.1)')
      	  	$('#submit').removeAttr('disabled');
      	  }
      	  
      	  if( $('textArea').val() == ''){
        	  	$('#submit').css('background','rgba(80,80,80,0.3)')
        	  	$('#submit').attr('disabled','true');
        	  }
      	  
    	  $('#submit').css('display','inline-block');
    	  $('#erase').css('display','inline-block');
      })
     
      $(document).on('click', function(e){
    	  if( !$(e.target).is( $('textArea') ) && $('textArea').val() == '' && !$(e.target).is( $('#commentCount') ) ){
    		  $('#submit').css('display','none');
        	  $('#erase').css('display','none');
    	  }
      })
      
      
    	  
    	  
	      //댓글정보 불러오기 
    	  $(function(){
    		  
	    	  var commentRequest = new Object();
	    	  
	    	  commentRequest.treeNo = '${detail.treeNo}';
	    	  commentRequest.commentCount = $('.comment').length;
	    	   
			  
			  $.ajax({
				  url:"commentaryList.ma",
				  type:"POST",
				  data:JSON.stringify(commentRequest),
				  dataType:"json",
				  contentType:"application/json",
				  success:function(data){
					  
					  var arr = data.commentaryList;
					  
					  if(arr.length > 0){
					  
				    	  $('.commentaryBoard').css('display','block');
						  
						  
						  
						  
						  for(var i = 0; i < arr.length; i++){
					  		var comment = $('<div class="comment" style="display:flex; margin-top:15px; margin-bottom:10px;" " id="' + arr[i].comment_no + '">');
					  		
					  		var img = $('<img class="userProfile" src="/tree/' + arr[i].tree_after + '">');
					  		var info = $('<div style="display:flex; flex-direction:column; margin-left:15px; margin-bottom:10px;"><div style="display:flex;" flex-direction:row">' +
					  		             '<p class="userName">' + arr[i].nick_name + '</p>' + 
					  		             '<p class="commentDate">' + arr[i].comment_date + '</p></div>' + 
					  		             '<p class="commentContent">' + arr[i].comment_content + '</p></div>');
					  		
					  		img.appendTo(comment);
					  		info.appendTo(comment);
					  	    
					  		$(comment).appendTo($('.commentaryBoard'));
						  }
					 
					  }
				  }
			      
				  
				  
			  })
    	  
    	  });
	     
	  
	     //페이징
	     var delta = 300;
	     var timer = null;
	     
	      $(document).scroll(function(){
	    	 if( $(window).scrollTop() + $(window).height() >= $(document).height() - 1){
			     clearTimeout(timer);
			     timer = setTimeout(function(){
			    	 var commentRequest = new Object();
			    	  
			    	  commentRequest.treeNo = '${detail.treeNo}';
			    	  commentRequest.commentCount = $('.comment').length;
			    	  	 
					  
					  $.ajax({
						  url:"commentaryList.ma",
						  type:"POST",
						  data:JSON.stringify(commentRequest),
						  dataType:"json",
						  contentType:"application/json",
						  success:function(data){
							  
							  var arr = data.commentaryList;
							  
							  if(arr.length > 0){
							  
						    	  $('.commentaryBoard').css('display','block');
								  
								  
								  
								  
								  for(var i = 0; i < arr.length; i++){
							  		var comment = $('<div class="comment" style="display:flex; margin-top:15px; margin-bottom:10px;" " id="' + arr[i].comment_no + '">');
							  		
							  		var img = $('<img class="userProfile" src="/tree/' + arr[i].tree_after + '">');
							  		var info = $('<div style="display:flex; flex-direction:column; margin-left:15px; margin-bottom:10px;"><div style="display:flex;" flex-direction:row">' +
							  		             '<p class="userName">' + arr[i].nick_name + '</p>' + 
							  		             '<p class="commentDate">' + arr[i].comment_date + '</p></div>' + 
							  		             '<p class="commentContent">' + arr[i].comment_content + '</p></div>');
							  		
							  		img.appendTo(comment);
							  		info.appendTo(comment);
							  	    
							  		$(comment).appendTo($('.commentaryBoard'));
								  }
							 
							  }
						  }
					      
						  
						  
					  })
			    	 
			     }, delta)
	    		 
	    	 }
	      });
    	  
    	  
      
      //댓글 추가
      $('#submit').on('click', function(){
    	  var data = new Object();
    	  
    	  data.userNo = '${ loginUser.mNo }';
    	  data.treeNo = '${ detail.treeNo }'
    	  data.content = $('textArea').val();
    	  $('textArea').height(18);
    	  $('#submit').css('background','rgba(80,80,80,0.3)');
    	  $('#submit').attr('disabled','true');
    	  
    	  
    	  $.ajax({
    		  url:"commentaryInsert.ma",
    		  data:data,
    		  type:"POST",   		  
    		  success:function(data){
    			  if(data != "error"){
    				  console.log('insertion has succeed');
    				    console.log(data)
    				    
    				     //댓글 갯수 업데이트 
		  $.ajax({
			  url:"commentaryListCount.ma",
			  type:"POST",
			  data:JSON.stringify('${detail.treeNo}'),
			  dataType:'json',
			  contentType:'application/json',
			  success:function(data){
				  console.log(data);
				  $('#commentCount').text('댓글 ' + data + '개');
			  },
		      
			  
		  })
    				  
    				    //가라로 보여지는 부분
    				    var comment = $('<div class="comment" style="display:flex; margin-top:15px; margin-bottom:10px; id="' + data + '">');
				  		
						var img = $('<img class="userProfile" src="' + loginUserProfile + '">');
						var info = $('<div style="display:flex; flex-direction:column; margin-left:15px; margin-bottom:10px;"><div style="display:flex;" flex-direction:row">' +
						             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
						             '<p class="commentDate">' + '1분 전' + '</p></div>' + 
						             '<p class="commentContent">' + $('textArea').val() + '</p></div>');
						
						img.appendTo(comment);
						info.appendTo(comment);
						   
						$(comment).prependTo($('.commentaryBoard'));
    					 
    				  
    				    $('textArea').val('');
    				  
    				  
    			  }
    			  
    			  if(data === "error"){
    				  console.log('encounted unknown sql error...');
    			  }
    			  
    		  }
    	  })
    	  
    	  
    	  
      })
      
      $('#homeBtn').click(function(){
      	window.history.back();
      })
      
      
      
      
    </script>
      
      
  
  
</body>
</html>
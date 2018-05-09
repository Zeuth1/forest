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
    width:750px;
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
     width:40px;
     height:40px;
     border-radius:100%;
    }
    
    .ownerProfile{
     width:40px;
     height:40px;
     border-radius:100%;
    }
    
   #uploadDetail{
     width:400px;
     margin-top:-3px;
     margin-left:15px;
     max-height:80px; 
     overflow:hidden; 
     vertical-align:top; 
     font-size:15px;
     text-overflow: ellipsis; 
     word-break:break-all; 
     font-family: 'Nanum Gothic', sans-serif;
     
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
     width:625px;
     margin-left:10px;
     resize:none;
     
     border-bottom:1px solid rgba(80,80,80,0.1);
     border-top:0px;
     border-right:0px;
     border-left:0px; 
   } 
   
   textArea:focus{
     border-bottom:1px solid black;
     border-top:0px;
     border-right:0px;
     border-left:0px; 
     outline:none;
   }
   .write{
     display:flex;
     margin-bottom:20px;
     margin-top:5px;
     width:680px;
   }
   
   
   .submit{
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
   
   .submit:hover{
     cursor:pointer;
   }
   
   .erase{
     display:inline-block;
     display:none;
     border:0px;
     background:white;
     outline:none;
     margin-left:520px;
     font-family: 'Nanum Gothic', sans-serif;
   }
   
   .erase:hover{
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
     width:40px;
     height:40px;
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
     font-size:13px;
     color:rgba(80,80,80,0.5);
   }
   
   .commentContent{
     margin-top:0px;
     margin-bottom:0px;
     width:615px;
     font-family: 'Nanum Gothic', sans-serif;
     font-size:14px;
   }
   
   .plusComment{
     font-size:10px;
     padding:3px;
     background:rgba(80,80,80,0.2);
     width:20px;
   }
   
   .plusComment:hover{
     cursor:pointer;
   }
   
   .reply:hover{
     cursor:pointer;
   }
   
   .commentMenuBtn{
     position:relative;
     display:none;
     cursor:pointer;
     background:white;
   }
   
   .commentMenu{
     position:absolute;
     display:flex;
     flex-direction:column;
     align-items:center;
     justify-content:center;
     background:white;
     box-shadow:0px 3px 3px  rgba(80,80,80,0.3);
     right:-60px;
     width:60px;
     height:110px;
     
     
     
   }
   
   .commentMenu div{
     width:100%;
   }
   
   .commentMenu p{
     font-family: 'Nanum Gothic', sans-serif;
     font-size:14px;
     text-align:center;
     padding-top:15px;
     padding-bottom:15px;
     margin:0px;

   }
   
   
   .commentMenu p:hover{
     background:rgba(80,80,80,0.1);
     cursor:pointer;
   }
   
   .banMenu{
     right:-180px;
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
      
        <div id="goBoardBtn" onclick="goBoard()"><p id="goBoardText">${ detail.mNickName }의 보드 더보기</p></div>
        
        <div class="uploadInfo">
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png"" class="ownerProfile"> 
	      	<div>
	      	  <p id="uploadDetail" style="margin-top:0px; margin-bottom:5px;">
	      	  <a href="#">${ detail.mNickName }</a> 님이 <a href="#">${ detail.boardTitle }</a>에 저장함</p>
	      	  <p style="font-size:12px; margin-top:0px; margin-left:15px; margin-bottom:10px;">게시일: ${ detail.treeDate}</p> 
	      	  <p style="font-size:14px; margin-top:0px; margin-left:15px;">${ detail.treeTag }</p>
	      	  </div>
      	</div>
      
	    	
	    
      </div>
	    <div class="commentary">
	      <p id="commentCount" style="margin-top:5px; margin-bottom:20px"></p>
	      <div class="write">
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png" class="profile" id="loginUserProfile">
	        <div style="display:flex; flex-direction:column">	
		        <textArea id="textArea" class="textArea" placeholder="공개 댓글 추가..." rows="1"></textArea>
		        
		        <div style="display:flex; margin-top:5px; ">
		        <button id="erase" class="erase" type="button">CANCLE</button>
		        <button id="submit" class="submit" type="button" disabled="">댓글</button>
		        </div>
		        
	        </div>
	      </div>
	      
	      <div class="commentaryBoard">
	      
	      </div>

	    </div>
      
        
    
    </div>   

      
      <script>
      
      //cdn라이브러리 : textArea 높이 자동 조절
	  autosize(document.querySelectorAll("textArea"));
	  
      //함수 정의 : 시간차 계산기 
		var timeCalculator = function(t){
			
	  		var commentTime = t;
	  		
	  		var year = t.substr(0,4);
	  		var month = t.substr(4,2);
	  		var day = t.substr(6,2);
	  		var hour = t.substr(8,2);
	  		var minute = t.substr(10,2);
	  		var second = t.substr(12,2);
	  		
	  		var commentTme = new Date(year, month, day, hour, minute, second);
	  		
	  		var sys = new Date();
	  		
	  		//1달 전으로 자동 계산되므로 1플러스 
	  		sys.setMonth(sys.getMonth() + 1);
	  		
	  		//밀리세컨 분단위로 변환 
	  		var gapmin = ( sys.getTime() - commentTme.getTime() ) / (1000 * 60 );
	  		
	  		
	  		var gapsecond = ( sys.getTime() - commentTme.getTime() ) /1000;
	  		
	  		var gaphour = gapmin / 60;
	  		
	  		var gapEtc = gapmin % 60;
	  		
	  		var gapDay = 0;
	  		
	  		var gapWeek = 0;
	  		
	  		var gapMonth = 0;
	  		
	  		var gapYear = 0;
	  		
	  		if(gaphour >= 24){
	  			var gapDay = gaphour / 24;
	  			
	  			if(gapDay >= 7){
	  				var gapWeek = gapDay / 7;
	  				
	  				if(gapWeek >= 4){
	  					var gapMonth = gapWeek / 4;
	  					
	  					if(gapMonth >= 12){
	  						var gapYear = gapMonth / 12;
	  						
	  					}
	  				}
	  			}
	  		}
	  		
	  		
	  		if(gapYear >= 1){
	  			
	  			return parseInt(gapYear) + '년 전';
	  		}else{
	  			if(gapMonth >= 1){
	  				
	  				return parseInt(gapMonth) + '달 전';
	  			}else{
	  				if(gapWeek >= 1){
	  					
	  					return parseInt(gapWeek) + '주 전';
	  				}else{
	  					if(gapDay >= 1){
	  						
	  						return parseInt(gapDay) + '일 전';
	  					}else{
	  						if(gaphour >= 1){
	  							
	  							return parseInt(gaphour) + '시간 전';
	  						}else{
	  							if(gapmin >= 1){
	  								
	  								return parseInt(gapmin) + '분 전';
	  							}else{
	  								if(gapsecond >= 1){
	  									
	  									return parseInt(gapsecond) + '초 전';
	  								}else{
	  									
	  									return '1초 전';
	  								}
	  							}
	  						}
	  					}
	  				}
	  			}
	  		} 
		}
	  
	  //댓글갯수를 업데이트시켜줌 
	  var commentCountUpdate = function(){
		  $.ajax({
			  url:"commentaryListCount.ma",
			  type:"POST",
			  data:JSON.stringify('${detail.treeNo}'),
			  dataType:'json',
			  contentType:'application/json',
			  success:function(data){
				  
				  $('#commentCount').text('댓글 ' + data + '개');
			  }
		      
			  
		  })
		  
	  }
	  
	  //프사를 반환함 
	  var getProfileImage = function (){
		  var profileImage = null;
		  $.ajax({
			  url:"getProfile.ma",
			  type:"POST",
			  data:JSON.stringify('${loginUser.mNickName}'),
			  dataType:"json",
			  async:false,
			  contentType:"application/json",
			  success:function(data){
				  if(data !== null){
			  		profileImage = '/tree/' + data.profile;
				  }else{
					profileImage = '{ pageContext.request.contextPath }/resources/images/default-user-image.png';
				  }
			  }
			  
		  })
		  return profileImage;
	  }
	  
	//댓글 20개 뽑아와서 추가해줌  
	  var displayFunc = function (){
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
				  		
				  		var comment = $('<div class="comment" style="position:relative; display:flex; flex-wrap:wrap; margin-top:30px; margin-bottom:10px; width:680px;"  id="' + arr[i].comment_no + '">');
  				    	var menu = $('<img class="commentMenuBtn" src="${ pageContext.request.contextPath }/resources/images/menu.png" style="width:30px; height:30px;">')
  				    	if(arr[i].tree_after !== ""){
  					  		var img = $('<img class="userProfile" style="width:35px; height:35px;" src="/tree/' + arr[i].tree_after + '">'); 
  					  		}else{
  					  			var img = $('<img class="userProfile" style="width:35px; height:35px;" src="${ pageContext.request.contextPath }/resources/images/default-user-image.png">');
  					  				
  					  		}
				  		var info = $('<div class="userProfile2" style="width:595px; display:flex; flex-direction:column; margin-left:15px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
				  		             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
				  		             '<p class="commentDate">1초 전</p></div>' + 
				  		             '<p class="commentContent" style="width:570px;">' + arr[i].comment_content + '</p><p class="plusComment">답글</p></div>');
				  		
				  		img.appendTo(comment);
				  		info.appendTo(comment);
				  		menu.appendTo(comment);
				  		
				  		if(arr[i].children > 0){
				  			var reply = $('<div style="display:flex; height:20px; position:relative;margin-left:50px;" class="reply"><p class="replyBtn" style="font-size:14px; padding-left:0px; padding-top:5px; padding-bottom:5px; height:20px;padding-right:35px; margin-top:0px;">답글 ' +
				  			arr[i].children + '개 모두보기</p><img style="position:absolute; right:2px; top:1px;" src="${ pageContext.request.contextPath }/resources/images/up.PNG"></div>')
				  			
				  			reply.appendTo(comment);
				  			
				  		}
				  		
				  		$(comment).appendTo($('.commentaryBoard'));
				  		
				  		var gapTime = timeCalculator(arr[i].comment_date);
				        
				        $('#' + arr[i].comment_no).children().eq(1).children().children().eq(1).text(gapTime);
				        
					  }
				 
				  }
			  }
		   })
	  };
	  
	//대댓글 불러오기
	  var displayReplyFunc = function(replyRequest, e){
		  $.ajax({
    		  url:"replyList.ma",
    		  type:"POST",
    		  data:JSON.stringify(replyRequest),
    		  dataType:"json",
    		  contentType:"application/json",
    		  success:function(data){
    			  var arr = data.replyList;
    			  
    			  console.log(arr);
    			  
    			  for(var i = 0; i < arr.length; i++){

    				  
				  		var comment2 = $('<div class="comment2" style="position:relative; display:flex; flex-wrap:wrap; margin-top:20px; margin-left:55px; margin-bottom:20px; width:630px;;"  id="' 
				  		+ arr[i].comment_no + '">');
				  		var menu = $('<img class="commentMenuBtn" src="${ pageContext.request.contextPath }/resources/images/menu.png" style="width:30px; height:30px;">')
				  		if(arr[i].tree_after !== ""){
				  		var img = $('<img class="userProfile" style="width:25px; height:25px;" src="/tree/' + arr[i].tree_after + '">'); 
				  		}else{
				  			var img = $('<img class="userProfile" style="width:25px; height:25px;" src="${ pageContext.request.contextPath }/resources/images/default-user-image.png">');
				  				
				  		}
				  		
				  		var info = $('<div class="userProfile2" style="width:560px; display:flex; flex-direction:column; margin-top:0px; margin-left:10px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
				  		             '<p class="userName">' + arr[i].nick_name + '</p>' + 
				  		             '<p class="commentDate"></p></div>' + 
				  		             '<p class="commentContent" style="width:535px;">' + arr[i].comment_content + '</p></div>');
				  		
				  		
				  		
				  		img.appendTo(comment2);
				  		info.appendTo(comment2);
				  		menu.appendTo(comment2);
				  		
				  		
				  		
				  		$(e.target).parents('.comment').after(comment2);
				  		
				  		//시간차 계산 
				  		var gapTime = timeCalculator(arr[i].comment_date);
				  		
				        $('#' + arr[i].comment_no).children().eq(1).children().children().eq(1).text(gapTime);
    		  }
    			  
    			  
    		  }
    		  
    		  
    	  })
		  
	  }
	  
	  //온로드 펑션 
	  $(function(){
		  
		  displayFunc();
		  
		  commentCountUpdate();
		  
		  //프사 받아오기 
		  var profile = getProfileImage();
		  
		  if(profile !== null){
		      $('.profile').attr('src', profile);
		  }
		   else{
			   //기본 이미지 
			   $('.profile').attr('src', "${ pageContext.request.contextPath }/resources/images/default-user-image.png");
		  } 
			  
		  
		  
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
					  $('.ownerProfile').attr('src', ownerProfile);
				  }
			  }
			  
		  })
		  
		  
		  
		  
		  //댓글내용 초기화
		  if( !$('textArea').val() == ''){
		  	$('textArea').val('');
		  }
	  })
	  
	  
	  function goBoard(){
		  location.href="myBoard.my?mno=" + '${detail.mno}';
	  }

      $('#erase').on('click', function(){
    	  $('#submit').css('display','none');
    	  $('#erase').css('display','none');
    	  $('textArea').val('');
    	  $('textArea').height(18);
      })
      
      function goBoard(){
		  location.href="myBoard.my?mno=" + '${detail.mno}';
	  }
    	  
      $('#textArea').on('click', function(){
    	  if( !$('#textArea').val() == ''){
      	  	$('#submit').css('background','rgba(80,80,80,0.1)')
      	  	$('#submit').removeAttr('disabled');
      	  }
      	  
      	  if( $('#textArea').val() == ''){
        	  	$('#submit').css('background','rgba(80,80,80,0.3)')
        	  	$('#submit').attr('disabled','true');
        	  }
      	  
    	  $('#submit').css('display','inline-block');
    	  $('#erase').css('display','inline-block');
      })
     
      
	  
     //페이징 핵심요소 
     var timer = null;
     $(window).on('scroll', function(e){
    	 
    	 clearTimeout(timer);
    	 timer = setTimeout(function(){
    		 
	    	 if( $(window).scrollTop() + $(window).height() >= $(document).height() - 1){
	    	     
			     displayFunc();
	    		  
	    	 }	
    	 },300);
    	 
    	 
     });
    	
      
      $('#homeBtn').click(function(){
      	window.history.back();
      })
      
      //대댓글 작성폼 추가 
      $(document).on('click', function(e){
    	  //처음 추가 
    	  if( $(e.target).is( $('.plusComment') ) && !$(e.target).siblings('.write').length  ){
    	  
    		  
    	  	  
    	  var write2 = ('<div class="write" id="write2" style="width:300px; margin-bottom:0px;">' + 
    			        '<img src="' + getProfileImage() + '" class="profile" id="loginUserProfile2" style="width:25px; height:25px;">' + 
  	                    '<div style="display:flex; flex-direction:column"><textArea id="textArea2" style="width:575px;" class="textArea" placeholder="공개 댓글 추가..." rows="1"></textArea>' + 
  	                    '<div style="display:flex; margin-top:5px;">' + 
  		                '<button id="erase2" class="erase erase2" type="button" style="margin-left:470px; display:inline-block">CANCLE</button>' + 
  		                '<button id="submit2" class="submit" type="button" disabled="" style="display:inline-block">댓글</button></div></div></div>'); 
    	  
  		        
    	  $(e.target).parent().append(write2); 
    	  
    	  //동적으로 추가된 textArea를 autosize적용
    	  autosize(document.querySelectorAll("textArea"));
    	  }else{
    		  $(e.target).siblings('.write').show();
    	  }
      })
      
      $(document).on('click', function(e){
    	 if( $(e.target).is( $('.erase2') ) ){
    		 
    		 $(e.target).parents('.write').toggle();
    		 $(e.target).parent().siblings('#textArea2').val('');
    		 $(e.target).parent().siblings('#textArea2').height(18);
    	 }
      });
      
      $(document).on('keyup', function(e){
    	  
    	  if( $(e.target).is('.textArea')){
    		  if( !$(e.target).val() == ''  ){
    		  	  $(e.target).siblings().eq(0).children().eq(1).removeAttr('disabled');
    		  	$(e.target).siblings().eq(0).children().eq(1).css('background','rgba(80,80,80,0.1)');
    		  }else{
    			  $(e.target).siblings().eq(0).children().eq(1).attr('disabled','true');
    			  $(e.target).siblings().eq(0).children().eq(1).css('background','rgba(80,80,80,0.3)');
    		  }
    	  }
      })
      
      //댓글, 대댓글 추가 (같이하는이유 : ajax구문 중복)
      $(document).on('click', function(e){
    	 if( $(e.target).is( $('.submit')) ){
    	  var data = new Object(); 
    		  
    		 data.content = ( $(e.target).parent().siblings().val() );
    		 data.userNo = '${ loginUser.mNo }';
       	     data.treeNo = '${ detail.treeNo }';
       	     //대댓글 추가시 부모 댓글 번호 
       	     data.commentNo = $(e.target).parent().parent().parent().parent().parent().attr('id');
	       	 
       	     $.ajax({
       	    	 url:"commentaryInsert.ma",
       	    	 data:data,
       	    	 type:"POST",
       	    	 
       	    	 success:function(data){
       	    		if(data !== "error"){
      				  console.log('insertion has succeed');
      				     
   				      commentCountUpdate();
      				  //댓글 추가시 가져온 댓글pk
      				  var commentNo = data;
      				    //댓글 추가
      				    if( $(e.target).attr('id') == 'submit' ){
	  						
      				    	var comment = $('<div class="comment" style="position:relative; display:flex; flex-wrap:wrap; margin-top:15px; margin-bottom:10px; width:680px;"  id="' + commentNo + '">');
      				    	var menu = $('<img class="commentMenuBtn" src="${ pageContext.request.contextPath }/resources/images/menu.png" style="width:30px; height:30px;">')
    				  		var img = $('<img class="userProfile" src="' + getProfileImage() + '">'); 
    				  		var info = $('<div class="userProfile2" style="width:595px; display:flex; flex-direction:column; margin-left:15px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
    				  		             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
    				  		             '<p class="commentDate">1초 전</p></div>' + 
    				  		             '<p class="commentContent" style="width:570px;">' + $(e.target).parent().siblings().val() + '</p><p class="plusComment">답글</p></div>');
    				  		
    				  		
    				  		
    				  		img.appendTo(comment);
    				  		info.appendTo(comment);
    				  		menu.appendTo(comment);
    				  		$(comment).prependTo($('.commentaryBoard'));
	  						
  						    //댓글 추가시 폼 삭제 
	  					    $('#submit').css('display','none');
	  			    	    $('#erase').css('display','none');
	  			    	    $('#textArea').val('');
	  			    	    $('#textArea').height(18);
      				    	
      				    }
      				    
      				    
      				    //대댓글 추가 
      				    if( $(e.target).attr('id') == 'submit2' ){
      				    	var gara = $('<div class="gara" style="position:relative;display:flex; flex-wrap:wrap; margin-bottom:5px;margin-top:20px; margin-left:55px; width:630px;"  id="' 
    				  		+ commentNo + '">');
      				    	var menu = $('<img class="commentMenuBtn" src="${ pageContext.request.contextPath }/resources/images/menu.png" style="width:30px; height:30px;">');
    				  		var img = $('<img class="userProfile" style="width:25px; height:25px;" src="' + getProfileImage() + '">'); 
    				  		var info = $('<div class="userProfile2" style="width:560px;display:flex; flex-direction:column; margin-top:0px; margin-left:10px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
    				  		             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
    				  		             '<p class="commentDate">1초 전</p></div>' + 
    				  		             '<p class="commentContent" style="width:535px;">' + $(e.target).parent().siblings().val() + '</p></div>');
    				  		
    				  		img.appendTo(gara);
    				  		info.appendTo(gara);
    				  		menu.appendTo(gara);
    				  		
    				  		//답글 모두보기가 펼쳐져 있는 경우 대댓글을 대댓글의 마지막 요소 뒤에 추가 
    				  		if( $(e.target).parents('.comment').next().is('.comment2') ){
    				  			$(e.target).parents('.comment').nextAll('.comment').eq(0).prev().after(gara);
    				  			
    				  			//댓글이 하나일 경우 다음 댓글이 없으므로 위의 코드가 안먹음 따라서 if문 처리
    				  			if( $('.commentaryBoard').children('.comment').length == 1 ){
    				  				console.log('digh')
    				  				$(e.target).parents('.comment').siblings().last().after(gara);
    				  			}
    				  			
    				  		}
    				  		
    				  		//마지막 댓글이 아닐경우 
   				  			if( $(e.target).parents('.comment').next().is('.comment') ){
	    				  		$(e.target).parents('.comment').after(gara);
   				  			}
    				  		
    				  		//마지막 댓글일 경우 	
    				  		if( $(e.target).parents('.comment').is( $('.commentaryBoard').children().last() ) ){
    				  			$(e.target).parents('.comment').after(gara);
    				  		}	
    				  				
    				  			
    				  		
    			
    				  		$(e.target).parent().parent().parent('#write2').toggle();
    				  		$(e.target).parent().siblings('#textArea2').val('');
    			    		$(e.target).parent().siblings('#textArea2').height(18);
    				  		
    				  		
    				  		
   			  		    }
      				 
      			  }
      			  
      			  if(data === "error"){
      				  console.log('encounted unknown sql error...');
      			  }
       	    	 
       	    	 }
       	     })
    	 }
       	})
      
      //전체 댓글 보기 클릭하여 대댓글 가져오기 (버블링 불가로 인한 코드 길어짐)
   	  var replyText = null;
      $(document).on('click', function(e){
    	  var replyRequest = new Object();
    	  replyRequest.treeNo = '${detail.treeNo}';
    	  
    	  
    	  if( $(e.target).parent().is( $('.reply') ) ){
    		    
    			//대댓글 처음 가져올 조건 : 1. 처음 모두보기 클릭시  2. 대댓글 추가한후 모두보기 클릭시  3. 대댓글 모두보기 후 닫은 후 대댓글 추가한 경우 	 4.처음 답글불러올때 댓글이 첫번째인 경우 
    			if( ( $(e.target).parents('.comment').next().is('.comment') ) || $(e.target).parents('.comment').next().is('.gara') || $(e.target).parents('.comment').next().css('display') == 'none' || $(e.target).parents('.comment').is( $('.commentaryBoard').children().last() ) ){
    				$(e.target).parents('.comment').nextUntil('.comment').remove();
	    		  
    				console.log('성공')
    				//이미지 포용
    				if($(e.target).is($('.replyBtn'))){
	    				
    					
    						
    						replyText = $(e.target).text() 
    					
		    				
    					
    					$(e.target).text('답글 숨기기'); 
	    				
	    				$(e.target).siblings('img').attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');
	    				
    				}else{
	    				replyText = $(e.target).siblings('p').text() 
	    				$(e.target).attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');;
    					$(e.target).siblings('p').text('답글 숨기기');
    				}
    				
	    		  	replyRequest.commentNo = $(e.target).parents('.comment').attr('id');
	    		  	displayReplyFunc(replyRequest, e);
	    		  	
    				
    			}else{
   			       if( $(e.target).text() == '답글 숨기기' || $(e.target).siblings('p').text() == '답글 숨기기' ){
   						
        				if($(e.target).is($('.replyBtn'))){
	    					$(e.target).text(replyText);    	    				  					
        					$(e.target).siblings('img').attr('src', "${ pageContext.request.contextPath }/resources/images/up.PNG").attr('style','position:absolute; right:2px; top:1px;');
				    		$(e.target).parents('.comment').nextUntil( $('.comment') ).toggle();
				    		 
        				}
    					
    					if($(e.target).is($('img')) ){
        					$(e.target).siblings('p').text(replyText);
        					$(e.target).attr('src', "${ pageContext.request.contextPath }/resources/images/up.PNG").attr('style','position:absolute; right:2px; top:1px;');
        					$(e.target).parents('.comment').nextUntil( $('.comment') ).toggle();	    					
        				}			
   					}else{
    		        
    				//이미지 포용
       				if($(e.target).is($('.replyBtn'))){
    					$(e.target).text('답글 숨기기');    
    					$(e.target).siblings('img').attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');;
    					$(e.target).parents('.comment').nextUntil( $('.comment') ).toggle();	    					
       				}
    				if($(e.target).is($('img'))){
       					$(e.target).siblings('p').text('답글 숨기기');
       					$(e.target).attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');;
       					$(e.target).parents('.comment').nextUntil( $('.comment') ).toggle();	    					
       				}		    					
				}
    				
    			
    	   }
    	  }		
       })
      
       
   /*=================================================================================================================================================================
                               											답글 메뉴 버튼 생성 기능 
     =================================================================================================================================================================*/
       
	  var commentMenuNo = null;
      $(document).on({ 
    	  mouseenter : function(e){
    		  //commentNo Collecter
    		  
    		  //댓글인 경우 
    		  if( $(e.target).is( $('.comment') )  || $(e.target).parents('.comment') ){
    			  if( $(e.target).is('.comment') ){
   			  		 commentMenuNo = ( $(e.target).attr('id') );
   	    		  
    			  }else{
    				 commentMenuNo = ( $(e.target).parents('.comment').attr('id') );
    			  }
    		  }
    		  
    		  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
    		  
          },
          
          mouseleave : function(){
        	  
        	  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
          }
      
      }, '.comment');
      
      $(document).on({ 
    	  mouseenter : function(e){
    		  //commentNo Collecter
    		  
    		  //댓글인 경우 
    		  if( $(e.target).is( $('.comment2') ) || $(e.target).parents('.comment2') ){
    			  if( $(e.target).is('.comment2')){
    			  	 commentMenuNo = ( $(e.target).attr('id') );
     			  }else{
     				 commentMenuNo = ( $(e.target).parents('.comment2').attr('id') );
     			  }
    		  }
    		  
    		  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
          },
          
          mouseleave : function(){
        	  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
          }
      
      }, '.comment2');
      
      $(document).on({ 
    	  mouseenter : function(e){
    		  if( $(e.target).is( $('.gara') ) || $(e.target).parents('.gara') ){
    			  if( $(e.target).is('.gara')){
     			  	 commentMenuNo = ( $(e.target).attr('id') );
      			  }else{
      				 commentMenuNo = ( $(e.target).parents('.gara').attr('id') );
      			  }
    		  }
    		  
    		  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
    		  
          },
          
          mouseleave : function(){
        	  $('#' + commentMenuNo).children('.commentMenuBtn').toggle();
          }
      
      }, '.gara');
       
       
    /*=================================================================================================================================================================
      -----------------------------------------------------------------------------------------------------------------------------------------------------------------	
      =================================================================================================================================================================*/   
     
	   
	/*=================================================================================================================================================================
																				댓글 삭제/수정/신고
	  =================================================================================================================================================================*/	
					  
	  //답글이 본인 답글인지 확인 
	  $(document).on('click', function(e){
		  if( $(e.target).is('.commentMenuBtn') ){
			  //이미 켜져있는 경우 끔
			  $('.commentMenu').hide();
			  if( $(e.target).siblings('.commentMenu').length ){
				  $(e.target).siblings('.commentMenu').toggle();
			  }else{
				  var commentNo = $(e.target).parent().attr('id');
				  var loginUserNo = '${loginUser.mNo}';
				  var commentOwnerNo = null;
				  
				  
				  $.ajax({
					  url:"checkCommentOwner.ma",
					  data:JSON.stringify(commentNo),
					  type:"POST",
					  dataType:'json',
					  contentType:'application/json',
					  success:function(data){
						  commentOwnerNo = data;
						  
						  if( loginUserNo == commentOwnerNo){
								
							  var commentMenu = $('<div class="commentMenu"><div><p class="modifyBtn">수정</p><p class="deleteBtn">삭제</p></div></div>');
							  $(e.target).after(commentMenu);
						  
						  }else{
							  var commentMenu = $('<div class="commentMenu banMenu" style="width:180px; height:70px;"><div><p class="banBtn">스팸 또는 악용사례 신고</p></div></div>');
							  $(e.target).after(commentMenu);
						  }
						  
						  
						  
						  
					  }
					  
				  })
			  
		  		}
		  }
	  })
      
	  //댓글 메뉴 버튼 hide
	  $(document).on('click', function(e){
		  if( !$(e.target).is('.commentMenu') && !$(e.target).is('.commentMenuBtn') ){
			  $('.commentMenu').hide();
		  }
	  })				  
	  
	  
	  //댓글 삭제 
	  $(document).on('click', function(e){
		  if( $(e.target).is('.deleteBtn')){
			  var commentNo = $(e.target).parent().parent().parent().attr('id')
			  
			  $.ajax({
				  url:'deleteCommentary.ma',
				  data:commentNo + "",
				  type:'POST',
				  success:function(data){
					  console.log(data)
					  
					  if(data == 'success'){
						  $('#' + commentNo).remove();
						  
					  }
					  
					  
				  }
			  })
			  
			  
			  
			  
		  }
		  
	  })
	  	    
	  //댓글 수정 
	  //댓글 신고  
	 
      
	/*=================================================================================================================================================================
	  -----------------------------------------------------------------------------------------------------------------------------------------------------------------	
	  =================================================================================================================================================================*/  
    </script>
      
      
  
  
</body>
</html>
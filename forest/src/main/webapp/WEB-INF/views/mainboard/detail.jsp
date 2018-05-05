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
    
    .ownerProfile{
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
     margin-left:500px;
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
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png"" class="ownerProfile"> 
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
		        <textArea id="textArea" class="textArea" placeholder="공개 댓글 추가..." rows="1"></textArea>
		        
		        <div style="display:flex; margin-top:10px;">
		        <button id="erase" class="erase" type="button">CANCLE</button>
		        <button id="submit" class="submit" type="button" disabled="">댓글</button>
		        </div>
		        
	        </div>
	      </div>
	      
	      <div class="commentaryBoard"></div>
	      
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
				  		var comment = $('<div class="comment" style="display:flex; flex-wrap:wrap; margin-top:15px; margin-bottom:10px; width:750px;"  id="' + arr[i].comment_no + '">');
				  		
				  		if(arr[i].tree_after !== ""){
				  		var img = $('<img class="userProfile" src="/tree/' + arr[i].tree_after + '">'); 
				  		}else{
				  			var img = $('<img class="userProfile" src="${ pageContext.request.contextPath }/resources/images/default-user-image.png">');
				  				
				  		}
				  		
				  		var info = $('<div class="userProfile2" style="display:flex; flex-direction:column; margin-left:15px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
				  		             '<p class="userName">' + arr[i].nick_name + '</p>' + 
				  		             '<p class="commentDate"></p></div>' + 
				  		             '<p class="commentContent">' + arr[i].comment_content + '</p><p class="plusComment">답글</p></div>');
				  		
				  		img.appendTo(comment);
				  		info.appendTo(comment);
				  		
				  		if(arr[i].children > 0){
				  			var reply = $('<div style="display:flex; height:20px; position:relative;margin-left:65px;" class="reply"><p class="replyBtn" style="font-size:15px; padding-left:0px; padding-top:5px; padding-bottom:5px; height:20px;padding-right:35px; margin-top:0px;">답글 ' +
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
    			  
    			  for(var i = 0; i < arr.length; i++){
    				    var reply = $('<div>')
    				  
				  		var comment2 = $('<div class="comment2" style="display:flex; flex-wrap:wrap; margin-top:15px; margin-left:65px; margin-bottom:20px; width:750px;"  id="' 
				  		+ arr[i].comment_no + '">');
				  		
				  		if(arr[i].tree_after !== ""){
				  		var img = $('<img class="userProfile" style="width:35px; height:35px;" src="/tree/' + arr[i].tree_after + '">'); 
				  		}else{
				  			var img = $('<img class="userProfile" style="width:35px; height:35px;" src="${ pageContext.request.contextPath }/resources/images/default-user-image.png">');
				  				
				  		}
				  		
				  		var info = $('<div class="userProfile2" style="display:flex; flex-direction:column; margin-left:10px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
				  		             '<p class="userName">' + arr[i].nick_name + '</p>' + 
				  		             '<p class="commentDate"></p></div>' + 
				  		             '<p class="commentContent">' + arr[i].comment_content + '</p></div>');
				  		
				  		
				  		
				  		img.appendTo(comment2);
				  		info.appendTo(comment2);
				  		
				  		
				  		//대댓글을 어느 위치에 추가할 것인지 설정 
				  		if( $(e.target).parent().attr('class') == 'comment' ){
				  			$(e.target).after(comment2);
				  		}
				  		
				  		if( $(e.target).parent().parent().attr('class') == 'comment'){
				  			$(e.target).parent().after(comment2);
				  		}
				  		
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
	  

      $('#erase').on('click', function(){
    	  $('#submit').css('display','none');
    	  $('#erase').css('display','none');
    	  $('textArea').val('');
    	  $('textArea').height(18);
      })
      
      
    	  
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
    	  if( $(e.target).is( $('.plusComment') ) && !$(e.target).siblings().eq(2).is( $('.write') ) ){
    	  	  
    	  var write2 = ('<div class="write" id="write2" style="margin-bottom:0px">' + 
    			        '<img src="' + getProfileImage() + '" class="profile" id="loginUserProfile2" style="width:35px; height:35px;">' + 
  	                    '<div style="display:flex; flex-direction:column"><textArea id="textArea2" class="textArea" placeholder="공개 댓글 추가..." rows="1"></textArea>' + 
  	                    '<div style="display:flex; margin-top:10px;">' + 
  		                '<button id="erase2" class="erase erase2" type="button" style="display:inline-block">CANCLE</button>' + 
  		                '<button id="submit2" class="submit" type="button" disabled="" style="display:inline-block">댓글</button></div></div></div>'); 
    	  
  		        
    	  $(e.target).parent().append(write2); 
    	  
    	  //동적으로 추가된 textArea를 autosize적용
    	  autosize(document.querySelectorAll("textArea"));
    	  }
      })
      
      $(document).on('click', function(e){
    	 if( $(e.target).is( $('.erase2') ) ){
    		 
    		 $(e.target).parent().parent().parent().remove();
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
	  						
      				    	var comment = $('<div class="comment" style="display:flex; flex-wrap:wrap; margin-top:15px; margin-bottom:10px; width:750px;"  id="' + commentNo + '">');
    				  		
    				  		var img = $('<img class="userProfile" src="' + getProfileImage() + '">'); 
    				  		var info = $('<div class="userProfile2" style="display:flex; flex-direction:column; margin-left:15px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
    				  		             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
    				  		             '<p class="commentDate">1초 전</p></div>' + 
    				  		             '<p class="commentContent">' + $(e.target).parent().siblings().val() + '</p><p class="plusComment">답글</p></div>');
    				  		
    				  		
    				  		
    				  		img.appendTo(comment);
    				  		info.appendTo(comment);
    				  		$(comment).prependTo($('.commentaryBoard'));
	  						
  						    //댓글 추가시 폼 삭제 
	  					    $('#submit').css('display','none');
	  			    	    $('#erase').css('display','none');
	  			    	    $('#textArea').val('');
	  			    	    $('#textArea').height(18);
      				    	
      				    }
      				    
      				    
      				    //대댓글 추가 
      				    if( $(e.target).attr('id') == 'submit2' ){
      				    	var comment2 = $('<div class="gara" style="display:flex; flex-wrap:wrap; margin-top:15px; margin-left:65px; margin-bottom:20px; width:750px;"  id="' 
    				  		+ commentNo + '">');
    				  		
    				  		var img = $('<img class="userProfile" style="width:35px; height:35px;" src="' + getProfileImage() + '">'); 
    				  		var info = $('<div class="userProfile2" style="display:flex; flex-direction:column; margin-left:10px; margin-bottom:0px;"><div style="display:flex;" flex-direction:row">' +
    				  		             '<p class="userName">' + '${loginUser.mNickName}' + '</p>' + 
    				  		             '<p class="commentDate">1초 전</p></div>' + 
    				  		             '<p class="commentContent">' + $(e.target).parent().siblings().val() + '</p></div>');
    				  		
    				  		img.appendTo(comment2);
    				  		info.appendTo(comment2);
    				  		
    				  		//대댓글 insert한경우  추가할 곳은 2가지가 있다. 1. 전체댓글보기 버튼이 있는 경우 그 밑에 추가 2. 없는 경우 userProfile2밑에 추가.
    				  		if( $(e.target).parent().parent().parent().parent().siblings('.reply').length){
	   				  			$(e.target).parent().parent().parent().parent().siblings('.reply').after(comment2);
    				  		}else{
    				  			$(e.target).parent().parent().parent().parent().after(comment2);
    				  		}
    				  			
    				  		$(e.target).parent().parent().parent('#write2').remove();
    				  		
    				  		
    				  		
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
    		    
    			//처음 한번만 실행 
    			if( !$(e.target).parent().siblings('.comment2').length ){
	    		  	
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
    				
   				    $(e.target).siblings('.gara').remove();
	    		  	replyRequest.commentNo = $(e.target).parent().parent().attr('id');
	    		  	displayReplyFunc(replyRequest, e);
	    		  	
    				
    			}else{
    				if( $(e.target).parent().siblings('.comment2').css('display') == 'flex'){
    					//이미지 포용
        				if($(e.target).is($('.replyBtn'))){
	    					$(e.target).text(replyText);    	    				  					
        					$(e.target).siblings('img').attr('src', "${ pageContext.request.contextPath }/resources/images/up.PNG").attr('style','position:absolute; right:2px; top:1px;');
				    		$(e.target).parent().siblings('.comment2').toggle();	    					
        				}
    					
    					if($(e.target).is($('img')) ){
        					$(e.target).siblings('p').text(replyText);
        					$(e.target).attr('src', "${ pageContext.request.contextPath }/resources/images/up.PNG").attr('style','position:absolute; right:2px; top:1px;');
				    		$(e.target).parent().siblings('.comment2').toggle();	    					
        				}			
	    			}else{
	    				//이미지 포용
        				if($(e.target).is($('.replyBtn'))){
	    					$(e.target).text('답글 숨기기');    
	    					$(e.target).siblings('img').attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');;
				    		$(e.target).parent().siblings('.comment2').toggle();	    					
        				}
	    				if($(e.target).is($('img'))){
        					$(e.target).siblings('p').text('답글 숨기기');
        					$(e.target).attr('src', "${ pageContext.request.contextPath }/resources/images/down.PNG").attr('style','position:absolute; right:3px; top:4px;');;
				    		$(e.target).parent().siblings('.comment2').toggle();	    					
        				}		    					
	    			}
    				
    			}
    	   }
       })
      
    </script>
      
      
  
  
</body>
</html>
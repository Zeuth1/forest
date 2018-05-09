<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.forest.common.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta name="google-signin-client_id" content="569688176866-2fhuueq4kb1pddacn6jlomi8q5siqd48.apps.googleusercontent.com">
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script>
function init() {
	  gapi.load('auth2', function() { 
		  
	  });
	}

</script>

<style>
  #all{
    position:fixed;
    display:flex;
    flex-direction:row;
    justify-content:flex-start;

    left:0px;
    top:-5px;
    width:100%;
    height:70px;
    background:white;
    border-bottom:1px solid rgba(80,80,80,0.1);  
  }
  
  .menubarOverlay {
	 display: none;
	 position: fixed;
	 width: 100%;
	 height:100%;
	 left: 0%; top: 65px;
	 background-color: rgba(0,0,0, 0.3);
	 
  }
  
  #planeIcon{
    align-self:center;
    margin-top:5px;
    margin-left:20px;
    border-radius:50%;
    padding:10px;
    font-size:30px;
  }
  
  #planeIcon:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #searchIcon{
    position:absolute;
    top:27px;
    left:105px;
  }
  
  #searchBar{
    width:1100px;
    height:38px;
    align-self:center;
    
    margin-top:5px;
    margin-left:10px;
    padding-left:50px;
    background:rgba(80,80,80,0.1);
    border-radius:8px; 
    border:4px solid white;
    outline:none;
    font-weight: bolder;
    font-size:medium;
    
  }
   
  .searchNav{
    display:flex;
    flex-direction:column;
    top:60px;
    position:fixed;
    width:68%;
    
    background:white;
    border-radius:6px;
    
    margin-left:75px;
    display:none;
    
  }
  

  .historyArea p:hover{
    
    cursor:pointer;
  }
  .alertNav-inside{
  	
  		padding:5px;
  		border:1px solid black;
  
  }
  

  .historyArea{
    display:flex;
    flex-direction:column;
    justify-content:center;
    padding-left:20px;
    padding-top:5px;
    padding-bottom:5px;
    height:20px;
  }
  
  .historyArea:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  
  .searchResultNav{
    display:flex;
    flex-direction:column;
    
    top:60px;
    position:fixed;
    width:1200px;
    
    background:white;
    border-radius:6px;
    
    margin-left:4.7%;
    display:none;
    
  }
  
  .searchItem{
    display:flex;
    align-items:center;
    marin-left:20px;
  }
  
  .searchItem:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  .searchItem img{
   width:50px;
   height:50px;
   margin-left:15px;
   margin-right:15px;
   border-radius:50%;
   border:1px solid rgba(80,80,80,0.2);
  }
  
  
  /*  				alertNav-inside-wrap
   					alert-nav-logo-wrap
   					alert-nav-logo
   					alertNav-Content
   */
  .alertNav-inside-wrap:hover{
  
  	background:#efefef;
  }
  
  .alertNav-inside-wrap{
  
  	margin-top:15px;
  	width:80%;
  	height:20%;
  	display:block;
  }
  
  .alert-nav-log-wrap{
  	
  	width:30%;
  	height:100%;
  	margin-left:20px;
  border-bottom:1px solid #efefef;
  
  }
  
  .alert-nav-logo{
  	
  	width:15%;
  
  }
  .alertNav-Content{
  	
  	font-size:15px;
  	float:right;
  
  }
  
  
  
  
  #home{
    margin-left:20px;
    margin-right:20px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:100px;
    font-weight: bolder;
    font-size:medium;
    color:rgba(80,80,80,0.5);
  }
  
  #home:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  .userInfo{
    display:flex;
    align-self:center;
    height:30px;
    
    margin-top:5px;
    padding-left:10px;
    padding-right:40px;
    padding-top:5px;
    padding-bottom:5px;
    border-radius:25px;
    font-weight: bolder;
    color: rgba(80,80,80,0.5);
  }  
  
  .userInfo img{
    align-self:center;
    margin-right:5px;
    border-radius:100%;
    width:25px;
    height:25px;
  }
   
  .userInfo:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #alertIcon{
    position:absolute;
    right:70px;
    top:15px;
    font-size:25px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:100px;
  }
  
  #alertIcon:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  
  
  #alertNav {
  	overflow:scroll;
    top:70px;
    margin-left:76%;
    position: fixed;
    width: 250px;
    height: 400px;
    padding: 40px;
    background: #FFFFFF;
    -webkit-border-radius: 13px;  
    -moz-border-radius: 13px;
    border-radius: 6px;
    border: rgba(80,80,80,0.1) solid 1px;
    box-shadow:0px 3px 5px  rgba(80,80,80,0.1);
    display:none
  }
  #alertNav:after {
    content: '';
    position: absolute; 
    border-style: solid;  
    border-width: 0 14px 12px;
    border-color: #FFFFFF transparent;
    display: block;
    width: 0;
   
    top: -11px;
    left: 285px;
  }
 	#alertNav:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 14px 12px;
	border-color: rgba(80,80,80,0.1) transparent;
	display: block;
	width: 0;
	
	top: -12px;
	left: 285px;
  }	 
  
  #menuIcon{
   position:absolute;
    right:18px;
    top:15px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:100px;
    font-size: 25px;
    z-index:-1;
  }

  #menuIcon:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #menuNav {
    top:70px;
    margin-left:85%;
    position: fixed;
    width: 150px;
    height: 5px;
    padding: 40px;
    background: #FFFFFF;
    -webkit-border-radius: 13px;  
    -moz-border-radius: 13px;
    border-radius: 6px;
    border: rgba(80,80,80,0.1) solid 1px;
    box-shadow:0px 3px 3px  rgba(80,80,80,0.1);
    display:none;
  }
  #menuNav:after {
    content: '';
    position: absolute; 
    border-style: solid;  
    border-width: 0 14px 12px;
    border-color: #FFFFFF transparent;
    display: block;
    width: 0;
    z-index: 1; 
    top: -11px;
    left: 187px;
  }
 	#menuNav:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 14px 12px;
	border-color: rgba(80,80,80,0.1) transparent;
	display: block;
	width: 0;
	z-index: 0;
	top: -12px;
	left: 187px;
  }	

  #menuNav table{
    position:absolute;
    top:-1.5px;
    left:-2px;
    width:234px;
  }
  
  #manuNav tr{
    width:270px;
    height:20px;
    
  }
  
  #menuNav tr:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #menuNav td{    
    width:295px;
    font-weight: bolder;
    font-size:large;
    color:rgba(80,80,80,0.5);
    
    padding-top:10px;
    padding-bottom:7px;
    padding-left:15px;
  }
  
  #menuNav tr #t1{
    border-top-left-radius:5px;
    border-top-right-radius:5px;
  }
  
  #menuNav tr #t5{
    border-bottom-left-radius:5px;
    border-bottom-right-radius:5px;
  }
  .overlay {
  display: none;
  z-index: 100;
  position: fixed;
  width: 100%; height: 100%;
  left: 0; top: 0;
  background-color: rgba(0,0,0, 0.4);
  overflow-x: hidden;
}
  
 
</style>	
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

  <div class="menubarOverlay"></div>

<div class="g-signin2" data-onsuccess="onSignIn"></div>

  <div class="overlay"></div>
    <div id="all">
    
    <i class="fas fa-plane" id="planeIcon" onclick="location.href='mainBoard.ma'"></i>
    
    
	    <i class="fas fa-search" id="searchIcon" style="color:rgba(80,80,80,0.3); font-size:20px;"></i>
	    <input type="text" id="searchBar" onkeyup="searchStart()" onclick="searchStart()" placeholder="검색" autocomplete="off"
	           autocorrect="off" autocapitalize="off" spellcheck="false">
    
    
	    <p id="home" onclick="location.href='mainBoard.ma'">홈</p>
	    <div class="userInfo">
		    <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png" id="loginUserProfile"/>
		    <p style="font-weight:bolder; font-size:medium; align-self:center;">${ loginUser.mNickName }</p> <!-- 한글 공백없이 8자, 영어 최대 13자 -->
	    </div>
	    
	    
	    <i class="fas fa-comment-dots" id="alertIcon" style="color:rgba(80,80,80,0.3)"></i>
	    <i class="fas fa-bars" id="menuIcon" style="color:rgba(80,80,80,0.3)"></i>
	 
	    
   
    
  </div>
  <div class="searchNav">
    <p style="margin-left:20px; margin-top:10px; font-size:12px;">최근 검색 기록</p>
    <div class="historyArea"></div>
    	
  </div>
  <div class="searchResultNav">
    <p style="margin-left:20px; margin-top:10px; font-size:12px;">검색 결과</p>    	
    <table class='searchResultTable'></table>
  </div>
  
  
  <div id="alertNav">
  	
  
  </div>
  <div id="menuNav">
    <table>
     
      <tr><td id="t1">마이페이지</td></tr>
      
      <tr><td id="t5" onclick="signOut();">로그아웃</td></tr>
    </table>
  </div>
   
  <c:if test="${ sessionScope.loginUser == null }">
    <script>
      location.href="login.lo";
    </script>
  </c:if> 
  
   
   
  <script>
    $(function(){

    	//프로필사진 불러오기
    	$.ajax({
			  url:"getProfile.ma",
			  type:"POST",
			  data:JSON.stringify('${loginUser.mNickName}'),
			  dataType:"json",
			  contentType:"application/json",
			  success:function(data){
				  console.log(data);
				  var loginUserProfile = '/tree/' + data.profile;
				  
				   if(data.profile !== null){
					  $('#loginUserProfile').attr('src', loginUserProfile);
				  }
				   
				   
			  }
			  
		  })
    })
  
  
     $('#searchBar').on('click', function(){
    	
    	$('.menubarOverlay').css('display','block');
    	
    	$('#searchBar').css("border","4px solid rgb(128, 191, 255)").css("border-radius","6px");
    	
    	$('.searchNav').css('display','flex');
    	
    }); 
    
    $(document).on('click', function(e){
    	if( ! $(e.target).is($('#searchBar')) && ! $(e.target).is( $('.searchNav') ) ){
    		$('.menubarOverlay').css('display','none');
    		$('#searchBar').css("border","4px solid white").css("border-radius","8px");
    	}
    	
    	if( ! $(e.target).is($('#alertNav'))  ){
    		if( $('#alertNav').css('display','block')){
    			$('#alertNav').css("display","none")
    		}
    	}
    	
    	if( ! $(e.target).is($('#menuNav')) ){
    		if( $('#menuNav').css('display','block')){
    			$('#menuNav').css("display","none")
    		}
    	}
    	
    	if( ! $(e.target).is($('.searchNav')) && ! $(e.target).is($('#searchBar')) ){
    		if( $('.searchNav').css('display','flex')){
    			$('.searchNav').css("display","none")
    		}
    	}
    	
    	if( ! $(e.target).is($('.searchResultNav')) && ! $(e.target).is($('#searchBar')) ){
    		if( $('.searchResultNav').css('display','flex')){
    			$('.searchResultNav').css("display","none")
    			
    			
    		}
    	}
    		
    	
    	
    });    

    $(document).on('click', function(e){
    	
    	    if(  $(e.target).is($('#menuIcon')) || $(e.target).parent().is($('#menuIcon')) ) {
    		    if( $('#menuNav').attr("display","none")){
        		    $('#menuNav').css("display","block");
        		}
    		}
    		
    		if(  $(e.target).is($('#alertIcon')) || $(e.target).parent().is($('#alertIcon')) ){
    		    if( $('#alertNav').attr("display","none")){
        		    $('#alertNav').css("display","block");
        		}
    		}
    		
    		if(  $(e.target).parent().is($('.searchItem')) || $(e.target).is('.searchItem') ){
    			if( $(e.target).parent().is($('.searchItem')) ) {
    				var item = $(e.target).parent().attr('id').split('#')[1];
    				
    				location.href="searchPage.ma?item=" + item;
    				
    			}
    			if( $(e.target).is('.searchItem') ) {
    				var item = $(e.target).attr('id').split('#')[1];
    				
    				location.href="searchPage.ma?item=" + item;
    			  
    			}
    			
    		}
    		
    		if( $(e.target).parent().is($('.historyArea')) || $(e.target).is('.historyArea')){
    			if( $(e.target).parent().is($('.historyArea')) ){
    				var item = $(e.target).text();
    				location.href="searchPage.ma?item=" + item;
    			}
    			if( $(e.target).is('.historyArea') ){
    				var item = $(e.target).children().text();
    				location.href="searchPage.ma?item=" + item;
    			}
    		}
    		
    	});		
    
    
    var delta = 500;
    var timer = null;
    
    
    
    function searchStart(){
    	clearTimeout( timer );
    	timer = setTimeout( function searchStart(){
    		var word = $('#searchBar').val();
    		var wordJ = JSON.stringify(word);
    		var num = 0;
    		
    		if(word != ''){
			  
    		  $.ajax({
	    			url:"observe.ma",
	      			type:"POST",
	      			data:wordJ,
	      			dataType:"json", 
	    			contentType:"application/json",
	      			
	      			
	      			success:function(data){	      	
	      				$('.searchNav').css('display','none');
	      				
	      					
	      				$('.searchItem').remove();
	      				$.each(data, function(key, value){
	      					if(num == 5) return false;
	      					
	      					num++;
	      				
	      					var searchItem = $('<div class="searchItem">');
	      					$('<img src="${ pageContext.request.contextPath }/resources/images/2000px-Number_sign.svg.png">').appendTo(searchItem);
	      					$('<p>' + key + '<br>게시물 ' + value + ' 개</p>').appendTo(searchItem);
	      					searchItem.attr('id',key);
	      				    searchItem.appendTo('.searchResultNav');
		      				
	      				});
	      				
	      			}
    			  
    		  });
    	    $('.searchResultNav').css('display','flex');
    			
    		}else{    			
    		    $.ajax({
    		    	url:"history.ma",
    		    	type:"POST",
    		    	dataType:"json",
    		    	contentType:"application/json",
    		    	success:function(data){
    		    		$('.historyArea').remove();
    		    		
    		    		var arr = data.historyList;
    		    		
    		    		for(var i = 0; i < arr.length; i++){
    		    			var historyArea = $('<div class="historyArea">');
    		    			$('<p style="font-size:15px; font-weight:bolder">' + arr[i] + '</p>').appendTo(historyArea);
    		    			historyArea.appendTo($('.searchNav'));
    		    		}
    		    		
    		    		
    		    		
    		    	}
    		    	
    		    });
    			$('.searchResultNav').css('display','none');
    			$('.searchNav').css('display','flex');
    			
    		}
    	}, delta)
    	
    }    
    
    $('#t4').on('click', function(){
    	location.href="support.set";
    })
    /* 
    $('#t5').on('click', function(){
    	
    	location.href="logout.lo"; 
    
    }) */
    	
    	  function signOut() {
    	    var auth2 = gapi.auth2.getAuthInstance();
    	    auth2.signOut().then(function () {
    	    console.log('User signed out.');
    	    });
    	    location.href="logout.lo"; 
    	  }
    
    $('#t0').on('click', function(){
    	location.href="a_memberSearchView.man";
    })
    $('#name').click(function(){
    	location.href="myBoard.my";
    });
    

    $('.userInfo').on('click', function(){
    	location.href="myBoard.my?mno="+ ${loginUser.mNo};
    })

    $("#t1").on('click',function(){
    	location.href="settingPage.set"
    })
    
    function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
    
    
  </script>
  <!-- 알림 -->
  <script>
  
  var url=window.location.host;
  var pathname = window.location.pathname;
  var appCtx = pathname.substring(0, pathname.indexOf("/",2));
  var root = url+appCtx;
 
  

			var wsUri = "ws://"+root+"/echo";
			
			function send_message(){
				
				websocket = new WebSocket(wsUri);
				websocket.onopen =function(evt){
					onOpen(evt);
					
				}
				websocket.onmessage = function(evt){
					
					onMessage(evt);
					
				};
				websocket.onerror = function(evt){
					onError(evt);
				}
				
				
				
			}
			
			function onOpen(evt){
				
				websocket.send("[${loginUser.mName}]");
			}
			
			
			function onError(evt){
				
				
			}
			$(function(){
				
				send_message();
			})

	function onMessage(evt){
		var path='<%=request.getContextPath()%>';
		var newDiv="";
		newDiv+="<div class='alertNav-inside-wrap'><span class='alert-nav-logo-wrap'>"
				newDiv+="<img class='alert-nav-logo' src='"+path+"/resources/images/logo.png'></span>"
				newDiv+="<span class='alertNav-Content'>"+evt.data+"</span></div>"
			 	alert.append(newDiv);
		
	}
	
  
  	
	
  
  </script>
   
  <!--알림불러오기  --> 
   <script>
   var path='<%=request.getContextPath()%>';
   
    var alert= $("#alertNav")
   
   	$.ajax({
   		
   		url:"getAr.set",
   		success:function(data){
   			
   			
   			for(var i=0; i<data.ar.length;i++){
   				
   				console.log(data.ar[i]);	
   				var content=data.ar[i].nContent;
   				var title=data.ar[i].nTitle;
   				
   				var newDiv="";
   				newDiv+="<div class='alertNav-inside-wrap'><span class='alert-nav-logo-wrap'>"
   				newDiv+="<img class='alert-nav-logo' src='"+path+"/resources/images/logo.png'></span>"
   				newDiv+="<span class='alertNav-Content'>"+content+"</span></div>"
   			 	alert.append(newDiv);
   			
   			}
   			
   			
   			
   			
   		}
   		
   		
   	})
   
   
   
   </script>
   <script>
   function reload(){
       
       
       $("#alertNav").load(window.location.href+" #alertNav");
            /*     $("#alertNav").load('refresh.html').fadeIn("slow"); */
   }
   
   </script>
   
   
</body>
</html>
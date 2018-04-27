<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.forest.common.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
  
  .overlay {
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
    width:1150px;
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
    width:1200px;
    
    background:white;
    border-radius:6px;
    
    margin-left:4.7%;
    display:none;
    
  }
  
  .history{
    display:flex;
    height:40px;
    align-items:center;
    
  }
  
  .history p{
    margin-left:20px;
  }
  
  .history:hover{
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
    height: 115px;
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
    
    padding-top:7px;
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
  
  
 
</style>	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" http-equiv="Pragma" content="no-cache" http-equiv="Cache-Control" content="no-cache">
<title>Insert title here</title>
</head>
<body>
  <div class="overlay"></div>
    <div id="all">
    
    <i class="fas fa-plane" id="planeIcon" onclick="location.href='mainBoard.ma'"></i>
    
    
	    <i class="fas fa-search" id="searchIcon" style="color:rgba(80,80,80,0.3); font-size:20px;"></i>
	    <input type="text" id="searchBar" onkeyup="searchStart()" onclick="searchStart()" placeholder="검색" autocomplete="off"
	           autocorrect="off" autocapitalize="off" spellcheck="false">
    
    
	    <p id="home" onclick="location.href='mainBoard.ma'">홈</p>
	    <div class="userInfo">
		    <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png"/>
		    <p style="font-weight:bolder; font-size:medium; align-self:center;">${ sessionScope.loginUser.mNickName }</p> <!-- 한글 공백없이 8자, 영어 최대 13자 -->
	    </div>
	    
	    
	    <i class="fas fa-comment-dots" id="alertIcon" style="color:rgba(80,80,80,0.3)"></i>
	    <i class="fas fa-bars" id="menuIcon" style="color:rgba(80,80,80,0.3)"></i>
	 
	    
   
    
  </div>
  <div class="searchNav">
    <p style="margin-left:20px; margin-top:10px; font-size:12px;">최근 검색 기록</p>
    	
  </div>
  <div class="searchResultNav">
    <p style="margin-left:20px; margin-top:10px; font-size:12px;">검색 결과</p>    	
    <table class='searchResultTable'></table>
  </div>
  
  
  <div id="alertNav"></div>
  <div id="menuNav">
    <table>
      <c:if test="${ sessionScope.loginUser.mLevel == 1 }">
        <tr><td id="t0">관리자 페이지</td></tr>
        <script> $('#menuNav').css('height','153px')</script>
      </c:if>
      <tr><td id="t1">프로필 수정</td></tr>
      <tr><td id="t2">후원자 조회</td></tr>
      <tr><td id="t3">후원내역 조회</td></tr>
      <tr><td id="t4">고객 센터</td></tr>
      <tr><td id="t5">로그아웃</td></tr>
    </table>
  </div>
   
  <c:if test="${ sessionScope.loginUser == null }">
    <script>
      location.href="login.lo";
    </script>
  </c:if> 
  
   
   
  <script>
    $(function(){
    	
    })
  
  
     $('#searchBar').on('click', function(){
    	
    	$('.overlay').css('display','block');
    	
    	$('#searchBar').css("border","4px solid rgb(128, 191, 255)").css("border-radius","6px");
    	
    	$('.searchNav').css('display','flex');
    	
    }); 
    
    $(document).on('click', function(e){
    	if( ! $(e.target).is($('#searchBar')) && ! $(e.target).is( $('.searchNav') ) ){
    		$('.overlay').css('display','none');
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
    		
    		if( $(e.target).parent().is($('.history')) || $(e.target).is('.history')){
    			if( $(e.target).parent().is($('.history')) ){
    				var item = $(e.target).text();
    				location.href="searchPage.ma?item=" + item;
    			}
    			if( $(e.target).is('.history') ){
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
    		    		$('.history').remove();
    		    		
    		    		var arr = data.historyList;
    		    		
    		    		for(var i = 0; i < arr.length; i++){
    		    			var  history = $('<div class="history">')
    		    			$('<p style="font-size:15px; margin-bottom:10px; font-weight:bolder">' + arr[i] + '</p>').appendTo(history);
    		    			history.appendTo('.searchNav');
    		    		}
    		    	}
    		    	
    		    });
    			$('.searchResultNav').css('display','none');
    			$('.searchNav').css('display','flex');
    			
    		}
    	}, delta)
    	
    }    
    
    $('#t4').on('click', function(){
    	location.href="helpCenter.help";
    })
    
    $('#t5').on('click', function(){
    	location.href="logout.lo";
    
    })
    
    $('#t0').on('click', function(){
    	location.href="a_memberSearchView.man";
    })
    
    $('.userInfo').on('click', function(){
    	location.href="myBoard.my";
    })
    
    
    
  </script> 
</body>
</html>
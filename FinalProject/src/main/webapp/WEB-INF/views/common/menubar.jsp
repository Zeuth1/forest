<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
  #all{
    position:fixed;
    left:0px;
    top:-5px;
    width:100%;
    height:70px;
    border-bottom:1px solid rgba(80,80,80,0.1);
    background:white;
    z-index:1;
    
  }
  
  #searchBar{
    postition:absolute;
    width:1150px;
    height:40px;    
    margin-left:90px;
    margin-top:17px;
    margin-bottom:10px;
    padding-left:50px;
    background:rgba(80,80,80,0.1);
    border-radius:5px; 
    border:0px;
    outline:none;
    font-weight: bolder;
    font-size:medium;
    z-index:3;
  }
  
  #outline{
    position:absolute;
    left:90px;
    top:15px;
    width:1195px;
    height:40px;
    border:4px solid rgb(128, 191, 255);
    border-radius:10px;
    visibility:hidden;
    z-index:2;
    
  }
  
  #plane{
    position:absolute;
    top:13px;
    left:18px;
    border-radius:50%;
    padding:10px;
    font-size:30px;
  }
  
  #plane:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #home{
    position:absolute;
    left:1317px;
    top:2px;
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
  
  #searching{
    position:absolute;
    top:27px;
    left:105px;
    font-size:20px;
    
  }
  
  #pic{
    position:absolute;
    top:22px;
    left:1380px;
    border-radius:100%;
    padding:7px;
    font-size:15px;
    background:rgba(80,80,80,0.3);
  }
  
  #name{
    position:absolute;
    top:0px;
    left:1372px;
    padding-left:45px;
    padding-right:20px;
    padding-top:10px;
    padding-bottom:10px;
    border-radius:25px;
    font-weight: bolder;
    font-size:medium;
    color: rgba(80,80,80,0.5);
  }
  
  #name:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #alert{
    position:absolute;
    top:15px;
    left:1567px;
    font-size:25px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:100px;
  }
  
  #alert:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  #menu{
    position:absolute;
    top:15px;
    left:1627px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:100px;
    font-size: 25px;
  }

  #menu:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  
   #alertNav {
    top:5px;
    left:1295px;
    position: relative;
    width: 250px;
    height: 400px;
    padding: 40px;
    background: #FFFFFF;
    -webkit-border-radius: 13px;  
    -moz-border-radius: 13px;
    border-radius: 13px;
    border: rgba(80,80,80,0.1) solid 1px;
    box-shadow:3px 3px 5px  rgba(80,80,80,0.1), -3px 0px 5px  rgba(80,80,80,0.1);
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
    z-index: 1; 
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
	z-index: 0;
	top: -12px;
	left: 285px;
  }	 
  
  
  #menuNav {
    top:5px;
    left:1452px;
    position: relative;
    width: 150px;
    height: 115px;
    padding: 40px;
    background: #FFFFFF;
    -webkit-border-radius: 13px;  
    -moz-border-radius: 13px;
    border-radius: 13px;
    border: rgba(80,80,80,0.1) solid 1px;
    box-shadow:3px 3px 5px  rgba(80,80,80,0.1), -3px 0px 5px  rgba(80,80,80,0.1);
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
  
  table{
    position:absolute;
    top:-1.5px;
    left:-2px;
    width:234px;
  }
  
  tr{
    width:270px;
    height:20px;
    
  }
  
  tr:hover{
    background:rgba(80,80,80,0.1);
    cursor:pointer;
  }
  
  td{    
    width:295px;
    font-weight: bolder;
    font-size:large;
    color:rgba(80,80,80,0.5);
    
    padding-top:7px;
    padding-bottom:7px;
    padding-left:15px;
  }
  
  tr #t1{
    border-top-left-radius:10px;
    border-top-right-radius:10px;
  }
  
  tr #t5{
    border-bottom-left-radius:10px;
    border-bottom-right-radius:10px;
  }
  
  .overlay {
	 position: fixed;
	 display: none;
	 z-index: 1000;
	 width: 100%;
	 height:100%;
	 left: 0; top: 66px;
	 background-color: rgba(0,0,0, 0.3);
	 overflow-x: visible;
  }
  
 
</style>	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <div id="all">
    <i class="fas fa-plane" id="plane" onclick="location.href='index.jsp'"></i>
    <i class="fas fa-search" id="searching" style="color:rgba(80,80,80,0.3)"></i>
    <p id="home" onclick="location.href='index.jsp'">홈</p>
    <i class="fas fa-user" id="pic" style="color:white"></i>
    <p id="name">dddddddddd</p> <!-- 한글 공백없이 8자, 영어 최대 13자 -->
    <i class="fas fa-comment-dots" id="alert" style="color:rgba(80,80,80,0.3)" onclick="alert()"></i>
    <div id="menuCap"><i class="fas fa-bars" id="menu" style="color:rgba(80,80,80,0.3)"></i></div>
    <div id="outline" style="z-index:-1;"></div>
    <input type="text" id="searchBar" placeholder="검색" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" style="z-index:3;">
    <div id="alertNav"></div>
    <div id="menuNav">
      <table>
        <tr><td id="t1">프로필 수정</td></tr>
        <tr><td>후원자 조회</td></tr>
        <tr><td>후원내역 조회</td></tr>
        <tr><td>게시판</td></tr>
        <tr><td id="t5">로그아웃</td></tr>
      </table>
    </div>
    </div> 
    <div class="overlay"></div>
    
  <script>
    /* $('#searchBar').click(function(){
    	$('#outline').css('visibility','visible');   	
    }); */
    
    $('#searchBar').mousedown(function(){
    	$('#outline').css('visibility','visible');  
    	$('.overlay').css('display','block');
    });
    
    
    $(document).on('click', function(e){
    	console.log($(e.target));
    	if( ! $(e.target).is($('#searchBar')) ){
    		$('#outline').css('visibility','hidden');
    	}
    	
    });
    
    $('#menuCap').click(function(){
    	$('#alertNav').css('display','none');
    	$('#menuNav').css('display','block');
    });
    
    $('#menuNav').mouseleave(function(){
    	$('#menuNav').css('display','none');
    })
    
    $('#alertNav').mouseleave(function(){
    	$('#alertNav').css('display','none');
    });
    
    function alert(){
    	$('#menuNav').css('display','none');
    	$('#alertNav').css('display','block');
    }
    
    $('#name').click(function(){
    	location.href="#";
    })
    
    $(document).on('click', function(e){
    	console.log($(e.target));
    	if( ! $(e.target).is($('#searchBar')) ){
    		$('.overlay').css('display','none');
    		
    	}
    	
    	
    	
    });
    
  </script> 
</body>
</html>
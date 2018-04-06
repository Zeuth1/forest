<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
  #detail{
    border-radius:10px;
    margin-left:auto;
    margin-right:auto;
    margin-top:30px;
    width:65%;
    background:white;
    left:17%;
  }

   #detail figure{
     width:480px;
     padding-top:70px;
   }
   
  #detail figure img{
    border-radius:10px;
    margin-top:0px;
    max-width:480px;
    width:480px;
    display:block;
    margin-left:auto;
    margin-right:auto;
  }
  
  #detail figure img:hover{
    cursor:pointer;
    background: rgba(80,80,80,0.1);
  }
   
  .background {
	 position: fixed;
	 display: block;
	 z-index: -1;
	 width: 100%;
	 height:100%;
	 left: 0; top: 0;
	 background-color: rgba(0,0,0, 0.1);
	 overflow-x: visible;
  }
  
  #columns{
     z-index:100;  
     column-width:235px;
     column-gap:0px;
     margin-top:40px;
     margin-left:70px;
     margin-right:70px;
     align:center;
   }
   #columns figure{
     display: inline-block;
     margin-bottom: 1px;
     margin-top:1px;
     margin-left:1px;
     margin-right:1px;
     padding:10px;
     border-radius:10px; 
     width:230px;
   }
   #columns figure:hover{
     cursor:pointer;
     background: rgba(80,80,80,0.1);
   }
   
   #columns figure img{
     width:230px;
     border-radius:10px;
     
   }
   #columns figure figcaption{
     display: -webkit-box; 
     display: -ms-flexbox; 
     display: box; 
     margin-top:1px; 
     max-height:80px; 
     overflow:hidden; 
     vertical-align:top; 
     text-overflow: ellipsis; 
     word-break:break-all; 
     -webkit-box-orient:vertical; 
     -webkit-line-clamp:3;
     font-weight:bold;
     width:210px;
     margin-left:auto;
     margin-right:auto;
   }
   
   #pre{
     z-index:10;
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
    
    #modifyBtn{
    position:absolute;
	left:335px;
	top:45px;
	padding:10px;
	
	padding-bottom:9px;
	border-radius:100px;
	font-weight: bolder;
	font-size:20px;
	color:rgba(0,0,0,0.3);
    }
    
    #modifyBtn:hover{
      background:rgba(80,80,80,0.1);
      cursor:pointer;
    }
   
   #homeBtn{
    z-index:200;
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
   
   #storeBtn{
    position:absolute;
    top:50px;
    left:1270px;
    font-size:17px;
    padding:15px;
    padding-top:7px;
    padding-bottom:7px;
    border-radius:7px;
    color:white;
    background:rgba(220, 0, 0);
    font-weight:bolder;
  }
  
  #storeBtn:hover{
    background:rgba(210, 0, 0);
    cursor:pointer;
  }
      
   #downed{
    position:absolute;
    top:48px;
    right:430px;
    font-size:17px;
    padding:15px;
    padding-top:9px;
    padding-bottom:9px;
    border-radius:7px;
    color:(0,0,0, 0.2);
    font-weight:bolder;
  }
  
   
   #goBoardBtn{
     position:absolute;
     top:130px;
     left:850px;
     width:500px;
     height:40px;
     border-radius:7px;
     background:rgba(80,80,80,0.1);
     font-weight: bolder;
	 font-size:large;
	 color:rgba(0,0,0,0.8);
	 
   }
   
   #goBoardBtn:hover{
     background:rgba(0,0,0, 0.2);
     cursor:pointer;
   }
   
   #goBoard{
     position:absolute;
     top:-10px;
     left:190px;
   }
   
   
   
   #description{
     position:absolute;
     border-top:1px solid rgba(80, 80, 80, 0.3);
     top:185px;
     left:850px;
     width:500px;
     height:40px;
     font-weight:500;
   }
   
   #profile{
     position:relative;
     top:15px;
     width:50px;
     height:50px;
     border-radius:100%;
   }
   
   a{
     font-weight:900;
     text-decoration:none;
     color:black;
   }
    
   #des{
     position:absolute;
     top:10px;
     left:65px;
     width:410px;
     display: -webkit-box; 
     display: -ms-flexbox; 
     display: box; 
     margin-top:1px; 
     max-height:80px; 
     overflow:hidden; 
     vertical-align:top; 
     text-overflow: ellipsis; 
     word-break:break-all; 
     -webkit-box-orient:vertical; 
     -webkit-line-clamp:3;
   }
   
   #comment{
     border-bottom:1px solid rgba(80, 80, 80, 0.3);
     margin-top:40px;
     font-size:17px;
     height:40px;
   }
</style>
<title>Insert title here</title>
</head>
<body>
	  <c:set var="src1" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/cinderella.jpg" scope="request"/>
	  <c:set var="src2" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/rapunzel.jpg" scope="request"/>
	  <c:set var="src3" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/belle.jpg" scope="request"/>
	  <c:set var="src4" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/mulan_2.jpg" scope="request"/>
	  <c:set var="src5" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/sleeping-beauty.jpg" scope="request"/>
	  <c:set var="src6" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/pocahontas_2.jpg" scope="request"/>
	  <c:set var="src7" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/snow-white.jpg" scope="request"/>
	  <c:set var="src8" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/ariel.jpg" scope="request"/>
	  <c:set var="src9" value="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/tiana.jpg" scope="request"/>
	  <c:set var="figcaption1" value="Cinderella wearing European fashion of the mid-1860'"/>
	  <c:set var="figcaption2" value="Rapunzel, clothed in 1820’s period fashion'"/>
	  <c:set var="figcaption3" value="Belle, based on 1770’s French court fashion'"/>
	  <c:set var="figcaption4" value="Mulan, based on the Ming Dynasty period'"/>
	  <c:set var="figcaption5" value="Sleeping Beauty, based on European fashions in 1485'"/>
	  <c:set var="figcaption6" value="Pocahontas based on 17th century Powhatan costume'"/>
	  <c:set var="figcaption7" value="Snow White, based on 16th century German fashion'"/>
	  <c:set var="figcaption8" value="Ariel wearing an evening gown of the 1890’s'"/>
	  <c:set var="figcaption9" value="Tiana wearing the <i>robe de style</i> of the 1920’s'"/>
  
  <div class="background"></div>
  <div id="detail">
      <figure>
        <img src="${ param.src }">  
      </figure>
      <i class="fas fa-chevron-left" id="pre"></i>
      <div id="homeBtn">메인으로 돌아가기</div>
      <div id="modifyBtn"><i class="fas fa-ellipsis-h" id="modify"></i></div>
      <div id="storeBtn"><i class="fas fa-thumbtack" style="font-size:15px; padding-right:5px;"></i>저장</div>
      <div id="downed"><i class="fas fa-thumbtack" style="font-size:15px; padding-right:5px; top:10px;"></i>1,873</div>
      <div id="goBoardBtn" onclick="location.href='#'"><p id="goBoard">더 많은 트리 보기</p></div>
      <span id="description">
        <img src="${ src1 }" id="profile"> 
      	<p id="des">
      	  <a href="#">유민수</a> 님이 <a href="#">사람들</a>에 저장함
      	  <br>${ param.figcaption }dddddddddddddddddd
      	</p>
      	<p id="comment">댓글 3개 모두보기</p>
      </span>
  </div>   
  
  
      <h2>작가 보드의 다른 트릐</h2>
    
    <div id="columns">
      <figure>
        <img src="${ src1 }">  
        <figcaption title="${ figcaption1 }">${ figcaption1 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src2 }">  
        <figcaption title="${ figcaption2 }">${ figcaption2 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src3 }">  
        <figcaption title="${ figcaption3 }">${ figcaption3 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src4 }">  
        <figcaption title="${ figcaption4 }">${ figcaption4 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src5 }">  
        <figcaption title="${ figcaption5 }">${ figcaption5 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src6 }">  
        <figcaption title="${ figcaption6 }">${ figcaption6 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src7 }">  
        <figcaption title="${ figcaption7 }">${ figcaption7 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src8 }">  
        <figcaption title="${ figcaption8 }">${ figcaption8 }</figcaption>
      </figure>
      
      <figure id="anchor">
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
      
      
      <script>
      $(function(){
    	$('img').on('click', function(){
    		 
     		location.href="detail.jsp?src=" + $(this).attr('src') + "&figcaption=" + $(this).siblings().eq(0).attr('title');
     		
     	 });
      
      });
      
      $('#homeBtn').click(function(){
      	location.href="index.jsp";
      })
      
    </script>
      
      
  
  
</body>
</html>
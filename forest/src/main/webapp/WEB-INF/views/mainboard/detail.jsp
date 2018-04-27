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
    flex-wrap:wrap;
    border-radius:10px;
    margin-left:auto;
    margin-right:auto;
    margin-top:30px;
    width:61%;
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
	    width:95%;
	    margin-top:2%;
	    margin-bottom:2%;
	    margin-left:auto;
	    margin-right:auto;
	    display:flex;
    }
    
    #modifyBtn{
        margin-right:80%;
	    
		width:30px;
		padding-left:10px;
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
        
	    font-size:17px;
	    padding:15px;
	    padding-top:9px;
	    padding-bottom:9px;
	    border-radius:7px;
	    color:(0,0,0, 0.2);
	    font-weight:bolder;
    }
    
   .figure{
     width:480px;
     magin-top:70px;
     margin-bottom:2%;
     margin-left:auto;
     margin-right:auto;
   }
   
  .figure img{
    border-radius:10px;
    max-width:480px;
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
     margin-top:2%;
     width:480px;
     
   }
   
   #goBoardText{
     text-align:center;
     
   }
   
   #goBoardBtn{
     display:flex;
     justify-content:center;
     align-items:center;
     width:450px;
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
     width:450px;
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
     
     margin-top:10px;
     font-size:17px;
     width:450px;
     margin-bottom:20px;
   }
   
   textArea{
  
     font-family: 'Nanum Gothic', sans-serif;
     width:380px;
     margin-left:20px;
    
     resize:none;
     border-bottom:1px solid black;
     border-top:0px;
     border-right:0px;
     border-left:0px; 
   } 
   
   textArea:focus{
     outline:none;
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
	        <img src="/tree/${ detail.treeAfter }" class="profile"> 
	      	<p id="uploadDetail">
	      	  <a href="#">${ detail.mNickName }</a> 님이 <a href="#">${ detail.boardTitle }</a>에 저장함
	      	  <br>${ detail.treeTag }
	      	</p>
      	</div>
      
	    <div class="commentary">
	      <p style="margin-top:5px; margin-bottom:20px">댓글 5개</p>
	      <div id="write" style="display:flex">
	        <img src="${ pageContext.request.contextPath }/resources/images/default-user-image.png"/ class="profile">
	        <form class="form">
	        <textArea placeholder="공개 댓글 추가..." rows="1"></textArea>
	        <button type="submit">댓글</button>
	        <button type="button" onclick="erase()">CANCLE</button>
	        </form>
	      </div>
	      
	      <div class="commentaryBoard">
	      
	      </div>
	    </div>
      
      </div>
      
        
    
    
    </div>   

  
      <h3 style="margin-left:20%;">유사한 트리 더 보기</h3>
      
      
      <script>
      
		autosize(document.querySelectorAll("textArea"));

      function erase(){
    	  $('textArea').val('');
    	  $('textArea').height(18);
    	 
      };
      $('#homeBtn').click(function(){
      	window.history.back();
      })
      
      
      
      
    </script>
      
      
  
  
</body>
</html>
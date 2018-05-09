<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>

    .column-container{
        display:flex;
        margin-top:30px;
        width:91%;
        margin-left:auto;
        margin-right:auto;
      }
      
      .columns{
        display:flex;
        flex-direction:column;															
        justify-content:flex-start;
        
        margin-right:10px;
      }
      

      .columns .figure{
        margin-bottom:10px;
        border-radius:10px; 
       
        padding-top:8px;
        padding-right:8px;
        padding-left:8px;
        padding-bottom:0.1px;
 
      }
    
      
      .columns .figure:hover{
        cursor:pointer;
        background: rgba(80,80,80,0.1);
      }
      
      .columns .figure img{
        width:230px;

        border-radius:10px;
      }
      
      .columns .figure p{
        margin-top:1px; 
        max-height:80px; 
        overflow:hidden; 
        text-overflow: ellipsis; 
        word-break:break-all;
        font-size:14px;
        font-weight:bold;
        width:210px;
        margin-left:auto;
        margin-right:auto;

      }
      
  input,textarea {
  	  border: 2px solid #7BA7AB;
  	  border-radius: 5px;
 	  outline: none;
	  color: #9E9C9C;
	}
	input:active,input:hover{
		background: #F9F0DA;
	}
	.col-sm-4{
		display: inline-block;
		width: 200px;
  		height: 100px;
  		margin: 1em;
	}
	.img-responsive{
		width:100%;
		height:200%;
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
  
  #modal{
    z-index:200;
  }
  
  </style>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	<div class="overlay"></div>
	
	
	
		 
 	 <div class="column-container">
 	 <c:if test="${loginUser.mNo == ownerNo}">
		<figure id="pluser">
		<img id="finadd" src="<%= request.getContextPath() %>/resources/images/plusBtn.PNG" class="img-responsive" style="padding:20px;width:50px; height:50px;cursor: pointer;" alt="보드만들기">
		</figure>
    	 
     </c:if>
    
    <div class="columns container1">
     
    </div>
    
    <div class="columns container2">
     
     
    </div>
    
    <div class="columns container3">
     
     
    </div>
    
    <div class="columns container4">
     
       
     
    </div>
    
    <div class="columns container5">
     
     
    </div>
    
    <div class="columns container6">
     
      
     
    </div>
    
    </div>  	 

	



<div id="modal" style="background:white; position:fixed; top:10%; right:23%; ">

</div>

<script>

//셀렉트 
$(document).on('click','.figure',function(){
    	  console.log($(this).attr('id'));
    	  location.href="detail.ma?treeNo=" + $(this).attr('id');
      });
      
    
      
      var board = '${board}';
      $(function(){
    	  console.log(board);
    	  $.ajax({
    		  url:"myBoardFinSelect.my",
    		  type:"POST",
    	      data:JSON.stringify(board),
    	      dataType:"json",
    	      contentType:"application/json",
    		  success:function(data){
    			  var arr = data.board;
    			  console.log(data);
    			  if(data.board !== null){
      				
      				var arr = data.board;
      				
      				  for(var  j = 0; j < 7; j++){  
      					
  	    				for(var i = 1; i < 7; i++){
  	    				    
  		    				$('<div class="figure" id="' + arr[(j * 6) + (i - 1)].tree_No + '"><img src="/tree/' + 
  		    						arr[(j * 6) + (i - 1)].tree_After + '"/><p>' + arr[(j * 6) + (i -1)].tree_Tag + '</p></div>').appendTo($('.container' + i ) );                                      
  	    				    
  	    				}
      				  }
      				
      				
      			}
    		  }
    	  })
			
      });

	
	$(document).on('click', function(e){
		if( $(e.target).is('#finadd') ){
    	  
			$('#modal').css('display','inline-block');
			$('#modal').load('finAddForm.my');
			$('.overlay').css('display', 'inline-block');
			
		}
	})
	
	$(document).on('click', function(e){
		if( $(e.target).is('#action2') ){
			$('#modal').css('display','none');
			$('.overlay').css('display', 'none');
		}
	})
	
	
	
</script>

</body>
</html>
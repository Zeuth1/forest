<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
  <head>
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
     
    </style>
  </head>
  <body>
  
    <jsp:include page="../common/menubar.jsp"/>
    <div class="column-container">
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
    <script>
      $(document).on('click','.figure',function(){
    	  console.log($(this).attr('id'));
    	  location.href="detail.ma?treeNo=" + $(this).attr('id');
      });
      
      $(function(){
    	  var item = '${ item }'
    	  
    	  $.ajax({
    		  url:"search.ma",
    		  type:"POST",
    	      data:JSON.stringify(item),
    	      dataType:"json",
    	      contentType:"application/json",
    		  success:function(data){
    			  var arr = data.treeList;
    			  
    			  if(data.treeList !== null){
      				
      				var arr = data.treeList;
      				
      				  for(var  j = 0; j < 7; j++){  
      					
  	    				for(var i = 1; i < 7; i++){
  	    				    
  		    				$('<div class="figure" id="' + arr[(j * 6) + (i - 1)].treeNo + '"><img src="/tree/' + 
  		    						arr[(j * 6) + (i - 1)].treeAfter + '"/><p>' + arr[(j * 6) + (i -1)].treeTag + '</p></div>').appendTo($('.container' + i ) );                                      
  	    				    
  	    				}
      				  }
      				
      				
      			}
    		  }
    	  })
			
      });
    	 
     
     
      $(document).scroll(function(){
    	 if( $(window).scrollTop() + $(window).height() >= $(document).height() - 1 ){
		     
    	 }
      });
     
    </script>
  </body>
</html>
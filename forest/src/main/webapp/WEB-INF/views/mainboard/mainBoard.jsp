<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
  <head>
  <meta charset="utf-8">
  
    <style>
      .column-container{
        display:flex;
        margin-top:80px;
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
     
       <c:forEach var="item" items="${ treeList }" begin="0" end="6">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    
    <div class="columns container2">
     
       <c:forEach var="item" items="${ treeList }" begin="7" end="13">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    
    <div class="columns container3">
     
       <c:forEach var="item" items="${ treeList }" begin="14" end="20">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    
    <div class="columns container4">
     
       <c:forEach var="item" items="${ treeList }" begin="21" end="27">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    
    <div class="columns container5">
     
       <c:forEach var="item" items="${ treeList }" begin="28" end="34">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    
    <div class="columns container6">
     
       <c:forEach var="item" items="${ treeList }" begin="35" end="41">
         <div class="figure" id="${ item.treeNo }">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
         </div>
  
       </c:forEach>
     
    </div>
    </div>
    <script>
      
    
    
      
      $(document).on('click','.figure',function(){
    	  console.log($(this).attr('id'));
    	  location.href="detail.ma?treeNo=" + $(this).attr('id');
      });
    	 
     $(document).on('click', '.container1', function(){
    	 for(var i = 0; i < $(this).length; i++){
    	 console.log($('.container1').children().length);
    	 }
     })
     
     var itemNum = 0;
     
     var delta = 300;
     var timer = null;
     
      $(document).scroll(function(){
    	 if( $(window).scrollTop() + $(window).height() >= $(document).height() - 1 ){
		     clearTimeout(timer);
		     timer = setTimeout(function(){
    		 var treeArr = new Array();
    		 
		     for(var i = 0; i < $('.container1').children().length; i++){
		    	 treeArr.push($('.container1').children().eq(i).attr("id"));
		     }
		     
		     for(var i = 0; i < $('.container2').children().length; i++){
		    	 treeArr.push($('.container2').children().eq(i).attr("id"));
		     }
		     
		     for(var i = 0; i < $('.container3').children().length; i++){
		    	 treeArr.push($('.container3').children().eq(i).attr("id"));
		     }
		     
		     for(var i = 0; i < $('.container4').children().length; i++){
		    	 treeArr.push($('.container4').children().eq(i).attr("id"));
		     }
		     
		     for(var i = 0; i < $('.container5').children().length; i++){
		    	 treeArr.push($('.container5').children().eq(i).attr("id"));
		     }
		     
		     for(var i = 0; i < $('.container6').children().length; i++){
		    	 treeArr.push($('.container6').children().eq(i).attr("id"));
		     }
		     
			 
			
		     $.ajax({
    			url:"paging.ma",
    			type:"POST",
    			data:JSON.stringify(treeArr),
    			dataType:"json", 
    			contentType:"application/json",
    			success:function(data){
    				console.log(data);
    				itemNum = data.treeList.length;
    				
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
    		 
		     });
		    	 
		     }, delta)
    		 
    	 }
      });
     
    </script>
  </body>
</html>
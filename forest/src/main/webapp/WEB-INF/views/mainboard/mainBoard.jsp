<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
  <head>
    <style>
      .columns{
        width:93%;
        margin-top:80px;															
        column-gap:0px;
        margin-top:80px;
        margin-right:auto;
        margin-left:auto;
      }

      .columns .figure{
        vertical-align:top;
        margin-left:3px;
        margin-right:3px;
        display:inline-block;
        padding:8px;
        border-radius:10px; 
        width:230px;
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
    
    <div class="columns">
     
       <c:forEach var="item" items="${ treeList }">
         <div class="figure">
           <img src="/tree/${ item.treeAfter }"/>
           <p>${ item.treeTag }</p>
           <input type="hidden" value="${ item.treeNo }"/>
         </div>
  
       </c:forEach>
     
    </div>
    <script>
      $(function(){
    	 $('.figure').on('click', function(){
    		 
    		location.href="detail.jsp?src=" + $(this).children().eq(0).attr('src') + "&figcaption=" + $(this).children().eq(1).attr('title');
    	 });
      });
     
      $(document).scroll(function(){
    	 if( $(window).scrollTop() >= ( $(document).height() - $(window).height()-1 ) ){
		     
    		 var treeArr = new Array();
    		 
		     for(var i = 0; i < $('input[type=hidden]').length; i++){
		    	 treeArr.push($('.columns').children().eq(i).children().eq(2).attr("value"));
		     }
		     
		     $.ajax({
    			url:"paging.ma",
    			type:"POST",
    			data:JSON.stringify(treeArr),
    			dataType:"json", 
    			contentType:"application/json",
    			success:function(data){
    				console.log(data.treeList);
    				
    				if(data.treeList !== null){
    				
    				var arr = data.treeList;
    				
    				console.log(arr);
    				
    				console.log(arr[1].treeTag);
    				
    				console.log(arr.length)
    					
    				for(var i = 0; i < arr.length; i++){
    					
	    				$('.columns').append('<div class=' + '"figure"' +'><img src=' + '"/tree/' + arr[i].treeAfter + '"/><p>' + arr[i].treeTag + '</p><input type = ' + '"hidden"' + 'value = "' + arr[i].treeNo + '"/></div>');                                        
	    				
    				}
    				
    				
    			}

    		 }		
    		 
		     });
    	 }
      });
     
    </script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
  <head>
    <style>
      #columns{
        width:93%;
        height:3000px;
        column-width:235px;
        column-gap:0px;
        margin-top:80px;
        margin-right:auto;
        margin-left:auto;
        
      }

      #columns figure{
      
        display: inline-block;
        margin-bottom: 1px;
        margin-top:1px;
        margin-bottom:15px;
        margin-left:1px;
        margin-right:1px;
        padding:7px;
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

        word-break:break-all; 
        -webkit-box-orient:vertical; 
        -webkit-line-clamp:3;
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
    
    <div id="columns">
     <form>
       <c:forEach var="item" items="${ treeList }">
         <figure>
           <img src="/tree/${ item.treeAfter }"/>
           <figcaption title="${ item.treeNo }">${ item.treeTag }</figcaption>
         </figure>
         <input type="hidden" value="${ item.treeNo }"/>
       </c:forEach>
     </form>
     
      <%-- <figure>
        <img src="/tree/apple-2788662_1280.jpg">  
        <figcaption title="${ figcaption1 }">${ figcaption1 }</figcaption>
      </figure> --%>
      
    </div>
    <script>
      $(function(){
    	 $('figure').on('click', function(){
    		 
    		location.href="detail.jsp?src=" + $(this).children().eq(0).attr('src') + "&figcaption=" + $(this).children().eq(1).attr('title');
    	 });
      });
      
    </script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <style>
      #columns{
        width:95%;
        height:3000px;
        column-width:235px;
        column-gap:0px;
        margin-top:80px;
        
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
   



  <c:set var="src1" value="/tree/apple-2788662_1280.jpg" scope="request"/>
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
  <c:set var="figcaption2" value="Rapunzel, clothed in 1820¡¯s period fashion'"/>
  <c:set var="figcaption3" value="Belle, based on 1770¡¯s French court fashion'"/>
  <c:set var="figcaption4" value="Mulan, based on the Ming Dynasty period'"/>
  <c:set var="figcaption5" value="Sleeping Beauty, based on European fashions in 1485'"/>
  <c:set var="figcaption6" value="Pocahontas based on 17th century Powhatan costume'"/>
  <c:set var="figcaption7" value="Snow White, based on 16th century German fashion'"/>
  <c:set var="figcaption8" value="Ariel wearing an evening gown of the 1890¡¯s'"/>
  <c:set var="figcaption9" value="Tiana wearing the <i>robe de style</i> of the 1920¡¯s'"/>
    
    <div id="columns">q
    
      
      <%-- <figure>
        <img src="/tree/apple-2788662_1280.jpg">  
        <figcaption title="${ figcaption1 }">${ figcaption1 }</figcaption>
      </figure>
      
      
      

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
      

      <figure>
        <img src="${ src9 }">  
        <figcaption title="${ figcaption9 }">${ figcaption9 }</figcaption>
      </figure>
       --%>
      

      
      
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
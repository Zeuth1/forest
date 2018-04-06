<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  #MyImage{
     border-radius: 50%;
    width: 200px;
    height: 200px;
    position: relative;
    display: inline-block;
    float:right;
    margin-top:200px;
  }
  .selectmenu{
     margin-right:950px;
  }
  .lockImages{
     width:40px;
     height:40px;
  }
  </style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="#">Logo</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Projects</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
          </div>
        </div>
      </nav>

      <div>
          <div class="carousel-inner" role="listbox">
            <div class="item active">
               <div class="carousel-caption">
                  <p style="font-size:50px">태현 김</p>
                  <p>팔로워:1</p>
                  <p>팔로윙:1</p>
               </div>
                  <img>
                   <div class="carousel-caption">
                     <img src="images/김태현4.jpg" id="MyImage">
              </div>      
            </div>
          </div>
      </div>
        <br>
      <div class="container text-center">    
        <div class="selectmenu">
        <button class="btn btn-default">보드</button>
        <button class="btn btn-default" onclick="location.href='/test/views/fin.jsp'">핀</button>
        <button class="btn btn-default">내 보드</button>
        </div>
        <br>
        <div class="row">
          <div class="col-sm-4" onclick="gomodal();">
            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="보드만들기">
            <p>보드만들기</p>
          </div>
          <div class="col-sm-4"> 
            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="보드만들기">
            <p></p>    
          </div>
        </div>
        <hr>
      <div class="row">
         <div align="center">
            <p style="margin-right:490px"><img class="lockImages" src="images/Lock.jpg"><label>비밀보드!</label></p>
            <label>회원님과 회원님이 초대한 사람들만이 이 보드들을 볼 수있습니다. </label> <label><a>자세히알아보기</a></label>
         </div>
      </div>
      <hr>
      <div class="col-sm-4" onclick="gomodal();">
            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="보드만들기">
            <p>비밀보드 만들기</p>
         </div>
      </div><br>
      
      
      <hr>
      <footer class="container-fluid text-center">
          <p>Footer Text</p>
      </footer>



      
<div class="modal" id="testModal" tabindex="-1" role="dialog">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-body">
            <h1>보드만들기</h1>
            <hr>
            이름:<textarea></textarea>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn" data-dismiss="modal">만들기</button>
            <button type="button" class="btn" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<br><br><br><br><br><br><br><br><br><br>
<script>
   function gomodal(){
      $("#testModal").modal();
   }
</script>
</body>
</html>
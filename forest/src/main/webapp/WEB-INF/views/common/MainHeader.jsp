<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
  <meta charset="utf-8">
  <!-- v13808 -->
  <title>파이널 고객 센터</title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />

<style>

/* 포인터 표시 */
.button, [role="button"] {
  cursor: pointer;
}

/*3개 문의 호버 */
.blocks-item:hover, .blocks-item:focus, .blocks-item:active {
  background-color: rgba(32, 44, 68, 1);
}
/* 호버 되면 나오는 색깔 */
.blocks-item:hover *, .blocks-item:focus *, .blocks-item:active * {
  color: #FFFFFF;
  text-decoration: none;
}
 
 /* a 태그 호버 */
 a:hover, a:active, a:focus {
  text-decoration: underline;
}


a {
  color: rgba(32, 32, 32, 1);
  text-decoration: none;
}
 
@media (min-width: 1024px) {
  body > main {
    min-height: 65vh;
  }
}

/*본문 사이즈 지정*/
.container {
  max-width: 1160px;
  margin: 0 auto;
  padding: 0 5%;
}

@media (min-width: 1160px) {
  .container {
    padding: 0;
    width: 90%;
  }
}

/*자주 묻는 질문 */
.promoted-articles {
  display: flex;
  flex-direction: column; /*가로 정렬*/
  flex-wrap: wrap;
}

@media (min-width: 1024px) {
  .promoted-articles {
    flex-direction: row; /*일단 일렬로 */
  }
}
 

@media (min-width: 1024px) {
  .promoted-articles-item {
    align-self: flex-end;
    flex: 0 0 auto;
    padding-right: 30px;
    width: 30%; /* 3개씩 나오게 */
  }
 
}
 
.promoted-articles-item a {
  border-bottom: 1px solid #ddd;
  color: rgba(32, 32, 32, 1);
  display: block;
  padding: 15px 0;
}
  
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

 
 /*footer 스타일 지정 */
 .footer {
  border-top: 1px solid #ddd;
  margin-top: 60px;
  padding: 30px 0;
  font-size: 13px;
  color: #666;
}


 .footer-inner {
  max-width: 1160px;
  margin: 0 auto;
  padding: 0 5%;
  display: flex;
  justify-content: space-between;
}
 
 

/* 일반 문의 작가문의 독자 문의 인라인으로 */
.blocks-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  list-style: none;
  padding: 0;
}

/* 박스 타입으로 만들기 */
.blocks-item {
  border: 1px solid rgba(32, 44, 68, 1);
  border-radius: 4px;
  box-sizing: border-box;
  color: rgba(32, 44, 68, 1);
  display: flex;
  flex: 1 0 340px;
  flex-direction: column;
  justify-content: center;
  margin: 0 0 30px;
  max-width: 100%;
  text-align: center;
}



/*문의 등록 */
.nav-wrapper a {
  border: 0;
  color: rgba(32, 32, 32, 1);
  font-size: 14px;
  padding: 0 20px 0 0;
  width: auto;
}

.hero-inner h1 {
  color:#fff;
}
 
 
.header {
  max-width: 1160px;
  margin: 0 auto;
  padding: 0 5%;
  position: relative;
  align-items: center;
  display: flex;
  height: 71px;
  justify-content: space-between;
}
 .logo img {
  max-height: 37px;
}
.logo span {
    display: inline-block;
    width: 92px;
    height: 44px;
    vertical-align: top;
    /* postype 로고 이미지 불러오기 */
    background: url('https://logos.textgiraffe.com/logos/logo-name/Forest-designstyle-summer-m.png') no-repeat 0 0;
    background-size: 92px 48px;
}
 
 /* 본문 이미지 */
 .hero {
 background-image: url(//theme.zdassets.com/theme_assets/2124626/1facf930cd167513c71eac3d0d7bc61e2a48b707.png);
  background-position: center;
  background-size: cover;
  height: 300px;
  padding: 0 20px;
  text-align: center;
  width: 100%;
}

/* 본문 이미지 중간으로 오게 */
 .hero-inner {
  position: relative;
  top: 50%;
  transform: translateY(-50%);
  max-width: 610px;
  margin: 0 auto;
}
 
 
 /*본문 간 여백*/ 
 .section {
  margin-bottom: 40px;
}

@media (min-width: 768px) {
  .section {
    margin-bottom: 60px;
  }
}
 
 #searchCondition, #searchValue2{
 height: 40px;
   border: 1px solid #ddd;
   border-radius: 4px;
    box-sizing: border-box; 
 }
 
 #registerHelp{
   height: 60px;
   width: 80px;
   border: 1px solid #ddd;
   border-radius: 4px;
    box-sizing: border-box; 
 }
 
 
  #searchValue1  {
  border: 1px solid #ddd;
  box-sizing: border-box;
  color: #999;
  height: 40px;
  padding-left: 40px;
  padding-right: 20px;
  -webkit-appearance: none;
  width: 60%;
  border-radius: 4px;
}
 
 


</style>

</head>
<body class="">
   <!--  header는 나중에 빼기 -->
  <header class="header">
  <div class="logo">
    <a title="홈" href="#">
      <span title="로고"></span>
    </a>
  </div>
  <div class="nav-wrapper">
    
    <span class="icon-menu"></span>
    <nav class="user-nav" id="user-nav">
      <!---->
      
      
      <a class="submit-a-request" id="registerHelp" href="RegisterHelp.help">문의 등록</a>
    </nav>
  </div>
</header>


  <main role="main">
    <section class="section hero">
  <div class="hero-inner">
    <h1>지금 알아보세요!</h1>
    <form name="search" class="search search-full" action="HelpCenterSearch.help" accept-charset="UTF-8" method="post">
    <select id="searchCondition" name="searchCondition">
    <option value="title">제목</option>
	<option value="content">내용</option>    
    </select>
    
    <input type="text" name="searchContent" id="searchValue1" />
     <input type="submit" id="searchValue2" value="검색하기">
    
    </form>

	

</section>

</body>
</html>
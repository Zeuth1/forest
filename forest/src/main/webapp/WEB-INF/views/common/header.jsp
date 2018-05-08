<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
  <meta charset="utf-8">
  <title> 포레스트 도움 센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

/* p 지정 */
.form-field p {
  color: #535353;
  font-size: 12px;
  margin: 5px 0;
}


textarea {
  border: 1px solid #ddd;
  border-radius: 2px;
  resize: vertical;
  width: 100%;
  outline: none;
  padding: 10px;
}

/*문의 내용 테스트area*/
 .request-form textarea {
  min-height: 120px;
}

 .form-field label {
  display: block;
  font-size: 13px;
  margin-bottom: 5px;
}

.upload-dropzone span {
  color: #535353;
}

/*제출 버튼 */
.button-large, input[type="submit"] {
  background-color: rgba(32, 44, 68, 1);
  border: 0;
  border-radius: 4px;
  color: #FFFFFF;
  font-size: 14px;
  font-weight: 400;
  line-height: 2.72;
  min-width: 110px;
  padding: 0 1.9286em;
}

/*문의등록 폼 라벨 지정*/
 .form-field label {
  display: block;
  font-size: 13px;
  margin-bottom: 5px;
}

.form-field textarea {
  vertical-align: middle;
}


/*문의등록  폼 input 지정*/
.form-field input {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 10px;
  width: 100%;
}

/*최상단 헤더 및 검색 및 도움 센터 가로로 정렬 */ 
 .sub-nav {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin-bottom: 30px;
  min-height: 50px;
  padding-bottom: 15px;
  padding-right: 30px;
}

@media (min-width: 768px) {
  .sub-nav {
    flex-direction: row;
  }
}
  
  /* ol의 숫자 없애기 */
  .breadcrumbs li {
  overflow: hidden; 
}
  
  
  
/* a 태그 기본 지정 */
a {
  color: rgba(32, 32, 32, 1);
  text-decoration: none;
}
 /* a 태그 호버 */
 a:hover, a:active, a:focus {
  text-decoration: underline;
}

/*a 태그 아래의 줄 */

.article-list-item {
  border-bottom: 1px solid #ddd;
  font-size: 16px;
  padding: 15px 0;
}


 /* ul 태그 기본 지정 */ 
 ul {
  list-style: none;
  margin: 0;
  padding: 0;
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
  max-height: 60px; 
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


/* 문의 등록 도움 센터 */
.nav-wrapper a {
  border: 0;
  color: rgba(32, 32, 32, 1);
  font-size: 14px;
  padding: 0 20px 0 0;
  width: auto;
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


/* 검색 부분 지정 */
 .search input[type="search"] {
  border: 1px solid #ddd;
  border-radius: 30px;
  box-sizing: border-box;
  color: #999;
  height: 40px;
  padding-left: 40px;
  padding-right: 20px;
  -webkit-appearance: none;
  width: 100%;
}



/*본문 사이즈 및 여백 지정*/
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


/* 문의 a 태그들 가로로 정렬 */
.section-tree {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  justify-content: space-between;
}

@media (min-width: 768px) {
  .section-tree {
    flex-direction: row;
  }
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
 
   
  #searchValue  {
  border: 1px solid #ddd;
  box-sizing: border-box;
  color: #999;
  height: 40px;
  padding-left: 40px;
  padding-right: 20px;
  -webkit-appearance: none;
  width: 50%;
  border-radius: 4px;
}

</style>

</head>
<body class="">
   
  <header class="header">
  <div class="logo">
    <a title="홈" href="helpCenter.help">
      <span title="로고"></span>
    </a>
  </div>
  <div class="nav-wrapper">
    
    <span class="icon-menu"></span>
    <nav class="user-nav" id="user-nav">
      <!---->
      <a class="submit-a-request" href="RegisterHelp.help">문의 등록</a>
    </nav>
   
  </div>
</header>


  <main role="main">
    <div class="container-divider"></div>
<div class="container">
  <nav class="sub-nav">
    <ol class="breadcrumbs">
  
    <li title="포레스트 도움 센터">
      
        <a href="helpCenter.help">포레스트 도움 센터</a>
      
    </li>
   
</ol> 
 
    <!-- 위의 타입으로 css만 바꿔주면 됨 -->
     <form name="search" class="search" action="HelpCenterSearch.help" accept-charset="UTF-8" method="post">
    <select id="searchCondition" name="searchCondition">
    <option value="title">제목</option>
	<option value="content">내용</option>    
    </select>
    
    <input type="text" name="searchContent" id="searchValue"/>
     <input type="submit" value="검색하기">
    
    </form>
    
    
  </nav>

</body>
</html>
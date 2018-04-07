<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
  <meta charset="utf-8">
  <title> 포스타입 도움 센터</title>

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
  min-width: 190px;
  padding: 0 1.9286em;
  width: 100%;
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
  max-height: 37px;
}
.logo span {
    display: inline-block;
    width: 92px;
    height: 24px;
    vertical-align: top;
    /* postype 로고 이미지 불러오기 */
    background: url('//theme.zdassets.com/theme_assets/2124626/e3e2fe529cc7f018e312ec64ed6ca85a0e2a5a1e.svg') no-repeat 0 0;
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
 


</style>

</head>
<body class="">
   
  <header class="header">
  <div class="logo">
    <a title="홈" href="helpCenter.jsp">
      <span title="로고"></span>
    </a>
  </div>
  <div class="nav-wrapper">
    
    <span class="icon-menu"></span>
    <nav class="user-nav" id="user-nav">
      <!---->
      <a class="submit-a-request" href="RegisterHelp.jsp">문의 등록</a>
    </nav>
   
  </div>
</header>


  <main role="main">
    <div class="container-divider"></div>
<div class="container">
  <nav class="sub-nav">
    <ol class="breadcrumbs">
  
    <li title="포스타입 도움 센터">
      
        <a href="/hc/ko">포스타입 도움 센터</a>
      
    </li>
   
</ol>

    <form role="search" class="search" data-search="" action="HelpCenterSearch.jsp" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" /><input type="search" name="query" id="query" placeholder="검색" aria-label="검색" /></form>
  </nav>

</body>
</html>
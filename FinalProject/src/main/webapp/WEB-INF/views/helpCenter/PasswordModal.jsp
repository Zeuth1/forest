<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head></head>
<body class="not-logged-in">
  <jsp:include page="common/modal.jsp"/>
  
  
<div id="status-bar"></div>
  
<div id="wrapper">
    <noscript>
        <div style="background-color:#F2F4F6;text-align:center;margin-bottom:10px;padding:5px;">
            <p style="color:#ff0000;">웹 브라우저의 JavaScript(자바 스크립트) 설정이 비활성화되어 있습니다.<br>Javascript가 비활성화되어 있으면 사이트 내 일부 기능을 이용하실 수 없습니다.</p>
        </div>
    </noscript>

     
    <div class="signup-form">
   
    <div class="signup-form__logo-box">
    <form id="FAQpwd" method="post" action="InquiryDetail.jsp">
       <h1>비밀글입니다.</h1>
       <p>아래 등록 시 입력하신 비밀번호 입력해 주세요.</p>
           <label>비밀번호</label>
    <input type="text">
    <div class="signup-form__catchphrase">
   
    </div>
    </div>
    <div><a onclick="pwd()" class="signup-form__submit ga-event" data-category="signup_pc_page" data-action="step1" data-label="mail">
    확인</a>
     </form>
    <a href="PersonalInquiryList.jsp" class="signup-form__submit--login">
    목록</a></div> 
 
 <script>
 function pwd(){
	 $("#FAQpwd").submit();
 }
 </script>
 
<script id="capybara-status-check" data-t-code="0ec06063442619c76e42d6ebed9fa6dd" data-m-code="5276059c3a4531f3da239d1ea8771242"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
 <style>
 div{
 padding:7px;
 }
 </style>
 
</head>
<body class="">

<jsp:include page="../common/header.jsp"/>

 
  <div class="form">
   <h1>
    문의 등록
  </h1>
    <form id="new_request" action="PersonalInquiryList.help" class="registerHelp" accept-charset="UTF-8" method="post">
    
  <div class="form-field string required request_anonymous_requester_email">
 
</div>
 
    <div class="form-field string  required  request_custom_fields_114103854754" >
      
    </div>
     
     <!-- 제목은 한글만 가능하게 정규표현식 적용  (ㄱ ㄴㄷㄹ 안됨) /^[가-힣]+$/-->
 
    <div class="form-field string  required  request_subject" >
      <label for="request_subject">제목</label>
      <input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE" maxlength="150" size="150" aria-required="true" aria-describedby="request_subject_hint" />
      
      <p id="request_subject_hint">보내실 문의의 제목을 입력하세요.(<b class="font_12no66">* 한글만 가능</b>)</p>
    </div>

      
      <div class="suggestion-list" data-hc-class="searchbox" data-hc-suggestion-list="true"></div>
    
  
    <div class="form-field text  required  request_description" >
      <label for="request_description">문의 내용</label>
      <textarea name="NOTICE_CONTENT" id="NOTICE_CONTENT aria-required="true" aria-describedby="request_description_hint">
</textarea>
      
      <p id="request_description_hint">요청에 관한 세부 정보를 입력하세요. 내용을 자세히 적어 주시면 지원팀이 빠르게 도움을 드리는 데 효과적입니다.</p>
    </div>

  <div class="form-field string  required  request_subject" >
      <label for="request_password">비밀번호</label>
      <input type="password" name="NOTICE_PWD" id="NOTICE_PWD" maxlength="150" size="150" aria-required="true" aria-describedby="request_subject_hint" />
      
      <p id="request_subject_hint">문의글을 확인할 비밀번호를 입력하세요(<b class="font_12no66">* 3~6자의 영문자, 숫자조합</b>)</p>
    </div>
     

 
  <footer><a onclick="registerCheck()" />제출</a></footer>

    <script>
 
    // 제목 및 비밀번호 정규표현식 처리
    
    function registerCheck(){
     var NOTICE_TITLE= $("#NOTICE_TITLE").val();
     var NOTICE_PWD=$("#NOTICE_PWD").val();
     
     if(NOTICE_TITLE==""){
        alert("제목을 입력해주세요")
        return false;
        
     }else if(!/^[가-힣]+$/.test(NOTICE_TITLE)){
			alert("한글 제목만 가능합니다");
        return false;
     }
      
     if(NOTICE_PWD==""){
        alert("비밀번호를 입력해주세요")
        return false;
     }else if(!/^[a-zA-Z0-9]{3,6}$/.test(NOTICE_PWD)){
    	 alert("숫자와 영문자 조합으로 3~6자리를 사용해야 합니다.");
         return false;
     }
    $("#new_request").submit();
  }
  
 
  </script>
 </form>  

  </div>

  
</div>

  </main>

<!-- footer -->
 
  <jsp:include page="../common/footer.jsp"/>

</body>
</html>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<body class="">

<jsp:include page="../common/MainHeader.jsp"/>

<div class="container">
  <section class="section knowledge-base">
    <section class="categories blocks">
      <ul class="blocks-list">
 
            <li class="blocks-item">
              <a href='GeneralFAQ.help' class="blocks-item-link">
                <h4 class="blocks-item-title">일반 문의</h4>
                <p class="blocks-item-description"></p>
              </a>
            </li>

            <li class="blocks-item">
              <a href='AuthorFAQ.help' class="blocks-item-link">
                <h4 class="blocks-item-title">작가 문의</h4>
                <p class="blocks-item-description"></p>
              </a>
            </li>
  
            <li class="blocks-item">
              <a href='ReaderFAQ.help' class="blocks-item-link">
                <h4 class="blocks-item-title">독자 문의</h4>
                <p class="blocks-item-description"></p>
              </a>
            </li>    
      </ul>
      
    </section>

    
      <section class="articles">
        <h3>자주 묻는 질문</h3>
        <ul class="article-list promoted-articles">
          
            <li class="promoted-articles-item">
            <a href="#">   
                포레스트는 무엇인가요?
              </a>
            </li>
          
            <li class="promoted-articles-item">
             <a href="#">   
                멤버십이 무엇인가요?
              </a>
            </li>
          
            <li class="promoted-articles-item">
             <a href="#">   
                   포스터(PR)이 무엇인가요?
              </a>
            </li>
          
            <li class="promoted-articles-item">
              <a href="#">
                성인 콘텐츠의 경우 반드시 성인물 표시를 해주어야 하나요?
              </a>
            </li>
          
            <li class="promoted-articles-item">
              <a href="#">               
               포레스트의 수수료 정책에 대해서 알려 주세요.
              </a>
            </li>
          
            <li class="promoted-articles-item">
              <a href="/hc/ko/articles/360000133633-%EC%B6%9C%EA%B8%88-%EC%8B%A0%EC%B2%AD-%ED%9B%84-%EC%88%98%EC%9D%B5%EA%B8%88%EC%9D%80-%EC%96%B8%EC%A0%9C-%EB%82%B4-%ED%86%B5%EC%9E%A5%EC%97%90-%EC%9E%85%EA%B8%88%EB%90%98%EB%82%98%EC%9A%94-">
                출금 신청 후 수익금은 언제 내 통장에 입금되나요?
              </a>
            </li>
          
        </ul>
      </section>
    
  </section>
 
</div>

  </main>

  <jsp:include page="../common/footer.jsp"/>

</body>
</html>
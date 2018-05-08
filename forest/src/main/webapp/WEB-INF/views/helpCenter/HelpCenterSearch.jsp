 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>

<style>

@media ( max-width :575.99px) {
	.table-responsive-sm {
		display: block;
		width: 100%;
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
		-ms-overflow-style: -ms-autohiding-scrollbar
	}
	.table-responsive-sm>.table-bordered {
		border: 0
	}
}

/* 테이블 */
.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent
	
}

 .table td, .table th {
	padding: .75rem;
	vertical-align: top;
	border-top: 1px solid #dee2e6
	
}
.table th{
background-color:rgb(0, 0, 0, .075)
}
 
 


h1{
margin-top: 30px;
margin-bottom: 50px;
}

</style>

<body class="">
	<jsp:include page="../common/header.jsp" />   
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
          <h1>검색결과</h1>
		<div class="card">
		
		  <%-- c:if test="${ !empty loginUser }">--%>
   
	<%-- /c:if>
	<c:if test="${ empty loginUser }">
		<c:set var="message" value="로그인이 필요한 서비스 입니다." scope="request"/>
		<jsp:forward page="../common/errorPage.jsp"/>
	</c:if>--%>
		
		
		
		
        <table id="boardArea" class="table d-sm-table text-nowrap">
        <thead>
        <tr>
            <th width="10%">NO</th>
            <th width="35%">제목</th>
            <th width="15%">글쓴이</th>
            <th width="15%">등록일</th>
        </tr>
        </thead>
        <tbody>
        
        	<c:forEach var="Notice" items="${ list }">

             <tr>
            <td width="10%" align="center";>${ Notice.NOTICE_NO }</td>
            <td width="35%" align="center";>${ Notice.NOTICE_TITLE }</td>
            <td width="15%" align="center";>${ Notice.user_id }</td>
            <td width="15%" align="center";>${ Notice.NOTICE_DATE }</td>
        </tr>
        </c:forEach>
                </tbody>
    </table>
    
    <div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
			<!--  아직 미완성 -->
				<c:url var="blistBack" value="">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ blistBack }">[이전]</a> &nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ blistCheck }">${ p }</a>
				</c:if>
			</c:forEach>
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url>
				<a href="${ blistEnd }">&nbsp; [다음]</a>
			</c:if>
		</div>
    
    
    
    <script>
			$(function(){
				$("#boardArea").find("td").mouseenter(function(){
					$(this).parents("tr").css({"background":"orangered", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).parents("tr").css({"background":"white"});
				}).click(function(){
					
					var NOTICE_NO = $(this).parents().children("td").eq(0).text();
					console.log(NOTICE_NO);
					location.href="InquiryDetail.help?NOTICE_NO="+NOTICE_NO;
					 
				});
			});
		</script>
    
    
</div>
            </div>
        </div>
    </div>
</main>
  
 <jsp:include page="../common/footer.jsp"/>
 
</body>
</html>
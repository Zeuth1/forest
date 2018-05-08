<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>


<script type='text/javascript' src="/firstSpring/resources/ckeditor/ckeditor.js"></script>
<style>

#retrunList {
	border-radius: 4px;
	box-sizing: border-box;
	color: #999;
	height: 30px;
	margin-top: 30px;
	padding-left: 80px;
	-webkit-appearance: none;
	width: 25%;
	float: right;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
a{
	border-radius: 4px;
	box-sizing: border-box;
	color: #999;
	height: 30px;
}
</style>
<body class="">

	<c:if test="${! empty notice }">

	</c:if>

	
	<jsp:include page="../common/header.jsp" />

	<main class="main-content slide-left" id="main-content" role="main">
	<article class="post" id="main">
		<header class="post-header">

			<form name="updateDC" id="updateDC" action="updateDetailComplete.help" method="post">
			<c:forEach var="Notice" items="${ list }">

				<div class="container">

					<!--  read only -->
					<div class="post-badges">${ Notice.NOTICE_NO }번글</div>
					
					<!-- read only -->
					<h1 class="post-title" id="NOTICE_TITLE">${ Notice.NOTICE_TITLE }</h1>

					<div class="post-meta btn-toolbar">
						<div class="btn-toolbar media-body">

							<div class="media-body">
							
								<!--  read only -->
								<time class="list-inline-item" align="right">${ Notice.NOTICE_DATE }</time>
							</div>
						</div>
					</div>
					 
				</div>
		</header>


		<div class="container"></div>


	</article>

	<br>
	<br>

	<section class="responses comments" id="responses">
		<div class="container">
			<div class="comments" id="comments">
				<textarea class='ckeditor' name="content" id='editor' rows="20" form="updateDC">
					${ Notice.NOTICE_CONTENT }
					</textarea>

			</div>
		</div>
	</section>
	
	<input type="hidden" name="notice_no" id="NOITCE_NO" value="${Notice.NOTICE_NO}">
	
	 <!--  본문 끝 --> <br>
	<br>
      </c:forEach> 
      	
      	<input type="button" value="수정완료" onclick="myUpdate()" >
      	</form>
      	
      	<script>
      	function myUpdate(){
      		$("#updateDC").submit();
      		
      	}
      	
      	</script>
      	
        
         </main>
	
	 
      	
     <!-- 자체 댓글 기능 
	<section class="responses comments" id="responses">
		<div class="container">

			<div class="comments" id="comments">
				<h3 class="section-title">관리자 답변</h3>

				<form>
					<textarea class="form-control autosize" name="ReplyHelp"
						id="ReplyHelp"></textarea>


					<div class="clearfix">
						<div class="float-right">
							<button class="btn btn-create-comment" onclick="return Reply(${ Notice.NOTICE_NO })">관리자 답변</button>
						</div>
						
						
					</div>
				</form>
			</div>
		</div>
	</section>
	-->
	
	<!-- 자체 댓글 기능 -->
	<!--  div id="replySelectArea">
         <table id="replySelectTable" border="1" align="center"> 
         <tr id="replySelectTable1">
         </tr>
         </table>
      </div>-->
  


	<jsp:include page="../common/footer.jsp" />

</body>
</html>
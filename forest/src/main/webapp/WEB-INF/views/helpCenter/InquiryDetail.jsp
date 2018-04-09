<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<body class="">

	<jsp:include page="../common/header.jsp" />

	<main class="main-content slide-left" id="main-content" role="main">
	<article class="post" id="main">
		<header class="post-header">
			<div class="container">
				 
				<div class="post-badges"></div>
				<h1 class="post-title">문의 할 것이 있습니다.</h1>

				<div class="post-meta btn-toolbar">
					<div class="btn-toolbar media-body">
						 
						<div class="media-body">
								<time class="list-inline-item" align="right">2018.03.08</time>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		
		<div class="container">
		
		
		
		</div>
		
		 
	</article>
 
 <br>
  <br>
 
	<section class="responses comments" id="responses">
		<div class="container">
			<div class="comments" id="comments">
					<textarea class="form-control autosize" name="content" id="mention" rows="20">
 
					테스트 본문
					
					</textarea>
				 
			</div>
		</div>
	</section>
	
	
	
	<br><br>
	
	<section class="responses comments" id="responses">
		<div class="container">
			
			<div class="comments" id="comments">
			<h3 class="section-title">댓글</h3>	
				
				<form class="comment-form" id="comment-form" method="post"
					action="/post/comment" data-disable-ajax>
					<input type="hidden" name="post_id" value="1446512"> 
					<input
						type="hidden" name="session_key" />
					<textarea class="form-control autosize" name="content" id="mention"></textarea>
			 	
					
					<div class="clearfix">
						<div class="checkbox-wrap float-left">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="is-secret" name="is_secret" value="1"> <label
									class="custom-control-label" for="is-secret">비밀 댓글</label>
							</div>
						</div>
						<div class="float-right">
							<button class="btn btn-create-comment">댓글 남기기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	
	
	
	
	</main>
	 


	<jsp:include page="../common/footer.jsp" />

</body>
</html>
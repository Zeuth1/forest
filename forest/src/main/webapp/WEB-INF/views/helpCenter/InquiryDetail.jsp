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

			<c:forEach var="Notice" items="${ list }">

				<div class="container">

					<div class="post-badges">
					${ Notice.NOTICE_NO }번글
					</div>
					<h1 class="post-title">${ Notice.NOTICE_TITLE }</h1>

					<div class="post-meta btn-toolbar">
						<div class="btn-toolbar media-body">

							<div class="media-body">
								<time class="list-inline-item" align="right">${ Notice.NOTICE_DATE }</time>
							</div>
						</div>
					</div>
					
					<!-- 수정 삭제 -->
					<div>
					<p align="right"><a  href="updateDetailSelect.help?NOTICE_NO=${ Notice.NOTICE_NO }">수정</a> &nbsp;
					<a align="right" href="deleteDetail.help?NOTICE_NO=${ Notice.NOTICE_NO }">삭제</a>
					</p>
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
				<textarea class='form-control autosize' name="content" id='editor' rows="20" readonly>
					${ Notice.NOTICE_CONTENT }
					</textarea>

			</div>
		</div>
	</section>
	<script>
	function pwd(){
		 var NOTICE_PWD=$("#NOTICE_PWD").val();
		 var NOTICE_NO=${ Notice.NOTICE_NO };
	 if(NOTICE_PWD==""){
		 alert("암호를 입력해주세요")
		 return false;
	 }
		
		$.ajax({
			url:"comparePassword.help",
			type:"post",
			dataType:"json",
			data:{"NOTICE_PWD": NOTICE_PWD,
				"NOTICE_NO":NOTICE_NO},
			success:function(data){
				if(!data==""){
					alert("암호가 맞습니다. 창을 닫아주세요")
					$("#myClose").show();
				};
			}
			
			});
		return false;
	}
	
	</script>
	</c:forEach>
	 <!--  본문 끝 --> <br>
	<br>
 
      
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

<div id="disqus_thread"></div>
<script>

 
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://http-localhost-8081-firstspring.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                            



	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;">비밀글입니다.</span></b></span>
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			<p align="center">문의 등록 시 입력하신 비밀번호를 입력해 주세요.</p>
			<p align="center">비밀번호<input type="password" name="NOTICE_PWD" id="NOTICE_PWD"> 
			<a onclick="pwd()"class="signup-form__submit ga-event">확인</a>
			</p>
			<p>
				<br />
			</p>
			<div id="myClose"
				style="cursor: pointer; display: none; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
			</div>
		</div>

	</div>
	<!--End Modal--> <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('.modal').show();
                 
        });
        //팝업 Close 기능
          function close_pop(flag) {
                    $('.modal').hide();
                    
               };
                
    </script> <!--  댓글 표시 영역 -->
	 


	<script>
	function Reply(notice_no){
		var ReplyHelp= $("#ReplyHelp").val();
		
		$.ajax({
			url:"Reply.help",
			type:"post",
			dataType:"json",
			data:{ReplyHelp: ReplyHelp,
				notice_no: notice_no},
			
		     success:function(data){     
		    	 	console.log(data);
	              	var $replySelectTable = $("#replySelectTable").css("width","90%");
	              		$replySelectTable.html('');
	              		var $tr1 = $("<tr>")
	              		var $th1= $("<td>").text("아이디").css('float','center');
	              		var $th2= $("<td>").text("내용").css('float','center');
	               
	              		// table에 tr 붙이고 tr에 th붙임
	              		$replySelectTable.append($tr1).append($th1).append($th2)
	              		for(var key in data){
	        
	              		var $tr = $("<tr>").css("align","center")
	  
	              		var $useridTd = $("<td>").text(data[key].user_id).css("width","100px");
	              		var $contentTd= $("<td>").text(data[key].comment_content).css("width", "400px");
	              		
	              		// tr에 td 붙임
	              		$tr.append($useridTd);
	              		$tr.append($contentTd);
	              		$replySelectTable.append($tr).addClass("serviceTable inquiry_list");
	              		}
	               },
	               error:function(msg){
	                  alert(msg);
	               }
			 
			 
			
		});
		return false;
	}
 
	 
	 </script> 
	 
	 <a href="InquiryList.help" id="retrunList">목록으로 돌아가기</a> </main>



	<jsp:include page="../common/footer.jsp" />

</body>
</html>
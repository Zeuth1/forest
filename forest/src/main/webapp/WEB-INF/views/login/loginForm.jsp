<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<style>
	@media (min-width: 768px) {
    .omb_row-sm-offset-3 div:first-child[class*="col-"] {
        margin-left: 25%;
    }
}

.omb_login .omb_authTitle {
    text-align: center;
	line-height: 300%;
}

.omb_login {
	margin-top:100px;
}
	
.omb_login .omb_socialButtons a {
	color: white; // In yourUse @body-bg 
	opacity:0.9;
}
.omb_login .omb_socialButtons a:hover {
    color: white;
	opacity:1;    	
}
.omb_login .omb_socialButtons .omb_btn-naver {
	background: #7CFC00;
	width:550px;
	margin-left:auto;
	margin-right:auto;
}



.omb_login .omb_loginOr {
	position: relative;
	font-size: 1.5em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}
.omb_login .omb_loginOr .omb_hrOr {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
.omb_login .omb_loginOr .omb_spanOr {
	display: block;
	position: absolute;
	left: 50%;
	top: -0.6em;
	margin-left: -1.5em;
	background-color: white;
	width: 3em;
	text-align: center;
}			

.omb_login .omb_loginForm .input-group.i {
	width: 2em;
}


	
/* @media (min-width: 768px) {
    .omb_login .omb_forgotPwd {
        text-align: right;
		/* margin-top:10px; */
		position:right;
 	}		
} */

.container {
	margin-top:auto;
	margin-right:auto;
	margin-left:auto;
}
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="container">
    

    <div class="omb_login">
    	<h3 class="omb_authTitle">로그인</h3>

		<div class="row omb_row-sm-offset-3 omb_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="omb_hrOr">
				<span class="omb_spanOr"></span>
			</div>
		</div>

		<div class="row omb_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">	
			    <form class="omb_loginForm" action="${contextPath}/login.me" autocomplete="off" method="post">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<input type="text" class="form-control" name="username" placeholder="아이디 입력">
					</div>
					<span class="help-block"></span>
					<br>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input  type="password" class="form-control" name="password" placeholder="비밀번호 입력">
					</div>
                    <!-- <span class="help-block">Password error</span> -->
                    <br>
					<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='${contextPath}/insert.me'">회원가입</button>
					<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
					<button class="btn btn-lg btn-primary btn-block" type="submit">아이디/비밀번호 찾기</button>
				</form>
			</div>
    	</div>
    	
    	<div class="row omb_row-sm-offset-3 omb_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="omb_hrOr">
				<span class="omb_spanOr">or</span>
			</div>
		</div>
    	
    	<div class="row omb_row-sm-offset-3 omb_socialButtons">
    	    <div class="col-xs-4 col-sm-2">
		        <a href="#" class="btn btn-lg btn-block omb_btn-naver">
			        <i class="fa fa-naver visible-xs"></i>
			        <span class="hidden-xs">Naver</span>
		        </a>
	        </div>
        		
		</div>
	</div>
        </div>
	<script>
		function insertMember(){
			location.href="";
		}
	</script>
</body>
</html>
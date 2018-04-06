<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/patronManagement.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<br><br><br>
	
	
	
	<div class="container">
		<h1 class="management-brand">결제정보 관리</h1>
		<UL class="brand-inline">
			<li>내 후원자 조회</li>
			<li class="li2">내가 후원한 사람 조회</li>
			
		</UL>
	</div>
	
	<div class="container2">
		
		<div class="tab">
			<img src="<%=request.getContextPath()%>/image/patronManagement/profile.jpg">
			<div class="patron-name" nowrap>송재상</div>
			<div class="patron-content">150000(월)후원중입니다.</div>
			
			<buttoN class="out">해지하기</buttoN>
			
		</div>
		
		<div class="tab">
			<img src="<%=request.getContextPath()%>/image/patronManagement/profile.jpg">
			<div class="patron-name" nowrap>송재상</div>
			<div class="patron-content">150000(월)후원중입니다.</div>
			
			<buttoN class="out">해지하기</buttoN>
			
		</div>
		<div class="tab">
			<img src="<%=request.getContextPath()%>/image/patronManagement/profile.jpg">
			<div class="patron-name" nowrap>송재상</div>
			<div class="patron-content">150000(월)후원중입니다.</div>
			
			<buttoN class="out">해지하기</buttoN>
			
		</div>
	
		
	
	
	</div>


</body>
</html>
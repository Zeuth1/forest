<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $.noConflict();
    $( "#datepicker" ).datepicker();
    $("#datepicker2").datepicker();
  } );
  </script>
<title>Forest-MyPage</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myPage.css">
</head>
<body>
		 <jsp:include page="../common/menubar.jsp"/>

<div class="total-wrap">
	<div class="left-wrap">
			<p>계정기본정보</p>
			<p>프로필</p>
			<p>후원 내역 조회</p>
		
		
	</div>
	<div class="right-wrap">
		
			<h1>계정 기본정보</h1>
			<p>이메일주소</p>
			<input type="email" value="${loginUser.mEmail }" class="mEmail" name="mId">
			<p>비밀번호</p>
			<button class="pwd-change-btn" id="change-pwd" onclick="changePwd();">비밀번호 변경</button>
			<p>성별</p>
	 	<div class="gender-wrap">
	 	<c:choose>
	 		<c:when test="${loginUser.mGender=='M' }">
			<div class="checks">
                      <input type="radio" id="ex_rd" name="mGender" checked="checked"> 
                      <label for="ex_rd">남성</label> 
                       <input type="radio" id="ex_rd2" name="mGender"> 
                      <label for="ex_rd2">여성</label> 
            </div>
            </c:when>
            <c:otherwise>
            			 <input type="radio" id="ex_rd" name="mGender"> 
                      <label for="ex_rd">남성</label> 
                       <input type="radio" id="ex_rd2" name="mGender" checked="checked"> 
                      <label for="ex_rd2">여성</label> 
            
            </c:otherwise>
         </c:choose>   
		</div>
		<p>검색기록</p>
		<button class="history" onclick="delete-history()">최근 검색 기록 지우기</button>
		
		 <b class="text">추천 검색어에서 최근 검색한 기록을 제거하세요.</b>	
		<br><br><br>
		
		계정
		<br>
		
		<button class="succession-btn" onclick="succession();">계정 비활성화</button>
		<h1>프로필</h1>
		 
		사진
		<br>
		<img src="<%=request.getContextPath()%>/resources/images/basic_profile.png" style="border-radius:50%; width:60px; margin-top:5px; position:absolute;">
		<button class="change-pic" onclick="change-pic">사진 변경</button>
		<br><br>
		사용자이름
		<br> 
		<input type="text" value="${loginUser.mName}" class="mName" name="mName">
		<br><br>
		자기소개
		<br>
		<textarea class="introduce" name="introduce"></textarea>
		<br><br>주소/작업장<br>
		<input type="text" class="location">
		<h1>후원 정보조회</h1>
		<div class="giver-wrap">
		<button id="giveMoney" class="giveMoney" onclick="giveMoney();">내가 참여한 후원</button><button id="takeMoney" class="takeMoney" onclick="takeMoney();">내가 받은 후원</button>
		<hr>
		</div>	
		
		
		<div class="look-up-wrap">
			<div class="division-wrap">
				후원구분  
				<select>
					<option selected="selected">전체보기</option>
					<option>일시후원</option>
					<option>정기결제</option>
				</select>
				※ 최근 2년간의 정보가 조회 가능합니다.
			</div>
			<div class="term-set-wrap">
				기간설정 <button>1개월</button><button>3개월</button><button>6개월</button><button>1년</button><button>2년</button>
				<input type="text" id="datepicker" style="margin-left:10px;" class="datepicker">~<input type="text" id="datepicker2" class="datepicker">
				<br>
			
			</div>		
				<table class="table-wrap">
					<thead>
					 <tr>
						<th class="first">후원월</th>
						<th>구분</th>
						<th>결제방법</th>
						<th>후원일자</th>
						<th>후원금액</th>
					 </tr>
					</thead>
			<c:choose>
				<c:when test="${empty donate.donateNo }">
					<tbody>
						<tr>
						
							<td  colspan="5"style="text-align:center; padding: 15px; font-weight:200; font-size:14px; ">
						납부완료된 후원 내역이 없습니다.
							<td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<!--이부분 작성  -->
				</c:otherwise>	
					
			</c:choose>
					
				</table>
		</div>
		
		
	</div>
</div>

	<script>
		function giveMoney(){
			
			$("#giveMoney").css({"background":"#3399ff","color":"white"});
			$("#takeMoney").css({"background":"white","color":"black"});
			
		}
		
		function takeMoney(){
			
			$("#takeMoney").css({"background":"#3399ff","color":"white"});
			$("#giveMoney").css({"background":"white","color":"black"});
			
		}
	
	
	</script>


<div style="width:100%; height:5%;  position:fixed; background:yellow; margin-top:800px;"></div>	
</body>
</html>
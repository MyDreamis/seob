<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
  <head>
    <title>Join Travel Story</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/home.css">
	<link rel="stylesheet" href="../../resources/css/login.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&display=swap" rel="stylesheet">
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/popper.min.js"></script>
	<script src="../../resources/js/jquery.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../../resources/js/postcode.js"></script>
	<script src="../../resources/js/member.js"></script>
	
  </head>

  <body>
        <main id="main" class="col-md-9 float-center col pl-md-5 pt-3 main"
        style="margin-left:auto; margin-right:auto; margin-top:100px; width:600px; min-width:600px;">
        <a href="http://localhost:8080/">
        <img src="../../resources/img/logo.png" width="auto" height="auto" alt="로고" align="right" style="padding-bottom:40px;"/>
        </a>
          <div class="page-header mt-3">
              <h1>회원가입</h1>
          </div>
          <p>여행기록은 Travel Stroy</p>
          <hr>
          <form class="pt-3 md-3" method="post" action="member_join_ok" onsubmit="return check();">
            <div class="form-group">
              <label for="userID">아이디</label>
              <div>
	              <input type="text" id="id" name="id" class="form-control" placeholder="아이디 (6-12자 이내, 영문,숫자 사용가능)" maxLength="20" required style="width:80%; display:inline;">
	              <button class="btn btn-primary" type="button" onclick="idCheck();" style="float:right; width:17%; padding-left:6px;">CHECK!</button>
	              <span id="check"></span>
              </div>
            </div>
            
            <div class="form-group">
              <label for="Userpwd">비밀번호</label>
              <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호 (8자 이상, 문자/숫자/기호 사용 가능)">
            </div>
            
            <div class="form-group">
              <label for="Userpwd2">비밀번호 확인</label>
              <input type="password" id="pwd2"  class="form-control" placeholder="위와 같은 비밀번호를 다시 입력해주세요.">
            </div>
            
             <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요." style="width:405px;">
	           	<nav style="float:right; position:relative; bottom:46.5px;">
					<input id="male" type="radio" name="gender" value="1" checked/><label class="male" for="male">남자</label>
					<input id="female" type="radio" name="gender" value="2" /><label class="female" for="female">여자</label>
				</nav>
            </div>
            
            
			<div>
	            <label for="yy" class="form-label">생년월일</label>
	            <br>
	            <select class="custom-select" style="width:180px;"  name ="year">
						<option value="" selected>YY</option>
						<c:forEach var="y" begin="1940" end="2021" step="1">
							<option value="${y}">${y}</option>
						</c:forEach>
					</select>
					&nbsp;&nbsp;
					<select class="custom-select" style="width:160px;" name ="month">
						<option value="" selected>MM</option>
						<c:forEach var="m" begin="1" end="12" step="1">
							<option value="${m}">${m}</option>
						</c:forEach>
					</select>
					&nbsp;&nbsp;
					<select class="custom-select" style="width:160px; position:absolute; float:right;" name ="day">
						<option value="" selected>DD</option>
						<c:forEach var="d" begin="1" end="31" step="1">
							<option value="${d}">${d}</option>
						</c:forEach>
					</select>
            </div>
            <br>
            
            <div class="form-group">
            	<label for="phone1">연락처</label>
            	<div>
	            	<input type="text" class="form-control" style="width:150px; display:inline-block;" id="phone01" name="phone01"maxLength="3" value="010"/>&nbsp;&nbsp;
	            	<input type="text" class="form-control" style="width:175px; position:relative; display:inline-block;" id="phone02" name="phone02" maxLength="4"/>&nbsp;&nbsp;
	            	<input type="text" class="form-control" style="width:175px; float:right;" id="phone03" name="phone03" maxLength="4"/>
            	</div>
            </div>
            
		    <div class="form-group">
	            <label for="addr">주소</label><br>
				<input style="width:80%; display:inline;" class="form-control" type="text" id="sample6_postcode" name="zip" placeholder="우편번호">
				<input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="주소검색" style="float:right; width:17%;">
                <input class="form-control" style="margin-top:5px;" type="text" id="sample6_address" id="sample6_address" name="addr"placeholder="주소">
				<input class="form-control" style="margin-top:5px;" type="text" id="sample6_detailAddress" name="addr1" placeholder="상세주소">
				<input class="form-control" style="margin-top:5px;" type="text" id="sample6_extraAddress" name="addr2" placeholder="참고항목">
			</div>
 


            <div class="form-group">
              <label for="email">이메일</label>
              <div>
              	<input class="form-control" style="width:170px; display:inline-block;" type="text" name="mail_id" id="email1" />&nbsp;&nbsp;@&nbsp;&nbsp;
              	<input class="form-control" style="width:200px; display:inline-block;" type="text" name="mail_domain" id="email2" disabled/>
				<select class="custom-select" id="selectEmail" name="mail_domain" style="width:110px; float:right;">
					<option value="none" selected>선택</option>
					<option value="naver">naver.com</option>
					<option value="daum">daum.net</option>
					<option value="gmail">gmail.com</option>
					<option value="self">직접입력</option>
				</select>
              </div>
            </div>
            
            <div class="form-group">
            	<label>프로필사진</label>
            	<div class="filebox">
	            	<div>
	            		<input name="upload-name" id="upload-name" class="form-control" readonly style="width:80%; display:inline;"/>
	            		<label for="file" style="float:right; width:17%;">파일첨부</label>
	            		<input type="file" id="file" accept="image/jpeg, image/jpg, image/png" multiple/>
	            	</div>
            	</div>
            </div>
            
            <br>
            <div class="text-center">
            <input type="submit" class="btn btn-primary" value="SIGN UP" style="width:200px;"/>
            </div>
            <br>
          </form>
		  <br><hr><br>
          <footer class="text-center">
            <p>Copyright ⓒ 2021 <b>seob__b</b> All Rights Reserved.</p>
          </footer>
        </main>
    
    <script>
    <!-- 이메일 select -->
	$('#selectEmail').change(function(){
		$('#selectEmail option:selected').each(function(){
			if($(this).val() == 'self'){
				$('#email2').val('');
				$('#email2').prop("disabled",false);
			}else if($(this).val() == 'none'){
				$('#email2').val('');
				$('#email2').prop("disabled",true);
			}
			else{
				$('#email2').val($(this).text());
				$('#email2').prop("disable",true);
			}
		});
	});
    	
	<!-- 파일 첨부 -->
	$(document).ready(function(){
		var fileTarget = $('#file');
		fileTarget.on('change', function(){
			var cur = $(".filebox input[type='file']").val();
			$("#upload-name").val(cur);
			
		});
	});
    	
    	
    	
    </script>
  </body>
</html>

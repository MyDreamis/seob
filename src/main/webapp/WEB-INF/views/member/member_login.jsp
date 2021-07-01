<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Story</title>
<link rel="stylesheet" href="../../resources/css/home.css">
<link rel="stylesheet" href="../../resources/css/login.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&display=swap" rel="stylesheet">
<script src="../../resources/js/jquery.js"></script>

<script>
 function check(){
	 if($.trim($("#id").val()) == ""){
		 alert("아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#pwd").val())==""){
		 alert("비번을 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>

<header>
 <div class="c_header">
 <a class="title" href="http://localhost:8088/">Travel Story</a>
 </div>
  <div class="header_menu" >
    <a href="member_story" class="menu-item">Story</a>
    <a href="community_list" class="menu-item">Community</a>
    <a href="member_join" class="menu-item">Join</a>
  </div>
</header>
<div class="login_wrap">
 
<form method="post" action="member_login_ok" onsubmit="return check();">
 <table class="login">
  <tr>
   <th>아이디</th>
   <td><input type="text" name="id" id="id" size="25" tabindex="1" placeholder="아이디"></td>
  </tr>
  <tr>
   <th>비밀번호</th>
    <td><input type="password" name="pwd" id="pwd" size="25" tabindex="2" placeholder="비밀번호"></td>
  </tr>
 </table>
 <div class="login_menu">
  <input type="submit" value="로그인">
  <input type="button" value="회원가입" onclick="location='member_join';">
 </div>
</form>
</div>
</body>
</html>
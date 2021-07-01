/**
 * member.js
 */

function idCheck(){
	$("#check").hide();
	$id=$.trim($("#id").val());
	if($id.length < 4){
		$newtext='<font color="red" size="3"><b>아이디는 4자 이상적어야 합니다.</b></font>';
		$("#check").text('');
		$("#check").show();
		$("#check").append($newtext);
		$("#id").val('').focus();
		return false;
	};
	if($id.length > 12){
		$newtext='<font color="red" size="3"><b>아이디는 12자 미만이어야 합니다.</b></font>';
		$("#check").text('');
		$("#check").show();
		$("#check").append($newtext);
		$("#id").val("").focus();
		return false;
	};
	$.ajax({
		type:"POST", //데이터를 서버로 보내는 방법
		url:"member_idCheck",//아작스 서버 주소 파일명
		data:{"id":$id},//좌측 id 파라미터 이름에 우측 $id변수값을 저장
		datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
		success:function (data){
		
			if(data==1){
				$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
				$("#check").text("");
				$("#check").show();
				$("#check").append($newtext);
				$("#id").val("").focus();
				return false;
			}else{
				$newtext='<font color="blue" size="3"><b>사용 가능한 아이디입니다.</b></font>';
				$("#check").text("");
				$("#check").show();
				$("#check").append($newtext);
				$("#pwd").focus();
			}
		},
		error:function(){
			alert("data error");
		}
	});
}
function check(){
	$pwd=$.trim($("#pwd").val());
	$pwd2=$.trim($("#pwd2").val());
	
	if($.trim($("#pwd").val())==""){
		alert("비번을 입력하세요");
		$("#pwd").val("").focus();
		return false;
	}
	if($.trim($("#pwd2").val())==""){
		alert("비번확인을 입력하세요");
		$("#pww2").val("").focus();
		return false;
	}
	if($pwd != $pwd2){
		alert("입력하신 비번이 다릅니다!")
		$("#pwd").val("").focus();
		return false;
	}
		if($.trim($("#name").val())==""){
		alert("이름을 입력하세요");
		$("#name").val("").focus();
		return false;
	}
		if($.trim($("#phone01").val())==""){
		alert("번호를 입력하세요");
		$("#phone01").val("").focus();
		return false;
	}
		if($.trim($("#phone02").val())==""){
		alert("가운데 번호를 입력하세요");
		$("#phone02").val("").focus();
		return false;
	}
		if($.trim($("#phone03").val())==""){
		alert("끝 번호를 입력하세요");
		$("#phone03").val("").focus();
		return false;
	}
		if($.trim($("#email1").val())==""){
		alert("비번확인을 입력하세요");
		$("#pww2").val("").focus();
		return false;
	}
		if($.trim($("#email2").val())==""){
		alert("비번확인을 입력하세요");
		$("#pww2").val("").focus();
		return false;
	}

}

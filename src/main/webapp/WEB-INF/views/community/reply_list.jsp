<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="../resources//js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../resources/css/reply.css">
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 배열이 비어있지 않으면 참을 출력함. (다시말해서 배열에 값들이 있으면 댓글 리스트를 출력한다.) -->
 
<c:if test = "${!empty list}">

<c:forEach var = "row" items = "${list}">
 <div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
 <div class="commentInfo">
    작성자 : ${row.r_id}
 <c:if test = "${row.r_id == id}">
</c:if>
</div>
 <div class="commentContent"> 
 <p> 내용 : ${row.r_cont} </p>
<button type="button" id="modal_open_btn">댓글 수정</button>
<button type = "button" class="" id = "btn_reply_Delete" style="border:none;">댓글 삭제</button>
 </div>
 </div>



<!-- 폼태그 안에 위쪽에 있는 자바스크립트 구문에 필요한 값들을 노출시키지 않게 하기 위해 hidden타입으로 값들을 전달한다. -->    
<div id="modal">
 <div class="modalBox">
<form method = "POST" id = "form1">
 <table>
 <tr>
<th><input type="hidden" id = "r_no" name = "r_no" value = "${row.r_no}"></th>
</tr>
<tr>
<th>아이디</th>
<td><input readonly id = "r_id" name = "r_id" value = "${row.r_id}"></td>
</tr>
<tr>
<th><input type="hidden" id = "c_no" name = "c_no" value = "${row.c_no}"></th>
</tr>
<tr>
<th>내용</th>
<td><input type="text" id="r_cont" name="r_cont" value="${row.r_cont}"></td>
</tr>
<tr>
<th><button type="button" class="btn btn-primary" id="modal_btn">수정</button>
<button type="button" class="btn btn-primary" id="modal_close_btn">취소</button></th>
</tr>
  </table>
</form>
 </div>
 <div class="modal_layer"></div>
</div>
 
 
<!-- 본인일 경우에만 댓글 수정버튼과 댓글 삭제 버튼이 출력되도록 설정함 -->
 
<div>
 

</div>
</c:forEach>

</c:if>
<script>
/* document.getElementById("modal_open_btn").onclick = function(){
	document.getElementById("modal").style.display="block";
}
document.getElementById("modal_close_btn").onclick = function(){
	document.getElementById("modal").style.display="none";
} */

    $("#modal_open_btn").click(function(){
        $("#modal").attr("style", "display:block");
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").attr("style", "display:none");
    });      

$(function(){
 
    //댓글 수정 버튼
    $("#btn_reply_Update").click(function(){
    	
     $.ajax({
    	type:"POST",
    	url:"reply_update",
    	data: insertData,
    	success:function(data){
    		alert("댓글이 수정되었습니다");
    		$("#r_cont").val("");
    		listReply2();
    	 }
        });
       
    });
});
    
    //댓글 삭제 버튼
    $("#btn_reply_Delete").click(function(){
        
        if(confirm("삭제 하시겠습니까?")){
        
        //댓글 삭제를 하기위해 댓글 번호, 글 번호, 댓글 내용, 그리고 게시글 세부 페이지로 포워딩 하기 위해 페이지 관련 값들을 변수에 저장한다.
            var r_no = $("#r_no").val();
            var c_no = $("#c_no").val();
            var r_cont = $("#r_cont").text();
            
            
            //url로 삭제에 필요한 변수들을 보낸다.
            document.form1.action="reply_delete?r_no="+r_no+"&c_no="+c_no;
            
            document.form1.submit();
            
            alert("댓글이 삭제되었습니다.")
            
        }
    });

</script>
</body>
</html>
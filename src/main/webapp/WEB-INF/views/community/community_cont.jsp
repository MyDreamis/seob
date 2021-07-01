<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/header.jsp" %>


          <div class="page-header mt-3">
              <h2>공지사항</h2>
          </div>
          <p class="lead">공지사항 보기</p>
          <p class="login_id">${id}님 환영합니다</p>
          <hr>
          <form class="pt-3 md-3">
             <table class="form-group">
      		  <tr>
      		   <th>작성자</th>
      		   <td>${cm.c_id }</td>
      		  </tr>
              <tr>
              <th>제목</th>
              <td>${cm.c_title }</td>
              </tr>
             <tr>
              <th>내용</th>
              <td>${c_cont }</td>
             </tr>
             <c:if test="${!empty cm.c_file}">
              <tr>
               <th></th><td><img src="/resources/upload${cm.c_file }" style="width:600px; height:auto;" /></td> 
              </tr>
             </c:if>
             <tr>
              <th>조회수</th>
              <td>${cm.c_hit}</td>
             </tr>
            </table>
            <c:if test="${cm.c_id == id}">
            <input type="button" value="수정" class="btn btn-primary" onclick="location='community_cont?c_no=${cm.c_no}&page=${page}&state=edit';"/>
            <input type="button" value="삭제" class="btn btn-primary" onclick="if(confirm('정말로 삭제하겠습니까?')==true){location='community_del?c_no=${cm.c_no}&page=${page}';}else{return;}"/>
            </c:if>
            <input type="button" value="목록" class="btn btn-primary" onclick="location='community_list?page=${page}';"/>
          </form>
          	<br>

    <c:if test="${id != null}">
        <label for="content">comment</label>
        <form name="insertForm">
        	<div class="input-group">
        	   <input type="hidden" id="r_no" name="r_no" value="${r_no}">
        	   <input type="hidden" id="c_no" name="c_no" value="${cm.c_no}">
      		   <input type="hidden" id = "r_id" name="r_id" value="${id}">
    		   <input type="text"  class="form-control" id = "r_cont" name ="r_cont" placeholder="내용을 입력해주세요">
                <span class="input-group-btn">
                <button type = "button" id = "btnReply" class="btn btn-primary">댓글쓰기</button>
               </span>
             </div>
        </form>
	</c:if>
    
        <div id = "listReply"></div>
    


    
     <script>
   	$(document).ready(function(){
   	    listReply();
   	 	listReply2();
   	});
 
    //댓글쓰기 버튼 (버튼을 눌러서 id값이 넘어와서 실행되는 자바스크립트 구문)

        
    $("#btnReply").click(function(){
    var insertData= $("[name=insertForm]").serialize(); 
   	replyInsert(insertData);
    });
    
  function replyInsert(insertData){
	  
    $.ajax({
        type: "POST", //데이터를 보낼 방식
        url: "reply_write", //데이터를 보낼 url
        data: insertData, //보낼 데이터
    
        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
            alert("댓글이 등록되었습니다.");
        	$("#r_cont").val("");
            listReply2();
        		
                }
            });
	}
 
    
//댓글 목록을 출력하는 함수
    function listReply(){
        $.ajax({
            type: "get",    //get방식으로 자료를 전달
            url: "reply_list?c_no=${cm.c_no}",    //컨트롤러에 있는 list.do로 맵핑되고 게시글 번호도 같이 보낸다.
            success: function(result){    //자료를 보내는것이 성공했을때 출력되는 메시지
                
                //댓글목록을 실행한 결과를 가져온다.
            $("#listReply").html(result);
                }
            });
    }
 
 
 
function listReply2(){
    $.ajax({
        type: "get",
        contentType: "application/json",
        url: "reply_list_json?c_no=${cm.c_no}",
        success: function(result){
            console.log(result);
            var output="<table>";
            for(var i in result){
                output += "<tr><td>"+result[i].name;
                date = changeDate(result[i].regdate);
                output += "("+date+")";
                output += "<br>"+repl+"</td></tr>";
            }
                output+="</table>";
                $("#listReply").html(output);
        }
    });
}


 
</script>

<%@ include file="../community/reply_list.jsp" %>
<jsp:include page="../include/footer.jsp"/>
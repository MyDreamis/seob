<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/header.jsp" %>
		<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
          <div class="page-header mt-3">
              <h2 style="margin-top:70px">커뮤니티</h2>
              <p>자유롭게 물어보자</p>
          </div>
          
          
          <form method="post" enctype="multipart/form-data" class="form-group" action="community_write_ok" onsubmit="return check();">
          
          	 <%-- 책갈피 기능때문에 페이지번호를 히든으로 전달--%>
     		
     		
             <table class="table_group">
              <tr>
               <th>아이디</th> 
              </tr>
              <tr>
               <th><input readonly name="c_id" class="id" value="${id}"></th>
              </tr>
              <tr>
              <th>제목</th>
              </tr>
              <tr>
              <th><input type="text" name="c_title" id="c_title" class="form-control form-group" style="width:700px;" placeholder="제목을 입력하세요."></th>
			 </tr>        
             <tr>
              <th>내용</th>
             </tr>
             <tr>
              <th><textarea class="form-control form-group" name="c_cont" id="c_cont" style="width:700px; height:300px;" placeholder="내용을 입력하세요."></textarea></th>
             </tr>
             <tr>
             <th><input type="file" name="c_file" id="c_file" style="margin-bottom:20px;"></th>
             </tr>
             <tr>
              <th>
            <input type="submit" value="글쓰기" class="btn btn-primary" style="float:left; margin-right:5px;"/>
            <input type="reset" value="취소" class="btn btn-primary" style="float:left; margin-right:5px;" onclick="$('#c_title').focus();"/>
            <input type="button" value="목록" class="btn btn-primary" onclick="location='community_list';"/>
             <th>
            </tr>
            </table>
          </form>
		<script>
		 function check(){
			if($.trim($("#c_title").val()) ==""){
				  alert("제목을 입력하세요");
				 $("#c_title").val("").focus();
				 return false;
			 }
			if($.trim($("#c_cont").val())== ""){
				alert("내용을 입력하세요");
				$("#c_cont").val("").focus();
				return false;
			}
		 }
		</script>
<jsp:include page="../include/footer.jsp"/>
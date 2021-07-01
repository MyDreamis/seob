<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
		<style>
			.id{
			 border:none;
			}
		</style>
          <div class="mypage-title">
              <h2>MyStory</h2>
          </div>
          <hr/>
			<form method="post" action="member_mystory_write_ok" enctype="multipart/form-data" onsubmit="return check();">
			 <div>
			 	<table>
			 	<tr>
			 	 <th>아이디 : <input readonly type="text" name="c_id" class="id" value="${id}"></th>
			 	</tr>
			 	<tr>
			 	</table>
			 </div>
			
		
			
			</form>
</body>
</html>
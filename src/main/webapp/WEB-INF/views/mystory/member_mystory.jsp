<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>

          <div class="mypage-title">
              <h2>MyStory</h2>
          </div>
          <p>나의 이야기</p>
          <hr>
             <table class="form-group">
              <tr>
              <td></td>
              </tr>
              <tr>
              <th>
              <input class="btn btn-primary" type="button" value="작성하기" onclick="location='member_mystory_write';"/>
              </th>
              </tr>
            </table>
			<div>
			<hr/>
			 <p>내가 작성한 게시글</p>
			
			 <c:if test="${!empty list}">
						<c:forEach var="c" items="${list}">
						<tr>
							<th scope="row" style="text-align: center;">${c.c_no}</th>
							<td><a href="community_cont?c_no=${c.c_no}&page=${page}&state=cont" style="color: #000000;"><c:out value="${c.c_title}"/></a></td>
							<td style="text-align: center;">${c.c_hit}</td>
							<td style="text-align: center;">${fn:substring(c.c_date,0,10)}</td>
						</tr>
						</c:forEach>
						</c:if>
					
						<c:if test="${empty list}">
						  <tr>
						   <th colspan="4">작성한 게시글이 없습니다.</th>
						  </tr>
					</c:if>
			
			</div>



<jsp:include page="../include/footer.jsp"/>
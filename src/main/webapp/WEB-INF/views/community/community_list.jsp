<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="../../resources/css/community.css">
			
		
			<form method="get" action="community_list">
				<div class="community_title">
					<h3>커뮤니티</h3>
				</div>
				<p class="lead">자유롭게 물어보자</p>
				<hr>
				<div class="nlist_count">목록:${listcount}개</div>
				<table class="table table-striped" >
					<thead>
						<tr>
							<th scope="col" style="width: 60px; text-align: center;">번호</th>
							<th scope="col" style="text-align: center;">제목</th>
							<th scope="col" style="width: 120px; text-align: center;">조휘수</th>
							<th scope="col" style="width: 120px; text-align: center;">날짜</th>
						</tr>
					</thead>
					<tbody>
					
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
						   <th colspan="4">공지사항이 없습니다.</th>
						  </tr>
						</c:if>
					</tbody>
				</table>
				
				 <%--페이징 즉 쪽나누기 추가 --%>
  <div id="bList_paging">
    <%-- 검색전 페이징 --%>
<c:if test="${(empty find_field) && (empty find_name)}">    
    <c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
    <c:if test="${page>1}">
     <a href="community_list?page=${page-1}">[이전]</a>&nbsp;
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="community_list?page=${a}">[${a}]</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    [다음]
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="community_list?page=${page+1}">[다음]</a>
    </c:if>
</c:if>

<%-- 검색후 페이징 --%>
 <c:if test="${(!empty find_field) || (!empty find_name)}">    
    <c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
    <c:if test="${page>1}">
     <a href="community_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    </c:if>
    
    <%--현재 쪽번호 출력--%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}"
    step="1">
     <c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
     <c:if test="${a != page}"><%--현재 페이지가 선택되지 않았
     다면 --%>
     <a href="community_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">
    [다음]
    </c:if>
    <c:if test="${page<maxpage}">
    <a href="community_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
    </c:if>
</c:if>   
  </div>
								
		
				<div id="list_menu">
				 <input type="button" value="글쓰기" onclick="location='community_write';"/>
				 <c:if test="${(!empty find_field) && (!empty find_name)}">
				  <input type="button" value="전체 목록" onclick="location='community_list?page=${page}';"/>
				 </c:if>
				</div>
				
				<div id="nfind_wrap">
				 <select name="find_field">
				  <option value="c_title" <c:if test="${find_field == 'c_title'}"> ${'selected'}</c:if>>제목</option>
				  <option value="c_cont" <c:if test="${find_field == 'c_cont'}">${'selected'}</c:if>>내용</option>
				 </select>
				 <input name="find_name" id="find_name" size="14" value="${find_name}"/>
				 <input type="submit" value="검색"/>
				</div>
				</form>

				

<jsp:include page="../include/footer.jsp"/>
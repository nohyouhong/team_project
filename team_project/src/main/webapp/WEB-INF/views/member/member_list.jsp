<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
<style>
.memberdel, #btnSearch{
	border-radius: 5px;
	height: 30px;
	width:40px;
	padding: 3px;
}
</style>
<script>
$(document).ready(function(){
	var frmPaging = $("#frmPaging");
	$("#btnSearch").click(function(){
		var searchType= $("#searchType").val();
		var keyword = $("#keyword").val();
		console.log("searchType: " + searchType);
		console.log("keyword: " + keyword);
		frmPaging.find("input[name=searchType]").val(searchType);
		frmPaging.find("input[name=keyword]").val(keyword);
		frmPaging.find("input[name=page]").val(1);
		frmPaging.attr("action","/member/member_list");
		frmPaging.attr("method","get");
		frmPaging.submit();
	});
	
	$(".memberdel").click(function(){
		console.log("클릭됨");
		var userid = $(this).attr("data-userid");
		console.log("userid: "+userid);
		frmPaging.find("input[name=userid]").val(userid);
		frmPaging.attr("action","/member/member_delete");
		frmPaging.attr("method","get");
		frmPaging.submit();
	});

});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div>
					<h2 id="iquiryh2">회원정보관리</h2>
					</div>
					<!-- 검색 -->
					<select style="margin-left:30xp;" id="searchType">
						<option value="id"
							<c:if test="${'id'==pagingDto.searchType}">selected</c:if>
						>아이디</option>
						<option value="email"
							<c:if test="${'email'==pagingDto.searchType}">selected</c:if>
						>이메일</option>
						<option value="cellphone"
							<c:if test="${'cellphone'==pagingDto.searchType}">selected</c:if>
						>폰번호</option>
					</select>
					<input type="text" id="keyword" value="${pagingDto.keyword}">
					<button type="button" class="btn btn-sm btn-outline-warning"
						id="btnSearch">검색</button>
					<table class="table ask_table">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>성별</th>
								<th>가입일</th>
								<th>폰번호</th>
								<th>포인트</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var="memberVo" items="${memberList}">
									<c:if test="${memberVo.m_code == 102}">
										<tr class="tr_list">
											<td class="td_list" >
												${memberVo.userid}
											</td>
											<td>${memberVo.username}</td>
											<td>${memberVo.email}</td>
											<td>${memberVo.gender}</td>
											<td>${memberVo.m_regdate}</td>
											<td>${memberVo.cellphone}</td>
											<td>${memberVo.m_point}</td>
											<td><button type="button" class="btn btn-outline-danger memberdel" data-userid="${memberVo.userid}">삭제</button></td>
										</tr>
									</c:if>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link in_page_link" href="${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li class="page-item">
					<a class="page-link in_page_link" href="${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link in_page_link" href="${pagingDto.endPage +1}">다음</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/admin_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/ask.css" type="text/css">

<script>
$(document).ready(function(){
	var frmpaging = $("#frmPaging");
	$(".td_list").click(function(){
		var a_bno = $(this).attr("data-a_bno");
		frmpaging.find("input[name=a_bno]").val(a_bno);
		frmpaging.attr("action", "/ask/ask_read");
		frmpaging.attr("method", "get");
		frmpaging.submit();
	});
	//페이지처리
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmpaging.find("input[name=page]").val(page);
		frmpaging.attr("action", "/ask/ask_list");
		frmpaging.attr("method", "get");
		frmpaging.submit();
	});
});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div>
					<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
					<h2 id="iquiryh2">나의 문의 내역</h2>
						<div id="asksend">
							<a id="btnWriteMessage" href="/ask/ask_form" class="btn btn-outline-success">1:1문의하기</a>
						</div>
					</div>
					<table class="table ask_table">
						<thead>
							<tr>
								<th>#</th>
								<th>문의제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var="askVo" items="${askList}" varStatus="ask_status">
									<tr class="tr_list">
										<td>${ask_status.count}</td>
										<td class="td_list" data-a_bno="${askVo.a_bno}" 
											style="padding-left:${askVo.re_level * 45}">
											${askVo.a_title}
										</td>
										<td>${askVo.writer}</td>
										<td>${askVo.a_regdate}</td>
										<td>
										<c:choose>
											<c:when test="${askVo.re_level == 1}">
												-
											</c:when>
											<c:when test="${askVo.a_state == 0}">
												답변예정
											</c:when>
											<c:when test="${askVo.a_state == 1}">
												<b>답변완료</b>
											</c:when>
										</c:choose>
										</td>
									</tr>
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
				<c:forEach begin="${pagingDto.startPage }"
					end="${pagingDto.endPage }" var="i">
					<li
						<c:choose>
							<c:when test="${i == pagingDto.page }">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>							
						</c:choose>
						class="page-item">
						<a class="page-link" href="${i}">${i}</a>
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

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">

<script>
$(document).ready(function(){
	var frmpaging = $("#frmPaging");
	$(".td_list").click(function(){
		var a_bno = $(this).attr("data-a_bno");
		frmpaging.find("input[name=a_bno]").val(a_bno);
		frmpaging.attr("action", "/inquiry/inquiry_read");
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
						<div id="inquirysend">
							<a id="btnWriteMessage" href="/inquiry/inquiry_form" class="btn btn-outline-success">1:1문의하기</a>
						</div>
					</div>
					<table class="table inquiry_table">
						<thead>
							<tr>
								<th>#</th>
								<th>문의제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${loginVo.m_code ==101}">
								<c:forEach var="inquiryVo" items="${allInquiryList}" varStatus="allInquiry_status">
									<tr class="tr_list">
										<td>${allInquiry_status.count}</td>
										<td class="td_list" data-a_bno="${inquiryVo.a_bno}">${inquiryVo.a_title}</td>
										<td>${inquiryVo.writer}</td>
										<td>${inquiryVo.a_regdate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="inquiryVo" items="${inquiryList}" varStatus="inquiry_status">
									<tr class="tr_list">
										<td>${inquiry_status.count}</td>
										<td class="td_list" data-a_bno="${inquiryVo.a_bno}">${inquiryVo.a_title}</td>
										<td>${inquiryVo.writer}</td>
										<td>${inquiryVo.a_regdate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
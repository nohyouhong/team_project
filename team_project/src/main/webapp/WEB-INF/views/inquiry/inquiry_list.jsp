<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">

<script>
$(document).ready(function(){
	var frmpaging = $("#frmPaging");
	$(".td_list").click(function(){
		var a_bno = $(this).attr("data-i_bno");
		frmpaging.find("input[name=i_bno]").val(i_bno);
		frmpaging.attr("action", "/inquiry/inquiry_read");
		frmpaging.attr("method", "get");
		frmpaging.submit();
	});
});
</script>
<div class="row">
	<div class="col-md-12" id="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<div class="cus-info">
							<a href="/customer/customer_center"> <img id="cus_img"
								src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>
					</div>
					<div class="col-md-9">
						<div>
							<img id="cus_img" src="/resources/customer_center/images/QnA.png"
								alt="고객센터이미지">
							<h2 id="iquiryh2">나의 문의 내역</h2>
							<div id="asksend">
								<a id="btnWriteMessage" href="/ask/ask_form"
									class="btn btn-outline-success">1:1문의하기</a>
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
								<c:forEach var="inquiryVo" items="${inquiryList}"
									varStatus="status">
									<tr class="tr_list">
										<td>${status.count}</td>
										<td class="td_list" data-i_bno="${inquiryVo.i_bno}"
											style="padding-left:${inquiryVo.re_level * 45}">
											${inquiryVo.i_title}</td>
										<td>${inquiryVo.writer}</td>
										<td>${inquiryVo.i_regdate}</td>
										<td><c:choose>
												<c:when test="${inquiryVo.re_level == 1}">
												-
											</c:when>
												<c:when test="${inquiryVo.i_state == 0}">
												답변예정
											</c:when>
												<c:when test="${inquiryVo.i_state == 1}">
													<b>답변완료</b>
												</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
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
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
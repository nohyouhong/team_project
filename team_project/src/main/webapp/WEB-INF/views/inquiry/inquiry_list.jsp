<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/inquiryList.css" type="text/css">

<script>
$(document).ready(function(){
	//게시글 보기
	var frmPaging = $("#frmPaging");
	$(".td_list").click(function(){
		var i_bno = $(this).attr("data-i_bno");
		frmPaging.find("input[name=i_bno]").val(i_bno);
		frmPaging.attr("action", "/inquiry/inquiry_read");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	//페이지 처리
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/inquiry/inquiry_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
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
						<div class="faq">
							<ul class="teb_lst">
								<li><a href="/customer/customer_center">자주묻는질문</a></li>
								<li><a href="/customer/agreement">이용약관</a></li>
								<li><a href="/customer/rules">개인정보취급방침</a></li>
								<li><a href="/customer/notice">공지사항</a></li>
								<li class="on"><a href="#">문의게시판</a></li>
							</ul>
							<c:if test="${not empty loginVo}">
								<div style="text-align:right;">
									<a href="/inquiry/inquiry_form" class="btn btn-outline-secondary askbtn">문의하기</a>
									<a href="/ask/ask_form" class="btn btn-outline-danger askbtn">1:1문의하기</a>
								</div>
							</c:if>
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
											<td>${inquiryVo.userid}</td>
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
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<nav>
									<ul class="pagination justify-content-center">
										<c:if test="${pagingDto.startPage != 1 }">
											<li class="page-item"><a class="page-link"
												href="${pagingDto.startPage - 1}">이전</a></li>
										</c:if>
										<c:forEach begin="${pagingDto.startPage }" end="${pagingDto.endPage }" var="i">
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
										<c:if test="${pagingDto.endPage != pagingDto.totalPage }">
											<li class="page-item"><a class="page-link"
												href="${pagingDto.endPage + 1}">다음</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						<div class="col-md-2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
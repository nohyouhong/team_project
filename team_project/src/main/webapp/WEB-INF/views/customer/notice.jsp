<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">

<script>
$(document).ready(function(){
	var frmPaging = $("#frmPaging");
	var faq = document.getElementsByClassName("faq-page");
	var i;
	
	for (i = 0; i < faq.length; i++) {
	    faq[i].addEventListener("click", function () {
	        /* Toggle between adding and removing the "active" class,
	        to highlight the button that controls the panel */
	        this.classList.toggle("show");
	        /* Toggle between hiding and showing the active panel */
	        var body = this.nextElementSibling;
	        if (body.style.display == "block") {
	            body.style.display = "none";
	        } else {
	            body.style.display = "block";
	        }
	    });
	};
	
	if(${loginVo.m_code == 101}){
		$("#notice_form").show();
	};
	
	var not = document.getElementsByClassName("n_title");
	var i;
	
	for (i = 0; i < not.length; i++) {
		not[i].addEventListener("click", function () {
	        this.classList.toggle("active");
	        var p = this.nextElementSibling;
	        var n_content = p.nextElementSibling;
	        if (n_content.style.display == "block") {
	        	n_content.style.display = "none";
	        } else {
	        	n_content.style.display = "block";
	        }
	    });
	};
	
});
</script>

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<div class="cus-info">
							<a href="/customer/customer_center">
							<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<div class="faq">
							<ul class="teb_lst">
								<li><a href="/customer/customer_center">자주묻는질문</a></li>
								<li><a href="/customer/agreement">이용약관</a></li>
								<li><a href="/customer/rules">개인정보취급방침</a></li>
								<li class="on"><a href="#">공지사항</a></li>
							</ul>
						<a href="/customer/notice_form" class="btn btn-outline-danger"
							 style="display:none;" id="notice_form">공지사항등록</a>
						</div>
						<c:forEach var="noticeVo" items="${notice_list}">
						<section>
							<div>
								<h3 class="n_title">${noticeVo.n_title}</h3>
								<p><span class="span_username">${noticeVo.username}</span>${noticeVo.n_regdate}
								</p>
								<div class="notice_content">
									<textarea class="form-control" readonly>${noticeVo.n_content}</textarea>
								</div>
							</div>
							<hr class="hr-line">
						</section>
						</c:forEach>
					</div>
				</div>
			</div>
		<div class="col-md-2"></div>
		<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li class="page-item">
					<a class="page-link" href="${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.endPage +1}">다음</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
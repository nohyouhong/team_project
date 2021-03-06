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
	        this.classList.toggle("show");
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
		$(".notice_modify").show();
		$(".notice_delete").show();
	}else{
		$(".notice_modify").hide();
		$(".notice_delete").hide();
		$(".notice_modify_run").hide();
	};
	
	var not = document.getElementsByClassName("n_title");
	var i;
	
	for (i = 0; i < not.length; i++) {
		not[i].addEventListener("click", function () {
	        this.classList.toggle("active");
	        var p = this.nextElementSibling;
	        if (p.style.display == "block") {
	        	p.style.display = "none";
	        } else {
	        	p.style.display = "block";
	        }
	    });
	};
	
	$(".notice_modify").click(function(){
		var notice_content = $(this).parent();
		var textarea = notice_content.find("textarea");
		var modify_run = notice_content.find(".notice_modify_run");
		var n_title = notice_content.parent();
		
		n_title.find(".n_title").eq(0).hide();
		n_title.find(".n_title_input").eq(0).show();
		textarea.attr("readonly", false);
		modify_run.fadeIn();
		$(this).fadeOut();
	});
	
	$(".notice_delete").click(function(e){
		e.preventDefault();
		var n_bno  = $(this).attr("href");
		frmPaging.find("input[name=n_bno]").val(n_bno);
		frmPaging.attr("action", "/customer/notice_delete");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
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
							<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="?????????????????????">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<div class="faq">
							<ul class="teb_lst">
								<li><a href="/customer/customer_center">??????????????????</a></li>
								<li><a href="/customer/agreement">????????????</a></li>
								<li><a href="/customer/rules">????????????????????????</a></li>
								<li class="on"><a href="#">????????????</a></li>
								<li><a href="/inquiry/inquiry_list">???????????????</a></li>
							</ul>
						<a href="/customer/notice_form" class="btn btn-outline-success"
							 style="display:none;" id="notice_form">??????????????????</a>
						</div>
						<c:forEach var="noticeVo" items="${notice_list}">
							<form role="form" method="post" action="/customer/notice_modify_run">
							<input type="hidden" value="${noticeVo.n_bno}" name="n_bno">
							<section>
								<div>
									<input type="text" value="${noticeVo.n_title}" name="n_title"
												class="form-control n_title_input" style="display:none;">
									<p><span class="span_username">${noticeVo.username}</span>  ${noticeVo.n_regdate}
									</p>
									<h3 class="n_title" >${noticeVo.n_title}</h3>
									<div class="notice_content">
										<textarea class="form-control" name="n_content" class="n_content" readonly>${noticeVo.n_content}</textarea>
										<button type="button" class="btn btn-outline-primary notice_modify">
											???????????? ??????
										</button>
										<button type="submit"
											class="btn btn-outline-warning notice_modify_run">
											???????????? ????????????
										</button>
										<a href="${noticeVo.n_bno}"
											class="btn btn-outline-danger notice_delete">
											???????????? ??????
										</a>
									</div>
								</div>
								<hr class="hr-line">
							</section>
							</form>
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
					<a class="page-link" href="${pagingDto.startPage -1}">??????</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li class="page-item">
					<a class="page-link" href="${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.endPage +1}">??????</a>
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
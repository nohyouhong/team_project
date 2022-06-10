<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">

<script>
$(document).ready(function(){
	var faq = document.getElementsByClassName("faq-page");
	var i;
	
	for (i = 0; i < faq.length; i++) {
	    faq[i].addEventListener("click", function () {
	        /* Toggle between adding and removing the "active" class,
	        to highlight the button that controls the panel */
	        this.classList.toggle("active");
	        /* Toggle between hiding and showing the active panel */
	        var body = this.nextElementSibling;
	        if (body.style.display == "block") {
	            body.style.display = "none";
	        } else {
	            body.style.display = "block";
	        }
	    });
	}
	if(${loginVo.m_code == 101}){
		$("#notice_form").show();
	};
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
							<a href="/customer/customer_center">
							<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<form role="form" method="post" action="/customer/notice_run">
						<input type="hidden" value="${loginVo.userid}" name="userid">
						<span id="notice_top">공지사항 등록</span>
						<button type="submit" class="btn btn-outline-danger">공지등록</button>
						<hr>
							<div class="form-group notice-form">
								<b>제목</b><input type="text" class="form-control" id="n_title" name="n_title" />
							</div>
							<div class="form-group notice-form">
								<b>내용</b><textarea class="form-control" id="n_content" name="n_content" rows="20"></textarea>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
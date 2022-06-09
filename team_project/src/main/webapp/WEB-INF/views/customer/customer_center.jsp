<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
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
							<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
						</div>	
					</div>
					<div class="col-md-9">
						<div class="faq">
							<ul class="teb_lst">
								<li class="on"><a href="#">자주묻는질문</a></li>
								<li><a href="#">이용약관</a></li>
								<li><a href="#">개인정보취급방침</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">공지사항</a></li>
							</ul>
							<a href="/member/inquiry" class="btn btn-outline-danger">1:1문의하기</a>
							<section class="faq-container">
								<div class="faq-one">
									<!-- faq question -->
									<h3 class="faq-page">내가 레시피 등록한 건 어디서 보나요?</h3>
									<!-- faq answer -->
									<div class="faq-body">
										<h5 class="faq-h5">-마이페이지에서 나의 레시피 보기에서 확인할 수 있습니다.</h5>
									</div>
								</div>
								<hr class="hr-line">
								<div class="faq-two">
									<!-- faq question -->
									<h3 class="faq-page">레시피 삭제 어떻게 하나요?</h3>
									<!-- faq answer -->
									<div class="faq-body">
										<h5 class="faq-h5">-레시피 상세보기 아래쪽에서 레시피 삭제 버튼 클릭시 삭제 가능합니다.</h5>
									</div>
								</div>
								<hr class="hr-line">
								<div class="faq-three">
									<!-- faq question -->
									<h3 class="faq-page">회원탈퇴는 어떻게 하나요?</h3>
									<!-- faq answer -->
									<div class="faq-body">
										<h5 class="faq-h5">
											-마이페이지에서 회원정보수정에 들어가면 
											아래쪽 회원탈퇴 버튼을 누르면 회원탈퇴가 가능합니다.
										</h5>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
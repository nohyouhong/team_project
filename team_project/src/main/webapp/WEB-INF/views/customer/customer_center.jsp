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
	        this.classList.toggle("active");
	        var body = this.nextElementSibling;
	        if (body.style.display == "block") {
	            body.style.display = "none";
	        } else {
	            body.style.display = "block";
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
								<li class="on"><a href="#">자주묻는질문</a></li>
								<li><a href="/customer/agreement">이용약관</a></li>
								<li><a href="/customer/rules">개인정보취급방침</a></li>
								<li><a href="/customer/notice">공지사항</a></li>
							</ul>
							<div id="inquirydiv">
							<a href="/inquiry/inquiry_form" class="btn btn-outline-danger" id="inquirybtn">1:1문의하기</a>
							</div>
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
								<hr class="hr-line">
								<div class="faq-four">
									<!-- faq question -->
									<h3 class="faq-page">문의글 수정은 안되나요?</h3>
									<!-- faq answer -->
									<div class="faq-body">
										<h5 class="faq-h5">
											-현재 상품 문의글이나 답변글은 수정이나 삭제를 할 수 없도록 되어 있으며 그 이유는 아래와 같습니다.
											상품 문의글이나 답변글 내용을 통하여 협의 거래를 한 후에 어느 일방이 해당 내용을 수정하거나 삭제한 후 협의 내용을 부정하거나 왜곡하여 주장할 수 있습니다.
											즉, 거래 협의의 증거로 사용될 수 있는 상품 문의글이나 답변글을 삭제할 수 있도록 하면 매매 거래후 판매자와 구매자간에 분쟁이 발생할 수 있습니다.
											이러한 분쟁을 미연에 방지할 수 있도록 하기 위하여 상품 문의글 및 답변글의 수정이나 삭제가 불가능 하도록 한 것이니 불편하시더라도 이해를 부탁드립니다.
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
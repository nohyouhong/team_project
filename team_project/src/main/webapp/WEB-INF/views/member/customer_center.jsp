<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
#cus_h2{
	margin-top:30px;
	margin-left:150px;
	text-align:left;
}
#cus_img{
	width:150px;
	height:150px;
	margin:50px 50px 50px auto;
}
.cus_menu{
	border-top:1px solid #e2e2e2;
	border-bottom:1px solid #cbcbcb;
	border-right:1px solid #e2e2e2;
	border-left:1px solid #e2e2e2;
	background-color:#ffffff;
	border-radius:5px;
}
.cus-item-last{
	margin-bottom:30px;
}
.cus-item{
	margin-top:10px;
}
li{
	list-style:none;
}
.faq_tr td, .faq_top_tr td {
    border-bottom: dashed 1px #EDEDED;
    text-align: left;
    padding: 20px;
    background-color: #fafafa;
    font-size: 13px;
    line-height: 24px;
}
.faq_top_q td, .faq_q td {
    border-bottom: dashed 1px #EDEDED;
    padding: 15px;
    font-size: 13px;
}
.anspan{
	color: #ff0000; 
	font-weight: bold; 
	font-size: 16px;
}
.quspan{
	color:#666;
	font-weight:bold; 
	font-size:16px;
}
.anspan span{
	font-size: 12px
}
.faq .teb_lst {margin: 100px auto 20px 50px; overflow: hidden; padding-bottom: 1px;  }
.faq .teb_lst li { float: left; width: 14.1%; height: 38px; margin: 0 -1px -1px 0; border: 1px solid #DCDCDC;}
.faq .teb_lst li:hover { position: relative; z-index: 20; border-color: #ff6600; background-color: #fff; }
.faq .teb_lst li:hover a { color: #ff6600; }
.faq .teb_lst li.on { position: relative; z-index: 10; border-color: #3d3d3d; background-color: #3d3d3d; font-weight: bold; letter-spacing: -1px; }
.faq .teb_lst li.on a { color: #fff; }
.faq .teb_lst li.col_last { width: 182px; }
.faq .teb_lst a { display: block; width: 100%; height: 100%; line-height: 38px; color: #606060; text-align: center; }

.an_td{
	display: none;
}

.faq_list {
    border-collapse: collapse;
    border-spacing: 0;
    display: table;
    box-sizing: border-box;
    text-indent: initial;
    border-color: grey;
}
.faq-page:after {
    content: '\02795';
    /* Unicode character for "plus" sign (+) */
    font-size: 13px;
    color: #777;
    float: right;
    margin-left: 5px;
}
.active:after {
    content: "\2796";
    /* Unicode character for "minus" sign (-) */
}
.faq-page {
    /* background-color: #eee; */
    color: #444;
    cursor: pointer;
    padding: 15px 20px;
    width: 100%;
    border: none;
    outline: none;
    transition: 0.4s;
    margin: auto;
    text-align:left;
}
.faq-body {
    padding: 0 18px;
    background-color: white;
    display: none;
    overflow: hidden;
}
.faq-h5{
	color: brown;
	text-align: left;
}
</style>

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
							<a href="#" class="btn btn-outline-danger">1:1문의하기</a>
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
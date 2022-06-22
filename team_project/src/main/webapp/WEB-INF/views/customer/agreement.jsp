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
							<a href="/customer/customer_center">
							<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<div class="faq">
							<ul class="teb_lst">
								<li><a href="/customer/customer_center">자주묻는질문</a></li>
								<li class="on"><a href="/customer/agreement">이용약관</a></li>
								<li><a href="/customer/rules">개인정보취급방침</a></li>
								<li><a href="/customer/notice">공지사항</a></li>
								<li><a href="/inquiry/inquiry_list">문의게시판</a></li>
							</ul>
						</div>
						<div id="cus_info">
							제 1조(목적)<br>
							이 약관은 울산KH정보교육원 JAVA반의 3명이 제공하는 레시피 서비스 및 관련 제반 서비스의 이용과 관련하여 사이트와 회원과의 권리,
							 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 하면, 사이트의 로그인 계정을 통해 해당 서비스를 모두 이용할 수 있습니다.
							<br>
							<br> 제2조(정의) <br>
							'사이트'란 JAVA반에서 제공하는 레시피 서비스를 말합니다.
							'회원'이란 사이트에 접속하여 이 약관에 따라 JAVA반과 이용계약을 체결하고 JAVA반이 제공하는 서비스를 이용하는 고객을
							말합니다. '아이디(ID)'란 회원식별과 서비스 이용을 위하여 회원이 선정하고 JAVA반이 승인한 문자와 숫자의 조합을
							말합니다. '비밀번호'란 회원의 정보보호와 안전한 서비스 이용을 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.
							'멀티미디어'란 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크등을 의미합니다.
							'레시피'란 회원이 JAVA반으로 부터별도의 대가 없이 서비스 내에 작성 및 등록한 멀티미디어를 말합니다.
							'컬럼'이란 JAVA반이 출처를 남기고 가져온 링크가 있는 첨부사이트를 의미합니다.
							<br>
							<br>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
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
								<li><a href="/customer/agreement">이용약관</a></li>
								<li class="on"><a href="#">개인정보취급방침</a></li>
								<li><a href="/customer/notice">공지사항</a></li>
								<li><a href="/inquiry/inquiry_list">문의게시판</a></li>
							</ul>
						</div>
						<div id="cus_info">
							<br>
							<p id="rules_p">오늘은 뭐먹지? 개인정보처리방침</p>
							<hr>
							<br>
							울산KH정보교육원 JAVA반(이하 'JAVA반'이라 한다.)은 개인정보 보호법 제30조에 따라
							JAVA반의 서비스를 이용하는 회원(이하 '이용자'라 한다)의 개인정보를 보호하고 이와
							관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립,공개합니다.<br>
							1.총칙<br>
							2.수집하는 개인정보의 항목 및 수집방법
							<br>
							<br>
							제1조 총칙<br>
							1. 개인정보란 생존하는 개인에 관란 정보로서 해당 정보에 포함되어 있는 이름,
							 연락처 등의 사항에 의하여 개인을 식별할 수 있는 정보를 말합니다.<br>
							2. JAVA반은 이용자의 개인정보를
							소중히 취급하며 정보통신망 이용촉진 및 정보보호 등에 관한 법률상의 개인정보보호규정 및 정보통신부가 제정한
							개인정보보호지침을 준수하고 있습니다. JAVA반은 개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 목적과
							방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
							３. JAVA반은 개인정보취급방침을 홈페이지 첫 화면에 공개함으로써 이용자가 언제나 용이하게 확인할 수 있도록 조치하고 있습니다.<br>
							４. JAVA반은 개인정보취급방침의 지속적인 개선을 위하여 개인정보취급방침을 개정하는데 필요한 절차를 정하고 있습니다.<br>
							 제2조 수집하는 개인정보의 항목 및 수집방법<br>
							1. JAVA반은 회원 가입 시 서비스 제공을 위해 필요한 최소한의 개인정보만을 수집합니다.<br>
							２. 이용자는 회사의 서비스를 이용하기 위해서 회원 가입 시 개인정보를 입력해야 합니다. <br>
							가) 필수항목
							: 아이디(ID), 비밀번호, 이름, 이메일주소, 성별
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
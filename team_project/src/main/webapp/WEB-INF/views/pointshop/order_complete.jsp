<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.order_title {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	height: 35px;
}
.order_title_li {
	display: block;
	float: left;
	margin: 5px;
	font-family: jua;
	font-size: 18px;
	color: #d1d1d1;
}
.order_title_li_this {
	display: block;
	float: left;
	margin: 5px;
	padding-bottom: 12px;
	font-family: jua;
	font-size: 18px;
	color: rgb(248, 56, 1);
}
.order_title_span {
	margin-right: 5px;
	font-family: jua;
	font-size: 18px;
	color: #d1d1d1;
}
.order_title_span_this {
	margin-right: 5px;
	padding-bottom: 12px;
	font-family: jua;
	font-size: 18px;
	color: rgb(248, 56, 1);
}
.order_title_span_arrow {
	margin-left: 5px;
	color: #d1d1d1;
	margin-top: 3px;
}
#imgdiv{
	text-align: center;
	margin-top: 150px;
	margin-bottom:200px;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="order_title">
				<h1>주문완료</h1>
				<ol type="1" class="order_title_ol">
					<li class="order_title_li">
						<span class="order_title_span">01</span>장바구니
						<span class="order_title_span_arrow">
							<i class="fas fa-chevron-circle-right"></i>
						</span>
					</li>
					<li class="order_title_li">
						<span class="order_title_span">02</span>주문/결제
						<span class="order_title_span_arrow">
							<i class="fas fa-chevron-circle-right"></i>
						</span>
					</li>
					<li class="order_title_li_this">
						<span class="order_title_span_this">03</span>주문 완료</li>
				</ol>
			</div>
			<hr>
			<div id="imgdiv">
				<img src="/resources/pointshop/order_complete.png" alt="주문완료문구"><br>
				<a href="/pointshop/order_history_list"><img src="/resources/pointshop/order_history_list.png" alt="주문내역 바로가기"></a>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
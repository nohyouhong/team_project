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

.order_list_div {
	margin-top: 30px;
}

/* 배송 정보 css */

.pay_address_tbl {
	border-bottom-style: solid;
	border-top-style: solid;
	vertical-align: middle;
}

.pay_address_tbl th {
	width: 180px;
	height: 60px;
	font-family: jua;
	font-size: 20px;
	vertical-align: middle;
}

.pay_address_tbl td {
	float: left;
	height: 60px;
	font-family: jua;
	font-size: 20px;
}

.new_saved_address_rdo {
	margin-left: 10px;
	margin-right: 5px;
}

.new_address_btn {
	margin-left: 10px;
	width: 120px;
	height: 40px;
	border-radius: 10px;
	border:none;
	background-color: rgb(255, 227, 219);
}

.pay_receiver {
	border-radius: 10px;
	border-color: rgb(255, 227, 219);
}
</style>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="order_title">
			<h1>주문/결제</h1>
			<ol type="1" class="order_title_ol">
				<li class="order_title_li">
					<span class="order_title_span">01</span>장바구니
					<span class="order_title_span_arrow">
						<i class="fas fa-chevron-circle-right"></i>
					</span>
				</li>
				<li class="order_title_li_this">
					<span class="order_title_span_this">02</span>주문/결제
					<span class="order_title_span_arrow">
						<i class="fas fa-chevron-circle-right"></i>
					</span>
				</li>
				<li class="order_title_li"><span class="order_title_span">03</span>주문 완료</li>
			</ol>
		</div>
		<hr>
		<div class="order_list_div">
			<h4>주문 상세 내역</h4>
			<table class="table">
				<thead>
					<tr>
						<th>상품 정보</th>
						<th>수량</th>
						<th>상품 금액</th>
						<th>할인</th>
						<th>합계 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>엄청 매운 닭발</td>
						<td>1</td>
						<td>10,000</td>
						<td>90%</td>
						<td>1,000</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="pay_address_div">
			<h4>배송 정보</h4>
			<table class="table pay_address_tbl">
				<tbody>
					<tr>
						<th>배송지 확인</th>
						<td>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">기본 배송지</label>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">최근 배송지</label>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">직접 입력</label>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">주문자 정보와 동일</label>
							<button type="button" class="new_address_btn">배송지 관리</button>
						</td>
					</tr>
					<tr>
						<th>받으실분</th>
						<td><input type="text" class="pay_receiver"></td>
					</tr>
					<tr>
						<th>받으실 곳</th>
						<td>1</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td>1</td>
					</tr>
					<tr>
						<th>남기실 말씀</th>
						<td>1</td>
					</tr>
					<tr>
						<th>배송정보 반영</th>
						<td>1</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>

<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<style>
#h_title{
	font-style: jua;
	margin-top:12px;
}
#h_th{
	height: 5px;
	padding: 0px;
}
.productImg{
	width: 150px;
}
.td1{
	width:20%;
}
.td2{
	width:60%;
	text-align:left;
	padding-top: 20px;
}
td.td3{
	width:20%;
	text-align:center;
	vertical-align: middle;
}
.product_name{
	font-size:20px;
	
}
.cancleOrderBtn, .confirm{
	border-radius: 5px;
	padding: 4px 13px;
	font-size:12px !important;
}
p{
	font-size:12px;
}
.option_count{ 
 	display:flex; 
 } 
 #titlediv{
 	display:flex;
 	margin-top:20px;
 }
.option{
	margin-right:30px;
}
li{
	list-style: none;
}
.status{
	color:#a5a5a5;
}
.titleImg{
	width:50px;
	height: 50px;
	margin-left:20px;
}
.h_date{
	margin-left:20px;
}
.h_price{
	margin-right:20px;
}
</style>
<script>
$(document).ready(function(){
	$(".cancleOrderBtn").click(function(){
		var h_pno = $(this).attr("data-h_pno");
		var sData = {
				"h_pno" : h_pno
		}
	});
});
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-12">
			<div id="titlediv">
				<img src="/resources/pointshop/product.png" class="titleImg">
				<h1 id="h_title">주문내역</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th colspan="3" id="h_th"></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${orderHistoryList}" var="historyVo">
								<tr>
									<td class="td1"><img src="/pay/displayImage?filename=${historyVo.h_picture}" class="productImg"></td>
									<td class="td2">
										<a href="#" class="product_name">${historyVo.h_title}</a><br>
										<span class="h_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${historyVo.h_sum_price}"/>원</span> <span class="status">|</span> 
										<span class="status h_date">${historyVo.h_date}</span>
										<hr>
										<p class="status">배송비: <fmt:formatNumber type="number" maxFractionDigits="3" value="${historyVo.h_deliverycharge}"/>원</p>
										<p class="status">배송지정보: ${historyVo.h_address}</p>
									</td>
									<td class="td3">
										<a href="" class="btn btn-outline-danger confirm">확정하기</a>
										<button type="button" class="btn btn-outline-secondary cancleOrderBtn" data-h_pno="${historyVo.h_pno}">취소하기</button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
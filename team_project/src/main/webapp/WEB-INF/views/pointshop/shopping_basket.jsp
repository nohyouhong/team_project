<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.cretHr{
	margin: 20px 0px;
}
.tableTitleDiv{
	margin-top: 50px;
	font-size: 22px;
	font-weight: 500;
}
.basketTable{
	margin: 15px 0px;
}
.basketTable th{
	border-top: 1px solid #7E7E7E;
	border-bottom: 2px solid #EBEBEB;
	background-color: #F7F7F7;
}
.basketTable tfoot{
	border-top: 2px solid #EBEBEB;
	border-bottom: 2px solid #EBEBEB;
	background-color: #F7F7F7;
}
.basketTable tbody td{
	border-left: 1px solid #EFEFEF;
	border-bottom: 1px solid #EBEBEB;
}
.basketTable tbody td:first-child, .basketTable tbody td:nth-child(2){
	border-left: 0px solid white;
}
.basketTable th{
	font-size: 15px;
	padding: 10px;
}
.basketTable td{
	padding: 10px;
}
.basketTable tfoot td{
	padding: 22px 0px;
}
.proAmount, .proUnit, .proPrice, .proDiscount, .proSum, .proDelivery{
	font-weight: 400;
	font-size: 15px;
}
.proDelivery, .proDeliveryUnit{
	color: #848484;
}
.proDeliveryUnit, .proUnit{
	margin-left: -3px;
}
.proImage{
	width: 248px;
	height: 248px;
	border: 1px solid #D4D4D4;
}
.proInfoDiv{
	text-align: left;
	font-size: 15px;
	display: inline-block;
	width:300px;
    margin-left: 10px;
	vertical-align: middle;
}
.proTitle{
	font-weight: 600;
}
.proOption{
	color: #808080;
	text-align: left;
	font-size: 13px;
	line-height: initial;
}
.proFactory{
	display: inline-block;
	width: 40%;
	text-align: left;
	font-size: 18px;
	font-weight: 500;
	vertical-align: top;
}
.proFactoryInfo{
	color: #5D5D5D;
}
.infoIcon{
	margin: 0px 25px;
	position: relative;
    bottom: 10px;
}
.proSumDiv{
	display: inline-block;
	width: 50%;
	text-align: right;
}
.proSumInfoDiv{
	display: inline-block;
	text-align: right;
}
.proSumInfoDiv2{
    margin-left: 25px;
	display: inline-block;
	text-align: right;
}
.infoTitle{
	font-size: 15px;
	font-weight: 500;
}
.infoEx{
	font-size: 17px;
	font-weight: 500;
	margin-right: -3px;
	color: rgb(248, 56, 1);
}
.infoEx2{
	font-size: 15px;
	font-weight: 500;
	color: rgb(248, 56, 1);
}
.allBasketTable tfoot td{
    padding: 30px 58px;
}
.allBasketTable{
	border: 2px solid #D4D4D4;
	width: 100%;
	margin-top: 55px;
}
.allProSumDiv{
	text-align: right;
}
.allProSumInfoDiv{
	display: inline-block;
	text-align: right;
}
.allProSumInfoDiv2{
    margin-left: 25px;
	display: inline-block;
	text-align: right;
}
.allInfoTitle{
	font-size: 17px;
	font-weight: 600;
}
.allInfoEx{
	font-size: 19px;
	font-weight: 600;
	margin-right: -3px;
	color: rgb(248, 56, 1);
}
.allInfoEx2{
	font-size: 17px;
	font-weight: 600;
	color: rgb(248, 56, 1);
}
.basketBtnDiv{
	margin-top: 30px;
	margin-bottom: 100px;
}
#selectedDeleteBtn, #allDeleteBtn{
	padding: 4px 20px;
    margin-right: 6px;
    background: white;
    border: 1px solid #A6A6A6;
    color: #2E2E2E;
}
.purchaseBtn{
	float: right;
}
#selectedPurchaseBtn{
    background: white;
    margin-right: 6px;
    padding: 17px 45px;
    border: 1px solid #A6A6A6;
    border-radius: 5px;
}
#allPurchaseBtn{
    padding: 17px 45px;
    background: #FF7676;
    border: 1px solid #FF7676;
	color: white;
    border-radius: 5px;
}
.updateAmountBtn{
	margin-top: 4px;
    font-size: 12px;
    border: 1px solid #D8D8D8;
    color: #737373;
    background: #F1F1F1;
    padding: 3px 10px;
}
</style>
<script>
$(function() {
	
	//제품종류별 커다란 테이블 생성 
	orderProductTableSetting();
	function orderProductTableSetting(){
		$(".oneProductListDiv:gt(0)").remove();
		url = "/pointshop/orderProductList";
		$.get(url, function(rData) {
			$.each(rData, function() {
				var oneProductList = $(".oneProductListDiv").eq(0).clone();
				oneProductList.show();
				var p_name = $(this)[0].p_name;
				console.log(p_name);
				var p_bno = $(this)[0].p_bno;
				$(oneProductList).find("div.tableTitleDiv").find("span").eq(0).text(p_name);
				$(oneProductList).find("div.hiddenP_bnoDiv").text(p_bno);
				$(oneProductList).find("span.proFactoryInfo").eq(1).text(p_name);
				$(".inputProductListDiv").append(oneProductList);
				//각각의 제품의 테이블안에 옵션별 각 정보 넣기
				var index = 0; //배달비 하나로 묵으려는 인덱스
				$(oneProductList).find("tr.oneProInfoInputDiv:gt(0)").remove();
				var url = "/pointshop/orderProductOptionList";
				var sData = {
					"p_bno" : p_bno
				};
				$.get(url, sData, function(rData) {
					$.each(rData, function(){
						var oneTr = $(oneProductList).find("tr.oneProInfoInputDiv").eq(0).clone();
						$(oneTr).show();
						var o_pno = $(this)[0].o_pno;						
						var o_titlepic = "/pointshop/displayImage?filename=" + $(this)[0].o_titlepic;						
						var p_title = $(this)[0].p_title;						
						var p_option = $(this)[0].p_option;						
						var o_amount = $(this)[0].o_amount.toLocaleString('ko-kr');						
						var o_price = $(this)[0].o_price.toLocaleString('ko-kr');						
						var p_discount = $(this)[0].p_discount;						
						var o_sum = $(this)[0].o_sum.toLocaleString('ko-kr');						
						var o_deliverycharge = $(this)[0].o_deliverycharge.toLocaleString('ko-kr');						
						$(oneTr).find(".orderProductCheck").val(o_pno);
						$(oneTr).find(".proImage").attr("src", o_titlepic);
						$(oneTr).find("span.proTitle").text(p_title);
						$(oneTr).find("div.proOption").text(p_option);
						$(oneTr).find(".proAmount").text(o_amount);
						$(oneTr).find(".proPrice").text(o_price);
						$(oneTr).find(".proDiscount").text(p_discount);
						$(oneTr).find(".proSum").text(o_sum);
						if(index == 0){
							if(parseInt(o_deliverycharge) == 0){
								$(oneTr).find("span.proDelivery").text("무료배송");
								$(oneTr).find(".proDeliveryUnit").remove();
							}else {
								$(oneTr).find("span.proDelivery").text(o_deliverycharge);
							}
						}else {
							$(oneTr).find("td.proDelivery").remove();
							$(oneProductList).find("td.proDelivery").eq(1).attr("rowspan", index + 1);
						}
						$(oneProductList).find(".proInfoInputDiv").append(oneTr);
						index++;
					});
				});
			});
		});
	}
	
	//체크박스 설정(한방한방) - attr로 배웟지만 무조건 prop쓰자!! attr 안먹히는상황잇음! 걍 prop써
	$(".inputProductListDiv").on("click", ".allCheck", function() {
		console.log("전체체크누름");
		if($(this).is(":checked")){//모두체크
			console.log("전체체크누름 모두체크");
			$(this).parents("table.basketTable").find(".orderProductCheck").prop("checked", true);
		} else{//모두해제
			console.log("전체체크누름 모두해제");
			$(this).parents("table.basketTable").find(".orderProductCheck").prop("checked", false);
		}
	});
	//체크박스 설정2(개별개별)
	$(".inputProductListDiv").on("click", ".orderProductCheck", function() {
		var sameTableCheckbox = $(this).parents("table.basketTable").find(".orderProductCheck");
		var checkState = true;
		console.log("체크");
		console.log($(this).attr("checked"));
		for(var i = 1; i < sameTableCheckbox.length; i++){
			if(!$(sameTableCheckbox[i]).is(":checked")){
				checkState = false;
				$(this).parents("table.basketTable").find(".allCheck").prop("checked", false);
			}
		}
		console.log(checkState);
		if(checkState){
			$(this).parents("table.basketTable").find(".allCheck").prop("checked", true);
		}
	});
	//폼
	var orderForm = $("#orderListForm");
	//선택 상품 삭제
	$("#selectedDeleteBtn").click(function(e) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			e.preventDefault();
			//밑에 요녀석은 체크안된건 on으로 넘어와서 콘트롤러에서 int로 받기위해 안쓰는 클론용 체크박스 다 삭제
			for(var i = 0; i < $(".oneProductListDiv").length; i++) {
				$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
			}
			orderForm.attr("action", "/pointshop/deleteBasket");
			orderForm.attr("method", "get");
			orderForm.submit();
		   } 
	});
	//모든 상품 삭제
	$("#allDeleteBtn").click(function(e) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			e.preventDefault();
			for(var i = 0; i < $(".oneProductListDiv").length; i++) {
				$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
			}
			$(".orderProductCheck").attr("checked", true);
			orderForm.attr("action", "/pointshop/deleteBasket");
			orderForm.attr("method", "get");
			orderForm.submit();
		}
	});
	//선택 상품 주문
	$("#selectedPurchaseBtn").click(function() {
		
	});
	//모든 상품 주문
	$("#allPurchaseBtn").click(function() {
		
	});
	//선택 상품 삭제
	$("#selectedDeleteBtn").click(function() {
		
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="order_title">
				<h1>장바구니</h1>
				<ol type="1" class="order_title_ol">
					<li class="order_title_li_this">
						<span class="order_title_span_this">01</span>장바구니
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
					<li class="order_title_li">
						<span class="order_title_span">03</span>주문 완료</li>
				</ol>
			</div>
			<hr class="cretHr">
			<form id="orderListForm">
			<div class="inputProductListDiv">
				<div style="display: none;" class="oneProductListDiv">
					<div style="display: none;" class="hiddenP_bnoDiv">p_bno</div>
					<div class="tableTitleDiv">
						<span>상품종류</span>
						<span> 배송상품</span>
					</div>
					<table class="basketTable">
						<thead>
							<tr>
								<th width="2%">
									<input class="allCheck" type="checkbox">
								</th>
								<th width="48%">상품/옵션 정보</th>
								<th width="10%">수량</th>
								<th width="10%">상품 금액</th>
								<th width="10%">할인</th>
								<th width="10%">합계 금액</th>
								<th width="10%">배송비</th>
							</tr>
						</thead>
						<tbody class="proInfoInputDiv">
	<!-- 						<tr class="oneProInfoInputDiv"> -->
							<tr class="oneProInfoInputDiv" style="display: none;">
								<td>
									<input class="orderProductCheck" type="checkbox" name="o_pno">
								</td>
								<td>
									<div>
										<img class="proImage" src="/resources/main_mypage/images/cook.png">
										<div class="proInfoDiv">
											<span class="proTitle">이건제목입니다 이건제목입니다 이건제목입니다 이건제목입니다 이건제목입니다</span><br>
											<div class="proOption">이건옵션입니다 이건옵션입니다 이건옵션입니다 이건옵션입니다 이건옵션입니다</div>
										</div>
									</div>
								</td>
								<td>
									<div>
										<span class="proAmount"></span>
										<span class="proUnit">개</span>
									</div>
									<button class="updateAmountBtn">옵션/수량변경</button>
								</td>
								<td>
									<span class="proPrice"></span>
									<span class="proUnit">원</span>
								</td>
								<td>
									<span class="proDiscount"></span>
									<span class="proUnit">%</span>
								</td>
								<td>
									<span class="proSum"></span>
									<span class="proUnit">원</span>
								</td>
								<td class="proDelivery">
									<span class="proDelivery"></span>
									<span class="proDeliveryUnit">원</span>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">
									<div class="proFactory">
										<span class="proFactoryInfo">[</span>
										<span class="proFactoryInfo">상품종류</span>
										<span class="proFactoryInfo"> 배송상품 ]</span>
									</div>
									<div class="proSumDiv">
										<span class="proSumInfoDiv">
											<span class="infoTitle">총 </span>
											<span class="infoTitle">2</span>
											<span class="infoTitle">개의 배송금액</span><br>
											<span class="infoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="16000" /></span>
											<span class="infoEx2">원</span>
										</span>
										<i class="fa-solid fa-circle-plus fa-lg infoIcon"></i>
										<span class="proSumInfoDiv">
											<span class="infoTitle">배송비</span><br>
											<span class="infoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="6000" /></span>
											<span class="infoEx2">원</span>
										</span>
										<i class="fa-solid fa-circle-pause fa-lg fa-rotate-90 infoEx infoIcon"></i>
										<span class="proSumInfoDiv2">
											<span class="infoTitle">합계</span><br>
											<span class="infoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="16000" /></span>
											<span class="infoEx2">원</span>
										</span>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			</form>
			<table class="allBasketTable">
				<tfoot>
					<td>
						<div class="allProSumDiv">
							<span class="allProSumInfoDiv">
								<span class="allInfoTitle">총 </span>
								<span class="allInfoTitle">2</span>
								<span class="allInfoTitle">개의 배송금액</span><br>
								<span class="allInfoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="16000" /></span>
								<span class="allInfoEx2">원</span>
							</span>
							<i class="fa-solid fa-circle-plus fa-lg infoIcon"></i>
							<span class="allProSumInfoDiv">
								<span class="allInfoTitle">배송비</span><br>
								<span class="allInfoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="6000" /></span>
								<span class="allInfoEx2">원</span>
							</span>
							<i class="fa-solid fa-circle-pause fa-lg fa-rotate-90 infoEx infoIcon"></i>
							<span class="allProSumInfoDiv2">
								<span class="allInfoTitle">합계</span><br>
								<span class="allInfoEx"><fmt:formatNumber type="number" maxFractionDigits="3" value="16000" /></span>
								<span class="allInfoEx2">원</span>
							</span>
						</div>
					</td>
				</tfoot>
			</table>
			<div class="basketBtnDiv">
				<button id="selectedDeleteBtn" type="button">선택 상품 삭제</button>
				<button id="allDeleteBtn" type="button">모든 상품 삭제</button>
				<span class="purchaseBtn">
					<button id="selectedPurchaseBtn" type="button">선택 상품 주문</button>
					<button id="allPurchaseBtn" type="button">모든 상품 주문</button>
				</span>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
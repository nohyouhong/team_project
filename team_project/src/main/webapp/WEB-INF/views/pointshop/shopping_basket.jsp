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
.goProductPage{
	cursor: pointer;
}
.modalProImg{
	width: 70px;
	height: 70px;
	margin: 25px;
}
.modalProTitleDiv{
	display: inline-block;
    width: 340px;
}
.modalProTitle{
    font-weight: 500;
}
.modalProExplain{
    font-size: 14px;
	color: #A6A6A6;
}
.modalProSelectDiv{
	margin: 20px;
}
.modalProSelectTitle{
	font-weight: 500;
	margin-right: 50px;
}
.modalProSelect{
	width: 330px;
	color: #626262;
	border: 1px solid #A6A6A6;
    padding: 3px 10px;
}
.thisOptionDiv{
	background: #F6F6F6;
	padding: 10px 0px;
}
.thisOption{
    font-size: 13px;
	display: inline-block;
    width: 240px;
    margin-left: 20px;
}
.thisAmount{
    width: 50px;
    text-align: center;
    margin-right: 15px;
}
.thisSum{
	font-size: 18px;
}
.thisUnit{
    font-size: 17px;
    font-weight: 600;
}
</style>
<script>
$(function() {
	
	//??????????????? ????????? ????????? ?????? 
	orderProductTableSetting();
	function orderProductTableSetting(){
		var allDeliveryCharge = 0;
		var allSum = 0;
		var allIndex = 0;
		$(".oneProductListDiv:gt(0)").remove();
		url = "/pointshop/orderProductList";
		$.get(url, function(rData) {
			$.each(rData, function() {
				var oneProductList = $(".oneProductListDiv").eq(0).clone();
				oneProductList.show();
				var p_name = $(this)[0].p_name;
				var p_bno = $(this)[0].p_bno;
				var l_lno = $(this)[0].l_lno;
				console.log(l_lno);
				$(oneProductList).find("div.tableTitleDiv").find("span").eq(0).text(p_name);
				$(oneProductList).find("div.hiddenP_bnoDiv").text(p_bno);
				$(oneProductList).find("span.proFactoryInfo").eq(1).text(p_name);
				$(".inputProductListDiv").append(oneProductList);
				//????????? ????????? ??????????????? ????????? ??? ?????? ??????
				var index = 0; //????????? ????????? ???????????? ?????????
				var priceSum = 0;	
				$(oneProductList).find("tr.oneProInfoInputDiv:gt(0)").remove();
				var url = "/pointshop/orderProductOptionList";
				var sData = {
					"p_bno" : p_bno,
					"l_lno" : l_lno
				};
				$.get(url, sData, function(rData) {
					$.each(rData, function(){
						var oneTr = $(oneProductList).find("tr.oneProInfoInputDiv").eq(0).clone();
						$(oneTr).show();
						var o_pno = $(this)[0].o_pno;						
						var p_ino = $(this)[0].p_ino;						
						var o_titlepic = "/pointshop/displayImage?filename=" + $(this)[0].o_titlepic;						
						var p_title = $(this)[0].p_title;						
						var p_option = $(this)[0].p_option;						
						var o_amount = $(this)[0].o_amount.toLocaleString('ko-kr');						
						var p_price = ($(this)[0].p_price * $(this)[0].o_amount).toLocaleString('ko-kr');						
						var p_discount = $(this)[0].p_discount;						
						var o_sum = $(this)[0].o_sum.toLocaleString('ko-kr');	
						priceSum += parseInt($(this)[0].o_sum);
						allSum += parseInt($(this)[0].o_sum);
						var o_deliverycharge = $(this)[0].o_deliverycharge.toLocaleString('ko-kr');						
						$(oneTr).find("img.goProductPage").attr("data-p_bno", p_bno);
						$(oneTr).find("div.goProductPage").attr("data-p_bno", p_bno);
						$(oneTr).find(".updateAmountBtn").attr("data-p_bno", p_bno);
						$(oneTr).find(".updateAmountBtn").attr("data-p_ino", p_ino);
						$(oneTr).find(".orderProductCheck").val(o_pno);
						$(oneTr).find(".proImage").attr("src", o_titlepic);
						$(oneTr).find("span.proTitle").text(p_title);
						$(oneTr).find("div.proOption").text(p_option);
						$(oneTr).find(".proAmount").text(o_amount);
						$(oneTr).find(".proPrice").text(p_price);
						$(oneTr).find(".proDiscount").text(p_discount);
						$(oneTr).find(".proSum").text(o_sum);
						if(index == 0){
							if(parseInt(o_deliverycharge) == 0){
								$(oneTr).find("span.proDelivery").text("????????????");
								$(oneTr).find(".proDeliveryUnit").remove();
								
							}else {
								$(oneTr).find("span.proDelivery").text(o_deliverycharge.toLocaleString('ko-kr'));
							}
							$(oneProductList).find("span.infoEx").eq(1).text(o_deliverycharge.toLocaleString('ko-kr'));
							allDeliveryCharge += parseInt($(this)[0].o_deliverycharge);
						}else {
							$(oneTr).find("td.proDelivery").remove();
							$(oneProductList).find("td.proDelivery").eq(1).attr("rowspan", index + 1);
						}
						//????????????????????????
						$(oneProductList).find("span.infoTitle").eq(1).text(index + 1);
						$(oneProductList).find("span.infoEx").eq(0).text(priceSum.toLocaleString('ko-kr'));
						var allPriceSum = priceSum + parseInt($(this)[0].o_deliverycharge);
						$(oneProductList).find("span.infoEx").eq(2).text(allPriceSum.toLocaleString('ko-kr'));
						
						$(oneProductList).find(".proInfoInputDiv").append(oneTr);
						index++;
						allIndex++;
					});
				});
			});
		});
		setTimeout(function() {
			console.log("allSum", allSum);
			console.log("allDeliveryCharge", allDeliveryCharge);
			$(".allInfoTitle").eq(1).text(allIndex);
			$(".allInfoEx").eq(0).text(allSum.toLocaleString('ko-kr'));
			$(".allInfoEx").eq(1).text(allDeliveryCharge.toLocaleString('ko-kr'));
			$(".allInfoEx").eq(2).text((allSum + allDeliveryCharge).toLocaleString('ko-kr'));
		}, 1000);
	}
	
	//???????????? ??????(????????????) - attr??? ???????????? ????????? prop??????!! attr ????????????????????????! ??? prop???
	$(".inputProductListDiv").on("click", ".allCheck", function() {
		console.log("??????????????????");
		if($(this).is(":checked")){//????????????
			console.log("?????????????????? ????????????");
			$(this).parents("table.basketTable").find(".orderProductCheck").prop("checked", true);
			//?????? ?????????
			var deliveryChargeVal = $(this).parents("table.basketTable").find("span.proDelivery").eq(1).text().replaceAll(",", "");
			var deliveryCharge = parseInt(deliveryChargeVal);
			var proSum = 0;
			var proSumVals = $(this).parents("table.basketTable").find(".proSum");
			for(var i = 1; i < proSumVals.length; i++){
				var proSumVal = $(proSumVals).eq(i).text().replaceAll(",", "");
				proSum += parseInt(proSumVal);
			}
			var allSum = proSum + deliveryCharge;
			$(this).parents("table.basketTable").find(".infoTitle").eq(1).text(proSumVals.length - 1);
			$(this).parents("table.basketTable").find(".infoEx").eq(0).text(proSum.toLocaleString('ko-kr'));
			$(this).parents("table.basketTable").find(".infoEx").eq(1).text(deliveryCharge.toLocaleString('ko-kr'));
			$(this).parents("table.basketTable").find(".infoEx").eq(2).text(allSum.toLocaleString('ko-kr'));
			
		} else{//????????????
			console.log("?????????????????? ????????????");
			$(this).parents("table.basketTable").find(".orderProductCheck").prop("checked", false);
			//?????? 0 ???
			$(this).parents("table.basketTable").find(".infoTitle").eq(1).text(0);
			$(this).parents("table.basketTable").find(".infoEx").text(0);
		}
	});
	//???????????? ??????2(????????????)
	$(".inputProductListDiv").on("click", ".orderProductCheck", function() {
		var sameTableCheckbox = $(this).parents("table.basketTable").find(".orderProductCheck");
		var checkState = true;
		console.log("??????");
		console.log($(this).attr("checked"));
		for(var i = 1; i < sameTableCheckbox.length; i++){
			if(!$(sameTableCheckbox[i]).is(":checked")){
				checkState = false;
				$(this).parents("table.basketTable").find(".allCheck").prop("checked", false);
			}
		}
		if(checkState){
			$(this).parents("table.basketTable").find(".allCheck").prop("checked", true);
		}
		pointChange();
	});
	
	
	//????????? ?????????
	function pointChange(){
		//??????????????? ???????????? ??????????????????
		var checkNum = $("input:checkbox[name=o_pno]:checked");
		var allSum = parseInt($(this).parents("table.basketTable").find(".infoEx").eq(2).text().replaceAll(",", ""));
		var allSum = parseInt($(this).parents("table.basketTable").find(".infoEx").eq(2).text().replaceAll(",", ""));
		var allSum = parseInt($(this).parents("table.basketTable").find(".infoEx").eq(2).text().replaceAll(",", ""));
		
	}
	
	//???
	var orderForm = $("#orderListForm");
	//?????? ?????? ??????
	$("#selectedDeleteBtn").click(function(e) {
		if (confirm("????????? ?????????????????????????")) {
			e.preventDefault();
			//?????? ???????????? ??????????????? on?????? ???????????? ?????????????????? int??? ???????????? ????????? ????????? ???????????? ??? ??????
			for(var i = 0; i < $(".oneProductListDiv").length; i++) {
				$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
			}
			orderForm.attr("action", "/pointshop/deleteBasket");
			orderForm.attr("method", "get");
			orderForm.submit();
		   } 
	});
	//?????? ?????? ??????
	$("#allDeleteBtn").click(function(e) {
		if (confirm("????????? ?????????????????????????")) {
			e.preventDefault();
			$(".orderProductCheck").attr("checked", true);
			for(var i = 0; i < $(".oneProductListDiv").length; i++) {
				$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
			}
			orderForm.attr("action", "/pointshop/deleteBasket");
			orderForm.attr("method", "get");
			orderForm.submit();
		}
	});
	//?????? ?????? ??????
	$("#selectedPurchaseBtn").click(function(e) {
		e.preventDefault();
		for(var i = 0; i < $(".oneProductListDiv").length; i++) {
			$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
		}
		orderForm.attr("action", "/pay/paymentScreen");
		orderForm.attr("method", "get");
		orderForm.submit();
	});
	//?????? ?????? ??????
	$("#allPurchaseBtn").click(function(e) {
		e.preventDefault();
		allCheck();
		for(var i = 0; i < $(".oneProductListDiv").length; i++) {
			$(".oneProductListDiv").eq(i).find(".orderProductCheck").eq(0).remove();
		}
		orderForm.attr("action", "/pay/paymentScreen");
		orderForm.attr("method", "get");
		orderForm.submit();
	});
	//????????????????????????
	allCheck();
	function allCheck() {
		$(".allCheck").prop("checked", true);
		$(".orderProductCheck").prop("checked", true);
	}
	//???????????? ???????????? ????????? ?????????????????? ??????
	$(".inputProductListDiv").on("click", ".goProductPage", function() {
		var p_bno = $(this).attr("data-p_bno");
		location.href = "/pointshop/read?p_bno=" + p_bno;
	});
	//???????????? ??????
	function modalProListSetting(input_p_bno, input_p_ino){
		var p_bno = input_p_bno;
		var p_ino = input_p_ino;
		var url = "/pointshop/getOptionByBno";
		var sData = {
			"p_bno" : p_bno	
		};
		$.get(url, sData, function(rData) {
			console.log(rData);
			var src = "/pointshop/displayImage?filename=" + rData[0].o_titlepic;
			var p_title = rData[0].p_title;
			var p_explain = rData[0].p_explain;
			$(".modalOption:gt(0)").remove();
			$(".modalProImg").attr("src", src);
			$(".modalProTitle").text(p_title);
			$(".modalProExplain").text(p_explain);
			$(".modalProSelect").attr("data-p_bno", p_bno);
			for(var i = 0; i < rData.length; i++){
				var this_p_ino = rData[i].p_ino;
				var p_option = rData[i].p_option;
				var o_price = rData[i].o_price;
				var p_stock = rData[i].p_stock;
				var html = "<option  class='modalOption' value='" + this_p_ino + "'>" + p_option;
				html += " : " + o_price + "????????? : " + p_stock + "???</option>";
				$(".modalProSelect").append(html);				
				if(this_p_ino == p_ino){
					var this_option = rData[i].p_option;
					var this_amount = rData[i].o_amount;
					var this_sum = rData[i].o_sum.toLocaleString('ko-kr');
					if(rData[i].o_state != 1){
						this_amount	= "1";
						this_sum = o_price.toLocaleString('ko-kr');
						console.log(this_sum);
						console.log(o_price);
					}
					$(".thisOption").text(this_option);
					$(".thisPrice").text(o_price);
					$(".thisAmount").val(this_amount);
					$(".thisSum").text(this_sum);
				}
			}
			//???????????????(??????)
			$("#p_ino").val(p_ino);
			$("#p_bno").val(p_bno);
			$("#o_titlepic").val(rData[0].o_titlepic);
			$("#o_deliverycharge").val(rData[0].o_deliverycharge);
		});
	}
	
	//?????? ??????
	$(".inputProductListDiv").on("click", ".updateAmountBtn", function() {
		$("#modal-644554").trigger("click");
		var input_p_bno = $(this).attr("data-p_bno");
		var input_p_ino = $(this).attr("data-p_ino");
		modalProListSetting(input_p_bno, input_p_ino)
	});
	//?????? ??????????????? ????????????
	$(".thisAmount").change(function() {
		var price = parseInt($(".thisPrice").text());
		var amount = $(this).val();
		$(".thisSum").text((price * amount).toLocaleString('ko-kr'));
	});
	//?????? ??????????????? ????????? ????????????
	$(".modalProSelect").change(function() {
		var input_p_bno = $(this).attr("data-p_bno");
		var input_p_ino = $(this).val();
		modalProListSetting(input_p_bno, input_p_ino)
	});
	//???????????? ????????? ??????????????? ??? ????????????
	$(".modalUpdateRunBtn").click(function(){
		$("#modal-644554").trigger("click");
		
		var o_price = $(".thisPrice").text();
		var o_amount = $(".thisAmount").val();
		var o_sum = $(".thisSum").text().replaceAll(",", "");
		$("#o_price").val(o_price);
		$("#o_amount").val(o_amount);
		$("#o_sum").val(o_sum);
		var basketUpdateForm = $("#basketUpdateForm");
		basketUpdateForm.attr("action", "/pointshop/updateBasket");
		basketUpdateForm.attr("method", "post");
		basketUpdateForm.submit();
	});
});
</script>
<!-- ????????? -->
<form id="basketUpdateForm">
	<input type="hidden" id="p_ino" name="p_ino">
	<input type="hidden" id="p_bno" name="p_bno">
	<input type="hidden" id="o_amount" name="o_amount">
	<input type="hidden" id="o_sum" name="o_sum">
	<input type="hidden" id="o_titlepic" name="o_titlepic">
	<input type="hidden" id="o_price" name="o_price">
	<input type="hidden" id="o_deliverycharge" name="o_deliverycharge">
</form>
<!-- ????????? -->
<!-- ?????? -->
<a style="display: none;" id="modal-644554" href="#modal-container-644554" role="button"
	class="btn" data-toggle="modal">Launch demo modal</a>

<div class="modal fade" id="modal-container-644554" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">????????????</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">??</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="modalTitleDiv">
					<img class="modalProImg">
					<div class="modalProTitleDiv">
						<div class="modalProTitle">????????? ?????????????????? ?????????????????? ?????????????????? ???</div>
						<div class="modalProExplain">????????? ?????????????????? ?????????????????? ?????????????????? ???</div>
					</div>
				</div>
				<hr>
				<div class="modalProSelectDiv">
					<span class="modalProSelectTitle">??????</span>
					<select class="modalProSelect">
						<option class="modalOption" value="">= ?????? : ?????? : ?????? =</option>
					</select>
				</div>
				<div class="thisOptionDiv">
					<div class="thisOption">????????? ??????????????? ??????????????? ??????</div>
					<input class="thisAmount" type="number" value="10">
					<span style="display: none;" class="thisPrice">19000</span>
					<span class="thisSum">19000</span>
					<span class="thisUnit">P</span>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-secondary modalUpdateRunBtn">??????</button>
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">??????</button>
			</div>
		</div>
	</div>
</div>
<!-- ?????? -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="order_title">
				<h1>????????????</h1>
				<ol type="1" class="order_title_ol">
					<li class="order_title_li_this">
						<span class="order_title_span_this">01</span>????????????
						<span class="order_title_span_arrow">
							<i class="fas fa-chevron-circle-right"></i>
						</span>
					</li>
					<li class="order_title_li">
						<span class="order_title_span">02</span>??????/??????
						<span class="order_title_span_arrow">
							<i class="fas fa-chevron-circle-right"></i>
						</span>
					</li>
					<li class="order_title_li">
						<span class="order_title_span">03</span>?????? ??????</li>
				</ol>
			</div>
			<hr class="cretHr">
			<form id="orderListForm">
			<div class="inputProductListDiv">
				<div style="display: none;" class="oneProductListDiv">
					<div style="display: none;" class="hiddenP_bnoDiv">p_bno</div>
					<div class="tableTitleDiv">
						<span>????????????</span>
						<span> ????????????</span>
					</div>
					<table class="basketTable">
						<thead>
							<tr>
								<th width="2%">
									<input class="allCheck" type="checkbox">
								</th>
								<th width="48%">??????/?????? ??????</th>
								<th width="10%">??????</th>
								<th width="10%">?????? ??????</th>
								<th width="10%">??????</th>
								<th width="10%">?????? ??????</th>
								<th width="10%">?????????</th>
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
										<img class="proImage goProductPage" src="/resources/main_mypage/images/cook.png">
										<div class="proInfoDiv goProductPage">
											<span class="proTitle">????????????????????? ????????????????????? ????????????????????? ????????????????????? ?????????????????????</span><br>
											<div class="proOption">????????????????????? ????????????????????? ????????????????????? ????????????????????? ?????????????????????</div>
										</div>
									</div>
								</td>
								<td>
									<div>
										<span class="proAmount"></span>
										<span class="proUnit">???</span>
									</div>
									<button type="button" class="updateAmountBtn">??????/????????????</button>
								</td>
								<td>
									<span class="proPrice"></span>
									<span class="proUnit">P</span>
								</td>
								<td>
									<span class="proDiscount"></span>
									<span class="proUnit">%</span>
								</td>
								<td>
									<span class="proSum"></span>
									<span class="proUnit">P</span>
								</td>
								<td class="proDelivery">
									<span class="proDelivery"></span>
									<span class="proDeliveryUnit">P</span>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">
									<div class="proFactory">
										<span class="proFactoryInfo">[</span>
										<span class="proFactoryInfo">????????????</span>
										<span class="proFactoryInfo"> ???????????? ]</span>
									</div>
									<div class="proSumDiv">
										<span class="proSumInfoDiv">
											<span class="infoTitle">??? </span>
											<span class="infoTitle">2</span>
											<span class="infoTitle">?????? ????????????</span><br>
											<span class="infoEx"></span>
											<span class="infoEx2">P</span>
										</span>
										<i class="fa-solid fa-circle-plus fa-lg infoIcon"></i>
										<span class="proSumInfoDiv">
											<span class="infoTitle">?????????</span><br>
											<span class="infoEx"></span>
											<span class="infoEx2">P</span>
										</span>
										<i class="fa-solid fa-circle-pause fa-lg fa-rotate-90 infoIcon"></i>
										<span class="proSumInfoDiv2">
											<span class="infoTitle">??????</span><br>
											<span class="infoEx"></span>
											<span class="infoEx2">P</span>
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
								<span class="allInfoTitle">??? </span>
								<span class="allInfoTitle"></span>
								<span class="allInfoTitle">?????? ????????????</span><br>
								<span class="allInfoEx"></span>
								<span class="allInfoEx2">P</span>
							</span>
							<i class="fa-solid fa-circle-plus fa-lg infoIcon"></i>
							<span class="allProSumInfoDiv">
								<span class="allInfoTitle">?????????</span><br>
								<span class="allInfoEx"></span>
								<span class="allInfoEx2">P</span>
							</span>
							<i class="fa-solid fa-circle-pause fa-lg fa-rotate-90 infoEx infoIcon"></i>
							<span class="allProSumInfoDiv2">
								<span class="allInfoTitle">??????</span><br>
								<span class="allInfoEx"></span>
								<span class="allInfoEx2">P</span>
							</span>
						</div>
					</td>
				</tfoot>
			</table>
			<div class="basketBtnDiv">
				<button id="selectedDeleteBtn" type="button">?????? ?????? ??????</button>
				<button id="allDeleteBtn" type="button">?????? ?????? ??????</button>
				<span class="purchaseBtn">
					<button id="selectedPurchaseBtn" type="button">?????? ?????? ??????</button>
					<button id="allPurchaseBtn" type="button">?????? ?????? ??????</button>
				</span>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
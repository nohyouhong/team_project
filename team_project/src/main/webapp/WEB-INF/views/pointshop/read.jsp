 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.pointShopProDiv{
	margin: 50px;
}
.proInfoDIv, .allProPicDiv{
	position: relative;
	left: 80px;
}
.creHr{
	margin: 20px 5px;
}
.creHr2{
	margin: 70px 5px;
}
.mainProPic{
	width: 580px;
	height: 510px;
	border-radius: 10px;
}
.proPicDiv{
	margin-top: 5px;
}
.proPic{
	width: 130px;
	height: 130px;
	border-radius: 10px;
	margin-left: 9px;
	cursor: pointer;
}
.proInfoDIv{
	width: 450px;
}
.proTitle{
	font-size: 30px;
	margin-top: 10px;
	width: 450px;
}
.proTitleEx{
	color: #808080;
	margin-top: 5px;
}
.proPriceDiv{
	margin-top: 25px;
}
.proDiscount, .proPrice2{
	font-size: 35px;
	font-weight: 500;
}
.proDiscount{
	color: #F86647;
	font-style: italic;
}
.proPrice1{
	font-size: 20px;
	text-decoration: line-through;
}
.proPrice2{
	margin-left: 15px;
}
.proPrice2Unit{
	font-size: 30px;
}
.avgRating{
	margin-left: 6px;
    font-weight: bold;
    font-size: 17px;
}
.ratingCnt{
	color: #808080;
	font-size: 17px;
}
.proRating{
	margin: 10px 0px;
	margin-top: 20px;
	margin-bottom: 40px;
}
.yellowStar{
	color: #EAE909;
	margin-right: -4px;
}
.grayStar{
	color: #BEB6B6
	margin-right: -4px;
}
.proInfoTitle{
	font-size: 17px;
	margin-left: 6px;
}
.proInfoTitle2{
	font-size: 17px;
	margin-left: 11px;
}
.proInfo{
	font-weight: bold;
	font-size: 17px;
	margin-left: 20px
}
.proUnit{
	font-size: 16px;
}
.proOptionDiv{
	margin: 10px 0px; 
}
.proOpSelect{
	margin: 10px 5px;
    border: 1px solid #B0B0B0;
	border-radius: 5px;
    width: 445px;
    height: 35px;
    padding: 5px 10px;
}
.basketBtn{
	width: 170px;
	height: 60px;
    background: white;
    border: 2px solid #7ACE00;
    margin-left: 5px;
    color: #7ACE00;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
}
.purchaseBtn{
	width: 270px;
    height: 60px;
    background: #7ACE00;
    border: 2px solid #7ACE00;
    color: white;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
}
.proPurchaseBtnDiv{
	margin-top: 40px;
}
.proExDiv{
	text-align: center;
	padding: 0px 60px;
}
.proTitleDivs{
	text-align: left;
	margin-bottom: 60px;
}
.titleDiv{
	font-size: 26px;
}
.productTitleDiv{
	margin-left: 5px;
	font-size: 15px;
	font-style:italic;
	color: #BEB6B6;
}
.proExImage{
	width: 1000px;
	height: 1400px;
}
.showHideBtn{
	width: 680px;
    height: 70px;
    background: #7ACE00;
    border: 2px solid #7ACE00;
    color: white;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
    margin-top: 30px;
}
.proExImageDiv{
	text-align: center;
}
.ratingValSpan{
	background: #EAE909;
	color: white;
	font-size: 45px;
	font-weight: bold;
	padding: 8px 20px;
	border-radius: 10px;
	margin-right: 25px;
}
.addBasketDiv{
    border-bottom: 2px solid;
}
.oneBasketInfo{
	background: #F4F4F4;
	margin-bottom: 10px;
	padding: 10px 20px;
}
.onProInfoAll{
    margin-bottom: 10px;
}
.oneProInfo{
	font-size: 16px;
	font-weight: 700;
}
.oneProInfoX{
	float: right;
	font-size: 25px;
	cursor: pointer;
}
.oneProInfoSignP{
	cursor: pointer;
}
.oneProInfoSignM{
	cursor: pointer;
}
.proInfoSign{
	display: inline-block;
    width: 120px;
    height: 35px;
    background: white;
    border: 1px solid #D5D5D5;
    border-radius: 6px;
    text-align: center;
}
.sumVal{
	margin-left: 10px;
	font-size: 20px;
}
.sumValUnit{
	font-size: 20px;
}
.sumAllValDiv{
	margin-top: 10px;
	text-align: right;
}
.sumAllTitle{
	font-size: 22px;
	font-weight: 600;
}
.sumAllVal{
	font-size: 35px;
	font-weight: 600;
	color: #7ACE00;
	margin-left: 10px;	
}
.sumAllValUnit{
	font-size: 26px;
	color: #7ACE00;
	margin-right: 5px;
}
.oneProNumInput{
	font-size: 20px;
	border: 0px solid black;
	width: 70px;
    text-align: center;
    position: relative;
    left: 1px;
}
.oneProNumInput:focus{
    outline: none;
}
input[type='number'] {
    -moz-appearance:textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
</style>
<script>
$(function() {
	
	//누르면 메인사진으로 보이기
	$(".proPic").click(function() {
		var src = $(this).attr("src");
		$("#mainProPic").attr("src", src);
	});
	//상세보기 보여주기
	$("#showBtn").click(function() {
		$(".proExImage").show();
		$(this).hide();
		$("#hideBtn").show();
	});
	//상세보기 숨기기
	$("#hideBtn").click(function() {
		var images = $(".proExImage");
		if(images.length > 2) {
			for(var i = 2; i < images.length; i++){
				$(images[i]).hide();
			}
		}
		$(this).hide();
		$("#showBtn").show();
	});
	
	//select 바꿀때마다 쇼우 
	$(".proOpSelect").change(function(){
		var index = $(this).val();
		//기본 옵션은 처리안되게
		if( index != "1001"){
			var basketInfos = $(".oneBasketInfo");
			//옵션창 켜진거 안켜진거 구별해서 안켜진것만 실행
			if($(basketInfos).eq(index).css("display") == "none"){
				$(".addBasketDiv").show();
				$(".sumAllValDiv").show();
				var oneBasketInfo = $(".oneBasketInfo").eq(index).show();
				var info_price = parseInt($(".oneVal").eq(index).text().replaceAll(",", ""));
				var now_price = $(".sumAllVal").text();
				var now_priceVal = parseInt(now_price.replaceAll(",", ""));
				var sum = info_price + now_priceVal;
				var sumVal = sum.toLocaleString('ko-kr');
				$(".sumAllVal").text(sumVal);
			} 
		}
	});
	
	//증가버튼
	$(".addBasketDiv").on("click", ".oneProInfoSignP", function() {
		//숫자변환
		var proInfoSignSpan = $(this).parent();
		var nowIndex = parseInt($(proInfoSignSpan).find("input.oneProNumInput").val());
		var newIndex = nowIndex + 1;
		$(proInfoSignSpan).find("input.oneProNumInput").val(newIndex);
		
		//가격변환(옵션가격)
		var addPrice = parseInt($(this).parent().parent().find("span.oneVal").text().replaceAll(",", ""));
		var nowPrice1 = parseInt($(this).parent().parent().find("span.sumVal").text().replaceAll(",", ""));
		var optionPrice = nowPrice1 + addPrice;
		var optionPriceVal = optionPrice.toLocaleString('ko-kr');
		$(this).parent().parent().find("span.sumVal").text(optionPriceVal);
		
		//가격변환(전체가격)
		var nowPrice = parseInt($(".sumAllVal").text().replaceAll(",", ""));
		var sum = nowPrice + addPrice;
		var sumVal = sum.toLocaleString('ko-kr');
		$(".sumAllVal").text(sumVal);
	});
	//감소버튼
	$(".addBasketDiv").on("click", ".oneProInfoSignM", function() {
		var proInfoSignSpan =  $(this).parent();
		var nowIndex = parseInt($(proInfoSignSpan).find("input.oneProNumInput").val());
		if(nowIndex > 1) {
			var newIndex = nowIndex - 1;
			$(proInfoSignSpan).find("input.oneProNumInput").val(newIndex);
			//가격변환(옵션가격)
			var subPrice = parseInt($(this).parent().parent().find("span.oneVal").text().replaceAll(",", ""));
			var nowPrice1 = parseInt($(this).parent().parent().find("span.sumVal").text().replaceAll(",", ""));
			var optionPrice = nowPrice1 - subPrice;
			var optionPriceVal = optionPrice.toLocaleString('ko-kr');
			$(this).parent().parent().find("span.sumVal").text(optionPriceVal);
			
			//가격변환(전체가격)
			var nowPrice2 = parseInt($(".sumAllVal").text().replaceAll(",", ""));
			var sum = nowPrice2 - subPrice;
			var sumVal = sum.toLocaleString('ko-kr');
			$(".sumAllVal").text(sumVal);
		}
	});
	
	//x버튼 누를시 닫기
	$(".addBasketDiv").on("click", ".oneProInfoX", function() {
		var oneBasketInfo = $(this).parent().parent();
		$(oneBasketInfo).hide();
		//값없애기
		var onePrice = $(oneBasketInfo).find("span.oneVal").text().replaceAll(",", "");
		var allSubPrice = parseInt($(oneBasketInfo).find("span.sumVal").text().replaceAll(",", ""));
		var nowPrice = parseInt($(".sumAllVal").text().replaceAll(",", ""));
		var sumPrice = nowPrice - allSubPrice;
		var sumPriceVal = sumPrice.toLocaleString('ko-kr');
		$(".sumAllVal").text(sumPriceVal);
		$(oneBasketInfo).find("input.oneProNumInput").val("1");
		
		//옵션 모두 하이드시 다 하이드
		var priceState = false;
		var basketInfos = $(".oneBasketInfo");
		var index = basketInfos.length;
		for(var i = 0; i < index; i++){
			if($(basketInfos).eq(i).css("display") == "none"){
				priceState = false;
			} else {
				priceState = true;
				break;
			}
		}
		if(!priceState) {
			$(".addBasketDiv").hide();
			$(".sumAllValDiv").hide();
		}
	});
	
	//옵션갯수를 직접입력할때 바꾸기
	$(".oneProNumInput").change(function() {
		console.log("체인지");
		//그전값빼기
		var nowNum = parseInt($(this).val());
		var subPrice = parseInt($(this).parent().parent().find("span.sumVal").text().replaceAll(",", ""));
		var nowPrice = parseInt($(".sumAllVal").text().replaceAll(",", ""));
		var sumPrice = nowPrice - subPrice;
		
		//새로운값 더하기
		var oneVal = parseInt($(this).parent().parent().find("span.oneVal").text().replaceAll(",", ""));
		var nowVal = oneVal * nowNum;
		var sumOptionVal = nowVal.toLocaleString('ko-kr');
		$(this).parent().parent().find("span.sumVal").text(sumOptionVal);
		
		sumPrice += nowVal;
		var sumPriceVal = sumPrice.toLocaleString('ko-kr');
		$(".sumAllVal").text(sumPriceVal);
	});
	
	//장바구니 담기
	$(".basketBtn").click(function() {
		var basketInfos = $(".oneBasketInfo");
		for(var i = 0; i < basketInfos.length; i++){
			if($(basketInfos).eq(i).css("display") != "none"){
				var p_ino = $(basketInfos).eq(i).find("span.oneProIno").text();
				var html = '<input type="hidden" name="p_inos" value="' + p_ino + '">';	
				var o_price = $(basketInfos).eq(i).find("span.oneVal").text().replace(",", "");
				html += '<input type="hidden" name="o_prices" value="' + o_price + '">';	
				var o_amount = $(basketInfos).eq(i).find("input.oneProNumInput").val();
				html += '<input type="hidden" name="o_amounts" value="' + o_amount + '">';	
				var o_sum = $(basketInfos).eq(i).find("span.sumVal").text().replaceAll(",", "");
				html += '<input type="hidden" name="o_sums" value="' + o_sum + '">';	
				$("#basketRunForm").append(html);
			}
		}
		
		var form = $("#basketRunForm");
		var formData = new FormData(form[0]);
		console.log(formData);
		var url = "/pointshop/addBasket";
		
		$.ajax({
			"enctype" : "multipart/form-data",  
			"processData" : false,
			"contentType" : false,
			"url" : url,
			"method" : "post",
			"data" : formData,
			"success" : function(rData) {
				if(rData == "true"){
					console.log(rData);
					//장바구니아이콘 숫자 올리기 비동기를 여기다가
					alert("장바구니에 추가 되었습니다.");
				}
			}
		});
	});
});
</script>
<%-- ${pointShopBoardVo }<br><br> --%>
<%-- 상품리스트${productList }z<br><br> --%>
<%-- ${productPicList[0] }<br><br> --%>
<%-- ${productExPicList }<br><br> --%>
<%-- ${tagList }<br><br> --%>
<form id="basketRunForm">
	<input type="hidden" name="o_titlepic" value="${productPicList[0]}">
	<input type="hidden" name="p_bno" value="${pointShopBoardVo.p_bno}">
	<input type="hidden" name="o_deliverycharge" value="${pointShopBoardVo.deliverycharge}">
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 pointShopProDiv">
			<div style="text-align: right; margin-top:30px; margin-bottom:30px; margin-right:60px;">
				<a class="btn btn-outline-success linkBtn" href="/pointshop/list">
					<i class="fa-solid fa-list fa-lg"></i> 목록가기</a>
				<c:if test="${loginVo.m_code == 101 }">
					<a class="btn btn-outline-info linkBtn" href="/pointshop/update_form?p_bno=${pointShopBoardVo.p_bno }">
						<i class="fa-solid fa-highlighter fa-lg"></i> 수정하기</a>
					<a class="btn btn-outline-danger linkBtn" href="/pointshop/delete?p_bno=${pointShopBoardVo.p_bno }" id="btnDelete">
						<i class="fa-solid fa-eraser fa-lg"></i> 삭제하기</a>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="allProPicDiv">
						<div class="mainProPicDiv">
							<img id="mainProPic" class="mainProPic" src="/pointshop/displayImage?filename=${productPicList[0]}">
						</div>
						<div class="proPicDiv">
							<c:if test="${not empty productPicList[0]}">
								<img class="proPic" src="/pointshop/displayImage?filename=${productPicList[0]}">
							</c:if>
							<c:if test="${not empty productPicList[1]}">
								<img class="proPic" src="/pointshop/displayImage?filename=${productPicList[1]}">
							</c:if>
							<c:if test="${not empty productPicList[2]}">
								<img class="proPic" src="/pointshop/displayImage?filename=${productPicList[2]}">
							</c:if>
							<c:if test="${not empty productPicList[3]}">
								<img class="proPic" src="/pointshop/displayImage?filename=${productPicList[3]}">
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="proInfoDIv">
						<div class="proTitle" >${pointShopBoardVo.p_title }</div>
						<div class="proTitleEx" >${pointShopBoardVo.p_explain }</div>
						<div class="proPriceDiv">
							<span class="proDiscount">${productList[0].p_discount }%</span>
							<span class="proPrice2"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${productList[0].p_sum}" /></span>
							<span class="proPrice2Unit">P</span>
							<div class="proPrice1">${productList[0].p_price }P</div>
						</div>
						<div class="proRating">
							<span class="starRating">
								<i class="fas fa-star yellowStar"></i>
								<i class="fas fa-star yellowStar"></i>
								<i class="fas fa-star yellowStar"></i>
								<i class="fas fa-star yellowStar"></i>
								<i class="fas fa-star yellowStar"></i>
							</span>
							<span class="avgRating">4.9</span>
							<span class="ratingCnt">(20)</span>
						</div>
						<hr class="creHr">
						<div class="deliveryChargeDiv">
							<i class="fas fa-truck fa-lg"></i>
							<span class="proInfoTitle">배송</span>
							<c:choose>
								<c:when test="${pointShopBoardVo.deliverycharge == 0 }">
									<span class="proInfo"></span>
									<span class="proUnit">무료배송</span>
								</c:when>
								<c:otherwise>
									<span class="proInfo">${pointShopBoardVo.deliverycharge }</span>
									<span class="proUnit">포인트</span>
								</c:otherwise>
							</c:choose>
						</div>
						<hr class="creHr">
						<div class="purchaseCntDiv">
							<i class="fas fa-cash-register fa-lg"></i>
							<span class="proInfoTitle2">구매</span>
							<span class="proInfo">${pointShopBoardVo.p_purchasecnt }</span>
							<span class="proUnit">구매</span>
						</div>
						<hr class="creHr">
						<div class="proOptionDiv">
							<select class="proOpSelect">
								<option class="proOption" value="1001" selected>= 옵션 : 가격 : 재고 =</option>
								<c:forEach items="${productList}" var="productVo" varStatus="count">
									<option class="proOption" value="${count.index }">
										<span>
											<c:if test="${count.index < 11}">0</c:if>${count.index + 1 }.
										</span>
										<span>${productVo.p_option}</span> :
										<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${productVo.p_price }" />포인트</span> : 
										<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${productVo.p_stock }" />개</span> 
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="addBasketDiv" style="display: none;">
							<c:forEach items="${productList}" var="productVo" varStatus="count">
								<div class="oneBasketInfo" style="display: none;">
									<div class="onProInfoAll">
										<span class="oneProIno" style="display: none;">${productVo.p_ino }</span>
										<span class="oneProInfo">${count.index + 1 }</span>.
										<span class="oneProInfo opInfo">${productVo.p_option }</span>
										<span class="oneProInfoX">&times;</span>
									</div>
									<div>
										<span class="proInfoSign">
											<i class="fas fa-angle-left fa-lg oneProInfoSignM"></i>
											<input class="oneProNumInput" type="number" value="1">
											<i class="fas fa-angle-right fa-lg oneProInfoSignP"></i>
										</span>
										<span class="oneVal" style="display:none;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${productVo.p_sum }" /></span>
										<span class="sumVal"><fmt:formatNumber type="number" maxFractionDigits="3" value="${productVo.p_sum }" /></span>
										<span class="sumValUnit">P</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="sumAllValDiv" style="display: none;">
							<span class="sumAllTitle">주문금액</span>
							<span class="sumAllVal">0</span>
							<span class="sumAllValUnit">P</span>
						</div>
						<div class="proPurchaseBtnDiv">
							<button type="button" class="basketBtn">장바구니</button>
							<button type="button" class="purchaseBtn">바로구매</button>
						</div>
					</div>
				</div>
			</div>
			<hr class="creHr2">
			<div class="proExDiv">
				<div class="proTitleDivs">
					<span class="titleDiv">상세정보</span>
					<span class="productTitleDiv">Product Info</span>
				</div>
				<div class="proExImageDiv">
					<c:forEach items="${productExPicList}" var="productExPic" varStatus="count">
						<img class="proExImage" 
							<c:if test="${count.index > 1}">style="display:none;"</c:if>
							src="/pointshop/displayImage?filename=${productExPic}">
					</c:forEach>
				</div>
				<button type="button" id="showBtn" class="showHideBtn">상세 보기</button>
				<button type="button" id="hideBtn" class="showHideBtn" style="display: none;">숨기기</button>
			</div>
			<hr class="creHr2">
			<div class="proExDiv">
				<div class="starRatingDiv">
					<span class="ratingValSpan">${pointShopBoardVo.p_avgrating }</span>
					<i class="fas fa-star fa-3x yellowStar"></i>
					<i class="fas fa-star fa-3x yellowStar"></i>
					<i class="fas fa-star fa-3x yellowStar"></i>
					<i class="fas fa-star fa-3x yellowStar"></i>
					<i class="fas fa-star fa-3x yellowStar"></i>				
				</div>
			</div>
			<hr class="creHr2">
			<div class="proExDiv">
				<div class="proTitleDivs">
					<span class="titleDiv">후기</span>
					<span class="productTitleDiv">Review</span>
				</div>
				
				
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
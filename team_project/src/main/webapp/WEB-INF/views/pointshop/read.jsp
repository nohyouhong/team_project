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
	margin-left: 25px;
	cursor: pointer;
}
.oneProInfoSignM{
	margin-right: 25px;
	cursor: pointer;
}
.oneProNumInput{
	font-size: 20px;
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
// 		console.log(index);
		$(".addBasketDiv").show();
		$(".sumAllValDiv").show();
		var oneBasketInfo = $(".oneBasketInfo").eq(index).show();
		var info_price2 = "${productList[" + index + "].p_price}";
		console.log(info_price2);
		var now_price = $(".sumAllVal").text();
		console.log(now_price);
		$(".sumAllVal").text(info_price + now_price);;
	});
	
	//x버튼 누를시 닫기
	$(".oneProInfoX").click(function() {
		$(this).parent().parent().hide();
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
	
});
</script>
<%-- ${pointShopBoardVo }<br><br> --%>
<%-- 상품리스트${productList }z<br><br> --%>
<%-- ${productPicList[0] }<br><br> --%>
<%-- ${productExPicList }<br><br> --%>
<%-- ${tagList }<br><br> --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 pointShopProDiv">
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
							<span class="proPrice2Unit">원</span>
							<div class="proPrice1">${productList[0].p_price }원</div>
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
							<span class="proInfo">${pointShopBoardVo.deliverycharge }</span>
							<span class="proUnit">구매</span>
						</div>
						<hr class="creHr">
						<div class="proOptionDiv">
							<select class="proOpSelect">
								<option class="proOption" value="basic" selected>= 옵션 : 가격 : 재고 =</option>
								<c:forEach items="${productList}" var="productVo" varStatus="count">
									<option class="proOption" value="${count.index }">
										<span>
											<c:if test="${count.index < 10}">0</c:if>${count.index }.
										</span>
										<span>${productVo.p_option}</span> :
										<span>${productVo.p_price}</span> :
										<span>${productVo.p_stock}</span> 
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="addBasketDiv" style="display: none;">
							<c:forEach items="${productList}" var="productVo" varStatus="count">
								<div class="oneBasketInfo" style="display: none;">
									<div class="onProInfoAll">
										<span class="oneProInfo">${count.index + 1 }.</span>
										<span class="oneProInfo">${productVo.p_option }</span>
										<span class="oneProInfoX">&times;</span>
									</div>
									<div>
										<span class="proInfoSign">
											<i class="fas fa-angle-left fa-lg oneProInfoSignM"></i>
											<span class="oneProNumInput">1</span>
											<i class="fas fa-angle-right fa-lg oneProInfoSignP"></i>
										</span>
										<span class="sumVal"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${productVo.p_sum }" />원</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="sumAllValDiv" style="display: none;">
							<span class="sumAllTitle">주문금액</span>
							<span class="sumAllVal"><fmt:formatNumber type="number" maxFractionDigits="0"  value="0" /></span>
							<span class="sumAllValUnit">원</span>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<%@include file="/WEB-INF/views/include/paging.jsp" %>
<style>
.productListNumDiv{
	margin-left: 20px;
	margin-right: 20px;
	font-size: 18px;
}
.listTypeDiv{
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 65px;
    font-size: 18px;
    position: relative;
    top: 35px;
}
.listTypeDiv{
	text-align: right;
	font-size: 13px;
}
.listNumVal{
	font-size: 25px;
	color: rgba(248, 56, 1);
}
.listTypeBtn{
	margin-left: -14px;
	border: 1px solid #BEB6B6;
	cursor: pointer;
	padding: 11px 19px;
	position: relative;
	left: 20px;
	top: 10px;
}
.selectTypeBtn{
	background: #FA7C61;
	color: white;
}
.productListDiv{
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}
.oneProduct{
	display: inline-block;
	margin: 10px;
	margin-top: 20px;
	margin-bottom: 35px;
	width: 280px;
	vertical-align: top;
}
.oneProductImage{
	width: 280px;
	height: 280px;
	border-radius: 10px;
	cursor: pointer;
}
.oneProductTitle{
	margin-top: 10px;
	margin-bottom: 1px;
	font-size: 16px;
	font-weight: 600;
}
.pagingDiv{
	margin-top: 30px;
}
#createPointShopBtn{
    position: relative;
    top: 10px;
    right: 10px;
}
#goShopBasketBtn{
	position: relative;
    top: 10px;
    right: 2px;
}
.discountSpan{
	color: #FF6B6B;
	font-size: 19px;
	font-weight: 600;
}
.discountSpanUnit{
	color: #FF6B6B;
	font-size: 18px;
	margin-left: -4px;
	font-weight: 600;
	margin-right: 5px;
}
.priceSpan{
	font-size: 19px;
    font-weight: 500;
}
.priceSpanUnit{
	font-size: 18px;
	font-weight: 500;
	margin-left: -4px;
}
.freeDeliveryDiv{
	margin-top: 10px
}
.freeDeliverySpan{
	font-size: 12px;
    border: 1px solid #D1D1D1;
    padding: 4px 7px;
}
</style>
<script>
$(function(){
	var frmPaging = $("#frmPaging");
	//read할때 
	$(".pointshopBoardLink").click(function(e) {
		e.preventDefault();
		var p_bno = $(this).attr("data-p_bno"); 
		frmPaging.find("input[name=p_bno]").val(p_bno);
		frmPaging.attr("action", "/pointshop/read");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 이전 1, 2 ~ 10 다음   등등..
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/pointshop/list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	// 최신순, 조회순, 평점순   등등..
	$("a.pointshopListType").click(function(e) {
		e.preventDefault();
		var listType = $(this).attr("href");
		
		frmPaging.find("input[name=pointshopListType]").val(listType);
		frmPaging.attr("action", "/pointshop/list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	//물품등록
	$("#createPointShopBtn").click(function(e) {
		e.preventDefault();
		
		frmPaging.attr("action", "/pointshop/createForm");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	//물품등록
	$("#goShopBasketBtn").click(function(e) {
		e.preventDefault();
		
		frmPaging.attr("action", "/pointshop/shopping_basket");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="listTypeDiv">
				<button style="visibility: hidden;" class="btn btn-outline-danger">공간을 위해</button>
				<c:if test="${loginVo.m_code == 101 }">
					<button id="createPointShopBtn" class="btn btn-outline-danger">
						<i class="fa-solid fa-pen-to-square fa-lg"></i>
						상품 등록하기
					</button>
					<button id="goShopBasketBtn" class="btn btn-outline-dark">
						<i class="fas fa-shopping-cart fa-lg"></i>
						장바구니
					</button>
				</c:if>
				<a href="p_purchasecnt" class="pointshopListType"><span class="listTypeBtn 
				<c:if test="${pagingDto.pointshopListType == 'p_purchasecnt'}">selectTypeBtn</c:if>
				">주문순</span></a>
				<a href="p_price" class="pointshopListType"><span class="listTypeBtn 
				<c:if test="${pagingDto.pointshopListType == 'p_price'}">selectTypeBtn</c:if>
				">가격순</span></a>
				<a href="p_bno" class="pointshopListType"><span class="listTypeBtn 
				<c:if test="${pagingDto.pointshopListType == 'p_bno'}">selectTypeBtn</c:if>
				">최신순</span></a>
			</div>
			<div class="productListNumDiv">
				<span>총</span>
				<span class="listNumVal">${boardCount }</span>
				<span>개의 상품이 등록 되있습니다.</span>
			</div>
			<div class="productListDiv">
				<c:forEach items="${pointShopBoardList }" var="pointShopBoardVo">
					<div class="oneProduct">
						<div>
							<a class="pointshopBoardLink" data-p_bno="${pointShopBoardVo.p_bno}" href="/pointshop/read?p_bno=${pointShopBoardVo.p_bno }">
								<img class="oneProductImage" src="/pointshop/displayImage?filename=${pointShopBoardVo.p_picture}">
							</a>
						</div>
						<div>
							<div class="oneProductTitle">${pointShopBoardVo.p_title}</div>
							<div class="oneProductCharge">
								<span class="discountSpan">${pointShopBoardVo.p_discount}</span>
								<span class="discountSpanUnit">%</span>
								<span class="priceSpan">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${pointShopBoardVo.p_sum}" />
								</span>
								<span class="priceSpanUnit">P</span>
							</div>
							<c:if test="${pointShopBoardVo.deliverycharge == 0}">
								<div class="freeDeliveryDiv">
									<span class="freeDeliverySpan">무료배송</span>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 	페이징 -->
			<div class="row">
				<div class="col-md-12 pagingDiv">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1 }">
							<li class="page-item"><a class="page-link" href="${pagingDto.startPage - 1}">이전</a></li>
							</c:if>
							<c:forEach begin="${pagingDto.startPage }" end="${pagingDto.endPage }" var="i">
								<li
									<c:choose>
										<c:when test="${i == pagingDto.page }">
											class="page-item active"
										</c:when>
										<c:otherwise>
											class="page-item"
										</c:otherwise>							
									</c:choose>
								 class="page-item"><a class="page-link" href="${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${pagingDto.endPage != pagingDto.totalPage }">
							<li class="page-item"><a class="page-link" href="${pagingDto.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
<!-- 			페이징 -->
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
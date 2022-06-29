<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<div class="container-fluid">
	<div class="row titleP">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<span class="createTitleSpan">포인트물품 등록</span>
			<hr class="createHr">
			<form role="form" id="pointShopForm" action="/pointshop/createRun"
				method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginVo.userid }">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="p_title" class="createTitle">물품 제목</label> 
							<input type="text" class="form-control inputVal" id="p_title"
								name="p_title" placeholder="예) [美친특가] 시원한 열무 물김치 2kg / 5kg" />
						</div>
						<div class="form-group">
							<label for="p_name" class="createTitle">물품 종류</label> 
							<input type="text" class="form-control inputVal" id="p_name"
								name="p_name" placeholder="예) 김치 두부 물 소금 설탕 식용유" />
						</div>
						<div class="form-group">
							<label for="p_explain" class="createTitle">물품 소개</label>
							<textarea rows="4" class="form-control inputVal" id="p_explain"
								name="p_explain"
								placeholder="물품을 간단히 소개해주세요. 예) 여름 별미 시원하고 상큼한 열무 물김치"></textarea>
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">카테고리</label>
							<div class="row">
								<div class="col">
									<select class="custom-select inputVal" id="sellstate"
										name="sellstate">
										<option selected value="">판매현황</option>
										<option value="판매예정">판매예정</option>
										<option value="판매중">판매중</option>
										<option value="판매중지">판매중지</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="purchaseplace"
										name="purchaseplace">
										<option selected value="">매입처</option>
										<option value="자사">자사</option>
										<option value="기타">기타</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="deliverycharge"
										name="deliverycharge">
										<option selected value="">배송비</option>
										<option value="0">무료배송</option>
										<option value="3000">3000</option>
										<option value="5000">5000</option>
									</select>
								</div>
							</div>
							<div class="explainDiv">
								<span class="explain">상황에 맞게 올바르게 분류해주세요. 상시 수정 가능합니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-4" id="productFiles" style="text-align: center;">
						<div>
							<img class="inputVal productImages" id="mainProductImage" 
								src="/resources/main_mypage/images/goods.png" /> 
							<label for="file"> 물품 사진을 등록해주세요. </label> 
							<input type="file" style="display: none;" id="mainFile" name="files" class="productFile" />
						</div>
						<div>
							<span>
								<img class="inputVal productImages"
									src="/resources/main_mypage/images/plusImage1.png" /> 
								<input type="file" style="display: none;" name="files" class="productFile" />
							</span>
							<span>
								<img class="inputVal productImages"
									src="/resources/main_mypage/images/plusImage1.png" /> 
								<input type="file" style="display: none;" name="files" class="productFile" />
							</span>
							<span>
								<img class="inputVal productImages"
									src="/resources/main_mypage/images/plusImage1.png" /> 
								<input type="file" style="display: none;" name="files" class="productFile" />
							</span>
						</div>
					</div>
				</div>
				<hr class="createHr">
				
				<span class="createTitle">물품 등록</span><br>
				<div class="explainDiv">
					<div class="explainDiv">
						<span class="explain">옵션 별로 물품의 상세정보를 등록해주세요.</span><br>
						<span class="explain">등록하실때 단위는 생략하시고 각각 글자와 숫자만 적어주세요.</span><br>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div id="productOpList">
	<!-- 							클론용 -->
								<div class="oneProductOp" style="display: none;">
									<div class="productStepTitle">1</div>
									<div class="oneProductInfo">
										<label for="p_option" class="productInfoLabel">물품명</label>
										<input type="text" class="form-control productInfoVal productInfoInput1 inputVal p_option"
											placeholder="예) 시원한 열무 무김치 2kg" name="p_options">
										<label for="p_price" class="productInfoLabel">원가</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_price"
											placeholder="예) 15000" name="p_prices">
										<label for="p_discount" class="productInfoLabel">할인율</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_discount"
											placeholder="예) 70" name="p_discounts">
										<label for="priceSum" class="productInfoLabel">가격</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal priceSum"
											placeholder="자동계산" name="p_sums" readonly>
										<label for="p_stock" class="productInfoLabel">재고</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_stock"
											placeholder="예) 100" name="p_stocks">
									</div>
									<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
								</div>
	<!-- 							클론용 -->
								<div class="oneProductOp">
									<div class="productStepTitle">1</div>
									<div class="oneProductInfo">
										<label for="p_option" class="productInfoLabel">물품명</label>
										<input type="text" class="form-control productInfoVal productInfoInput1 inputVal p_option"
											placeholder="예) 시원한 열무 무김치 2kg" name="p_options">
										<label for="p_price" class="productInfoLabel">원가</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_price"
											placeholder="예) 15000" name="p_prices">
										<label for="p_discount" class="productInfoLabel">할인율</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_discount"
											placeholder="예) 70" name="p_discounts">
										<label for="priceSum" class="productInfoLabel">가격</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal priceSum"
											placeholder="자동계산" name="p_sums" readonly>
										<label for="p_stock" class="productInfoLabel">재고</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_stock"
											placeholder="예) 100" name="p_stocks">
									</div>
									<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
								</div>
							</div>
							<div style="text-align: center;">
								<span class="addButton btn btn-outline-info" id="addProduct">물품추가</span> 
							</div>
						</div>
					</div>
				</div>
				<hr class="createHr">
				<div class="form-group">
					<span class="createTitle">물품 정보 사진</span><br>
					<div class="explainDiv">
						<span class="explain">물품 정보 사진을 차례에 맞게 올려주세요.</span><br>
					</div>
					<div id="productExDivList">
<!-- 						클론용 -->
						<div class="oneProductExDiv" style="display: none;">
							<div class="productStepTitle pageTitle">page1</div>
							<div class="stepImageDiv">
								<img class="inputImage stepProductImage" 
									src="/resources/main_mypage/images/plusImage3.jpg" /> 
								<input style="display: none;" type="file" class="productFile productStepFile" style="display: none;" name="files" />
							</div>
							<div class="pageExplain">물품 설명 사진을 등록해주세요.</div>
							<i class="fas fa-times-circle fa-3x stepIconX stepRemove"></i>
						</div>
<!-- 						클론용 -->
						<div class="oneProductExDiv">
							<div class="productStepTitle pageTitle">page1</div>
							<div class="stepImageDiv">
								<img class="inputImage stepProductImage" 
									src="/resources/main_mypage/images/plusImage3.jpg" /> 
								<input style="display: none;" type="file" class="productFile productStepFile" style="display: none;" name="files" />
							</div>
							<div class="pageExplain">물품 설명 사진을 등록해주세요.</div>
							<i class="fas fa-times-circle fa-3x stepIconX stepRemove"></i>
						</div>
					</div>
					<!-- 					여기 -->
					<div></div>
					<div style="text-align: center;">
						<div class="addButton btn btn-outline-info" id="addStep">상품페이지 추가</div>
					</div>
				</div>
				<hr class="createHr">
				
				<div class="form-group createCookDiv2">
					<label for="title" class="createTitle">태그</label> <input
						id="tagInput" class="form-control inputVal tagInput" type="text"
						placeholder="예) 김치, 열무김치, 물김치, 열무물김치, 얼갈이, 열무">
					<button id="tagBtn" type="button" class="btn btn-outline-primary">태그추가</button>
					<div id="tagDiv">
						<span class="oneTag" style="display: none;"> <span
							class="tagFront">#</span> <span class="tagName"></span> <i
							class="fas fa-times-circle productIconX tagRemove"></i>
						</span>
					</div>
				</div>
				<hr class="createHr">
				
				<div style="text-align: center;">
					<button type="button" id="productFormBtn"
						class="btn btn-outline-success btn-lg">저장하기</button>
					<a href="#" class="btn btn-outline-danger btn-lg">취소하기</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
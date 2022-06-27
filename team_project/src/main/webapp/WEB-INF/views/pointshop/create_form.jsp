<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.titleP {
	margin-top: 60px;
}
.createTitleSpan {
	font-size: 30px;
	font-style: italic;
}
#mainProductImage {
	margin-top: 40px;
	border: 1px solid #DFD9D8;
	width: 300px;
	height: 260px;
	cursor: pointer;
}
.productImages{
	border: 1px solid #DFD9D8;
	width: 100px;
	height: 100px;
	cursor: pointer;
}
.inputImage {
	background: #F5F5F5;
	border: 1px solid #DFD9D8;
	width: 120px;
	height: 120px;
	cursor: pointer;
}
.inputVal {
	background: #F5F5F5;
	margin-bottom: 10px;
}
.inputVal:focus {
	background: #F5F5F5;
}
.createHr {
	margin-top: 30px;
	margin-bottom: 30px
}
.explainDiv {
	margin-top:5px;
	margin-bottom: 15px;
}
.explain {
	color: #AFACAC;
	font-size: 13px;
	padding-left: 10px;
}
.createTitle {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}
.productInfoLabel{
	font-size: 16px;
	margin-left: 20px;
}
.productInfoInput1{
	display: inline-block;
	width: 250px;
	margin-left: 5px;
}
.productInfoInput2{
	display: inline-block;
	width: 110px;
	margin-left: 10px;
}
.oneProductInfo{
	display: inline-block;
	border: 2px solid #DFD9D8;
	padding-top: 10px;
    border-radius: 10px;
    margin-left: 15px;
    margin-top: 10px;
    margin-bottom: 5px;
    width: 90%;
}
#productOpList{
	margin: 0px 20px;
	margin-bottom: 20px;
}
#productExDivList{
	margin-bottom: 20px;
	text-align: center;
}
.oneProductExDiv{
	width: 1050px;
	margin-left: 90px;
	margin-bottom: 15px;
	border: 2px solid #DFD9D8;
    border-radius: 10px;
    padding: 0px 10px;
    padding-bottom: 10px;
}
.productExDivSet{
	margin-top: 30px;
}
.productStepTitle{
	display: inline-block;
	color: #F83801;
	font-size: 25px;
	margin-left: -8px;
	font-style: italic;
	margin-left: 5px;
}
.pageTitle{
	margin-left: -860px;
    font-size: 50px;
    position: relative;
}
.pageExplain{
	font-size: 17px;
	margin: 7px 0px;
}
.stepProductImage{
	width: 500px;
	height: 500px;
}
#addStep{
	margin-left: 140px;
}
.inputImage{
	margin: 10px;
}
.productIconX, .tagRemove{
	position: relative;
    top: 6px;
    left: 6px;
    cursor: pointer;
}
.stepRemove{
    float: right;
    position: relative;
    left: 70px;
    bottom: 45px;
    cursor: pointer;
}
#tagDiv {
	margin-left: 20px;
}
.oneTag {
	margin-right: 20px;
}
.tagFront {
	font-size: 22px;
	color: #F83801;
}
.tagName {
	font-size: 17px;
}
#tagBtn {
	margin-left: 10px;
}
.tagInput {
	display: inline;
	width: 40%;
	margin-left: 10px;
}
</style>
<script>
$(function() {
	// 	물품추가
	var productIndex = 2;
	$("#addProduct").click(function() {
		var cloneProductOpDiv = $(".oneProductOp").eq(0).clone();
		cloneProductOpDiv.show();
		cloneProductOpDiv.find(".productStepTitle").text(productIndex++);
		$("#productOpList").append(cloneProductOpDiv);
	});

	//물품 삭제
	$("#productOpList").on("click", ".productRemove", function() {
		$(this).parent().remove();
		productIndex = 1;
		var productTitles = $("#productOpList").find(".productStepTitle");
		for(var i = 1; i < productTitles.length; i++) {
			$(productTitles).eq(i).text(productIndex++);
		}
	});

	// 	물품설명스텝셋트로추가
	var stepIndex = 2;
	$("#addStep").click(function() {
		var cloneOneProductExDivDiv = $(".oneProductExDiv").eq(0).clone();
		cloneOneProductExDivDiv.show();
		var stepText = "page" + stepIndex++;
		cloneOneProductExDivDiv.find("div.productStepTitle").text(stepText);
		$("#productExDivList").append(cloneOneProductExDivDiv);
	});

	//  요리스텝삭제
	$("#productExDivList").on("click", ".stepRemove", function() {
		stepIndex = 1;
		$(this).parent().remove();
		var stepTitles = $("#productExDivList").find(".productStepTitle");
		for(var i = 1; i < stepTitles.length; i++) {
			var stepText = "page" + stepIndex++;
			$(stepTitles).eq(i).text(stepText);
		}
	});

	// 	물품사진넣기
	$(".productImages").click(function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
	});
	$("#productFiles").on("change", ".productFile", function() {
		if (this.files && this.files[0]) {
			var inputImg = $(this).parent().find("img");
			var reader = new FileReader();
			reader.onload = function(e) {
				console.log("사진파일누름2");
				console.log(inputImg);
				inputImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	// 	물품정보사진넣기
	$("#productExDivList").on("click", ".stepProductImage", function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
	});
	$("#productExDivList").on("change", ".productStepFile", function() {
		var inputImg = $(this).parent().find("img");
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				inputImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	
	//원가/할인율 자동계산
	$("#productOpList").on("change", ".p_discount", function() {
		var infoDiv = $(this).parent();
		var p_price = $(infoDiv).find(".p_price").val();
		var p_discount = 100 - $(this).val();
		
		var priceSum = $(infoDiv).find(".priceSum");
		if((p_price != null && p_price != "" )&&
				(p_discount != null && p_discount != "" )){
			var sum = Math.floor(p_price * (p_discount / 100));
			priceSum.val(sum);
		}
	});
	//원가/할인율 자동계산
	$("#productOpList").on("change", ".p_price", function() {
		var infoDiv = $(this).parent();
		var p_price = $(this).val();
		var p_discount = $(infoDiv).find(".p_discount").val();
		
		var priceSum = $(infoDiv).find(".priceSum");
		if((p_price != null && p_price != "" )&&
				(p_discount != null && p_discount != "" )){
			var sum = Math.floor(p_price * (p_discount / 100));
			priceSum.val(sum);
		}
	});
	
	//태그 넣기
	$("#tagBtn").click(function() {
		var tag = $("#tagInput").val();
		var tagSpan = $(".oneTag").eq(0).clone();
		tagSpan.show();
		tagSpan.find("span.tagName").text(tag);
		$("#tagDiv").append(tagSpan);
		$("#tagInput").val("");
	});

	//태그 삭제
	$(".createCookDiv2").on("click", ".tagRemove", function() {
		$(this).parent().remove();
	});

	//태그 히든으로 보내고 폼전송
	$("#productFormBtn").click(function() {
		inputCheck();
		if (productState) {
			var tags = $(".tagName");
			for (var i = 1; i < tags.length; i++) {
				var tag = $(".tagName").eq(i).text();
				console.log(tag);
				var tagHtml = "<input type='hidden' name='p_tags' value=" + tag + ">";
				$("#pointShopForm").prepend(tagHtml);
			}
			//클론input삭제
			$(".oneProductOp").eq(0).remove();
			$(".productExDivSet").eq(0).remove();
			$("#pointShopForm").submit();
		}
	});
	//빈값체크
	var productState = false;
	function inputCheck() {
		var p_title = $("#p_title").val();
		var p_name = $("#p_name").val();
		var p_explain = $("#p_explain").val();
		var sellstate = $("#sellstate").val();
		var purchaseplace = $("#purchaseplace").val();
		var deliverycharge = $("#deliverycharge").val();
		var productImage = $(".productFile").eq(0).val();
		var productStepFile = $(".productStepFile").eq(4).val();
		var productInfos = $(".oneProductInfo");
		var p_options = $(".p_option");
		var p_prices = $(".p_price");
		var p_discounts = $(".p_discount");
		var p_stocks = $(".p_stock");

		if (p_title == "") {
			alert("물품 제목이 비어 있습니다.");
		} else if (p_name == "") {
			alert("물품 종류가 비어 있습니다.");
		} else if (p_explain == "") {
			alert("물품 소개가 비어 있습니다.");
		} else if (sellstate == "") {
			alert("판매현황을 선택해주세요.");
		} else if (purchaseplace == "") {
			alert("매입처를 선택해주세요.");
		} else if (deliverycharge == "") {
			alert("배송비를 선택해주세요.");
		} else if (productImage == "") {
			alert("물품 사진을 최소 하나 이상 올리셔야합니다.");
		} else if (productStepFile == "") {
			alert("물품 설명 사진을 최소 하나 이상 올리셔야합니다.");
		} else if (productInfos.length <= 1) {
			alert("물품을 최소 하나 이상 올리셔야합니다..");
		} else if (productInfos.length > 1) {
			for (var i = 1; i < productInfos.length; i++) {
				var p_option = $(p_options[i]).val();
				var p_price = $(p_prices[i]).val();
				var p_discount = $(p_discounts[i]).val();
				var p_stock = $(p_stocks[i]).val();
				if (p_option == "" || p_price == "" || p_discount == "" || p_stock == "") {
					alert(i + "번째 물품 내용이 비어 있습니다.");
					productState = false;
					break;
				} else {
					if(p_price > 0 && (0 <= p_discount && p_discount <= 100)){
						productState = true;
					}else{
						alert(i + "번째 가격과 할인율을 제대로 적어주세요.");
						productState = false;
						break;
					}
				}
			}
		}
	}

});
</script>
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
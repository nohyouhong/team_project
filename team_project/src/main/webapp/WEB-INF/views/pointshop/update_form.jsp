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
.tagRemove, .ingredIconX {
	cursor: pointer;
}
</style>
<script>
$(function() {
	// 	????????????
	var productIndex = $(".oneProductOp").length;
	$("#addProduct").click(function() {
		var cloneProductOpDiv = $(".oneProductOp").eq(0).clone();
		cloneProductOpDiv.show();
		cloneProductOpDiv.find(".productStepTitle").text(productIndex++);
		$("#productOpList").append(cloneProductOpDiv);
	});

	//?????? ??????
	$("#productOpList").on("click", ".productRemove", function() {
		$(this).parent().remove();
		productIndex = 1;
		var productTitles = $("#productOpList").find(".productStepTitle");
		for(var i = 1; i < productTitles.length; i++) {
			$(productTitles).eq(i).text(productIndex++);
		}
	});

	// 	?????????????????????????????????
	var stepIndex = $(".oneProductExDiv").length;
	$("#addStep").click(function() {
		var cloneOneProductExDivDiv = $(".oneProductExDiv").eq(0).clone();
		cloneOneProductExDivDiv.show();
		var stepText = "page" + stepIndex++;
		cloneOneProductExDivDiv.find("div.productStepTitle").text(stepText);
		$("#productExDivList").append(cloneOneProductExDivDiv);
	});

	//  ??????????????????
	$("#productExDivList").on("click", ".stepRemove", function() {
		stepIndex = 1;
		$(this).parent().remove();
		var stepTitles = $("#productExDivList").find(".productStepTitle");
		for(var i = 1; i < stepTitles.length; i++) {
			var stepText = "page" + stepIndex++;
			$(stepTitles).eq(i).text(stepText);
		}
	});

	// 	??????????????????
	$(".productImages").click(function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
	});
	$("#productFiles").on("change", ".productFile", function() {
		if (this.files && this.files[0]) {
			var inputImg = $(this).parent().find("img");
			var reader = new FileReader();
			reader.onload = function(e) {
				console.log("??????????????????2");
				console.log(inputImg);
				inputImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	// 	????????????????????????
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
	
	//??????/????????? ????????????
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
	//??????/????????? ????????????
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
	
	//?????? ??????
	$("#tagBtn").click(function() {
		var tag = $("#tagInput").val();
		var tagSpan = $(".oneTag").eq(0).clone();
		tagSpan.show();
		tagSpan.find("span.tagName").text(tag);
		$("#tagDiv").append(tagSpan);
		$("#tagInput").val("");
	});

	//?????? ??????
	$(".createCookDiv2").on("click", ".tagRemove", function() {
		$(this).parent().remove();
	});

	//?????? ???????????? ????????? ?????????
	$("#productFormBtn").click(function() {
		inputCheck();
		if (productState) {
			var proFiles = $(".proPicFilename");
			for(var i = 0; i < proFiles.length; i++){
				var proFile = $(proFiles).eq(i).text();
				var html = "<input type='hidden' name='p_pictures' value=" + proFile + ">";
				$("#pointShopForm").append(html);
			}
			var proExFiles = $(".proExPicFilename");
			for(var i = 0; i < proExFiles.length; i++){
				var proExFile = $(proExFiles).eq(i).text();
				var html = "<input type='hidden' name='p_exPictures' value=" + proExFile + ">";
				$("#pointShopForm").append(html);
			}
			
			var tags = $(".tagName");
			for (var i = 1; i < tags.length; i++) {
				var tag = $(".tagName").eq(i).text();
				console.log(tag);
				var tagHtml = "<input type='hidden' name='p_tags' value=" + tag + ">";
				$("#pointShopForm").append(tagHtml);
			}
			//??????input??????
			$(".oneProductOp").eq(0).remove();
			$(".productExDivSet").eq(0).remove();
			$("#pointShopForm").submit();
		}
	});
	//????????????
	var productState = false;
	function inputCheck() {
		var p_title = $("#p_title").val();
		var p_name = $("#p_name").val();
		var p_explain = $("#p_explain").val();
		var sellstate = $("#sellstate").val();
		var purchaseplace = $("#purchaseplace").val();
		var deliverycharge = $("#deliverycharge").val();
		var productImage = $(".productImages").eq(0).attr("src");
		var productStepFile = $(".stepProductImage").eq(1).attr("src");
		
		var productInfos = $(".oneProductInfo");
		var p_options = $(".p_option");
		var p_prices = $(".p_price");
		var p_discounts = $(".p_discount");
		var p_stocks = $(".p_stock");

		if (p_title == "") {
			alert("?????? ????????? ?????? ????????????.");
		} else if (p_name == "") {
			alert("?????? ????????? ?????? ????????????.");
		} else if (p_explain == "") {
			alert("?????? ????????? ?????? ????????????.");
		} else if (sellstate == "") {
			alert("??????????????? ??????????????????.");
		} else if (purchaseplace == "") {
			alert("???????????? ??????????????????.");
		} else if (deliverycharge == "") {
			alert("???????????? ??????????????????.");
		} else if (productImage == "/resources/main_mypage/images/goods.png") {
			alert("?????? ????????? ?????? ?????? ?????? ?????????????????????.");
		} else if (productStepFile == "/resources/main_mypage/images/plusImage3.jpg") {
			alert("?????? ?????? ????????? ?????? ?????? ?????? ?????????????????????.");
		} else if (productInfos.length <= 1) {
			alert("????????? ?????? ?????? ?????? ?????????????????????.");
		} else if (productInfos.length > 1) {
			for (var i = 1; i < productInfos.length; i++) {
				var p_option = $(p_options[i]).val();
				var p_price = $(p_prices[i]).val();
				var p_discount = $(p_discounts[i]).val();
				var p_stock = $(p_stocks[i]).val();
				if (p_option == "" || p_price == "" || p_discount == "" || p_stock == "") {
					alert(i + "?????? ?????? ????????? ?????? ????????????.");
					productState = false;
					break;
				} else {
					if(p_price > 0 && (0 <= p_discount && p_discount <= 100)){
						productState = true;
					}else{
						alert(i + "?????? ????????? ???????????? ????????? ???????????????.");
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
			<span class="createTitleSpan">??????????????? ??????</span>
			<hr class="createHr">
			<form role="form" id="pointShopForm" action="/pointshop/updateRun"
				method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginVo.userid }">
			<input type="hidden" name="p_bno" value="${pointShopBoardVo.p_bno }">
			<c:if test="${not empty productList[0]}">
				<input type="hidden" name="pno" value="${productList[0].pno}">
			</c:if>
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
						
							<label for="p_title" class="createTitle">?????? ??????</label> 
							<input type="text" class="form-control inputVal" id="p_title"
								name="p_title" value="${pointShopBoardVo.p_title }" placeholder="???) [????????????] ????????? ?????? ????????? 2kg / 5kg" />
						</div>
						<div class="form-group">
							<label for="p_name" class="createTitle">?????? ??????</label> 
							<input type="text" class="form-control inputVal" id="p_name"
								name="p_name" value="${pointShopBoardVo.p_name }" placeholder="???) ?????? ?????? ??? ?????? ?????? ?????????" />
						</div>
						<div class="form-group">
							<label for="p_explain" class="createTitle">?????? ??????</label>
							<textarea rows="4" class="form-control inputVal" id="p_explain"
								name="p_explain" 
								placeholder="????????? ????????? ??????????????????. ???) ?????? ?????? ???????????? ????????? ?????? ?????????">${pointShopBoardVo.p_explain }</textarea>
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">????????????</label>
							<div class="row">
								<div class="col">
									<select class="custom-select inputVal" id="sellstate"
										name="sellstate">
										<option selected value="">????????????</option>
										<option value="????????????"
										<c:if test="${pointShopBoardVo.sellstate == '????????????' }">selected</c:if>
										>????????????</option>
										<option value="?????????"
										<c:if test="${pointShopBoardVo.sellstate == '?????????' }">selected</c:if>
										>?????????</option>
										<option value="????????????"
										<c:if test="${pointShopBoardVo.sellstate == '????????????' }">selected</c:if>
										>????????????</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="purchaseplace"
										name="purchaseplace">
										<option selected value="">?????????</option>
										<option value="??????"
										<c:if test="${pointShopBoardVo.purchaseplace == '??????' }">selected</c:if>
										>??????</option>
										<option value="??????"
										<c:if test="${pointShopBoardVo.purchaseplace == '??????' }">selected</c:if>
										>??????</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="deliverycharge"
										name="deliverycharge">
										<option selected value="">?????????</option>
										<option value="0"
										<c:if test="${pointShopBoardVo.deliverycharge == '0' }">selected</c:if>
										>????????????</option>
										<option value="3000"
										<c:if test="${pointShopBoardVo.deliverycharge == '3000' }">selected</c:if>
										>3000</option>
										<option value="5000"
										<c:if test="${pointShopBoardVo.deliverycharge == '5000' }">selected</c:if>
										>5000</option>
									</select>
								</div>
							</div>
							<div class="explainDiv">
								<span class="explain">????????? ?????? ???????????? ??????????????????. ?????? ?????? ???????????????.</span>
							</div>
						</div>
					</div>
					<div class="col-md-4" id="productFiles" style="text-align: center;">
						<div>
							<img class="inputVal productImages" id="mainProductImage" 
								<c:choose>
									<c:when test="${not empty productPicList[0] }">
										src="/pointshop/displayImage?filename=${productPicList[0] }" 
									</c:when>
									<c:otherwise>
										src="/resources/main_mypage/images/goods.png" 
									</c:otherwise>
								</c:choose>
							/> 
							<label for="file"> ?????? ????????? ??????????????????. </label> 
							<input type="file" style="display: none;" id="mainFile" name="files" class="productFile" />
							<c:if test="${not empty productPicList[0]}">
								<div style="display:none;" class="proPicFilename">${productPicList[0] }</div>
							</c:if>
						</div>
						<div>
							<span>
								<img class="inputVal productImages"
									<c:choose>
										<c:when test="${not empty productPicList[1] }">
											src="/pointshop/displayImage?filename=${productPicList[1] }" 
										</c:when>
										<c:otherwise>
											src="/resources/main_mypage/images/plusImage1.png" 
										</c:otherwise>
									</c:choose>
								/> 
								<input type="file" style="display: none;" name="files" class="productFile"/>
								<c:if test="${not empty productPicList[1]}">
									<div style="display:none;" class="proPicFilename">${productPicList[1] }</div>
								</c:if>
							</span>
							<span>
								<img class="inputVal productImages"
									<c:choose>
										<c:when test="${not empty productPicList[2] }">
											src="/pointshop/displayImage?filename=${productPicList[2] }" 
										</c:when>
										<c:otherwise>
											src="/resources/main_mypage/images/plusImage1.png" 
										</c:otherwise>
									</c:choose>
								/> 
								<input type="file" style="display: none;" name="files" class="productFile"/>
								<c:if test="${not empty productPicList[2]}">
									<div style="display:none;" class="proPicFilename">${productPicList[2] }</div>
								</c:if>
							</span>
							<span>
								<img class="inputVal productImages"
									<c:choose>
										<c:when test="${not empty productPicList[3] }">
											src="/pointshop/displayImage?filename=${productPicList[3] }" 
										</c:when>
										<c:otherwise>
											src="/resources/main_mypage/images/plusImage1.png" 
										</c:otherwise>
									</c:choose>
								/> 
								<input type="file" style="display: none;" name="files" class="productFile"/>
								<c:if test="${not empty productPicList[3]}">
									<div style="display:none;" class="proPicFilename">${productPicList[3] }</div>
								</c:if>
							</span>
						</div>
					</div>
				</div>
				<hr class="createHr">
				
				<span class="createTitle">?????? ??????</span><br>
				<div class="explainDiv">
					<div class="explainDiv">
						<span class="explain">?????? ?????? ????????? ??????????????? ??????????????????.</span><br>
						<span class="explain">??????????????? ????????? ??????????????? ?????? ????????? ????????? ???????????????.</span><br>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div id="productOpList">
	<!-- 							????????? -->
								<div class="oneProductOp" style="display: none;">
									<div class="productStepTitle">1</div>
									<div class="oneProductInfo">
										<input type="hidden" name="p_inos" value="0">
										<label for="p_option" class="productInfoLabel">?????????</label>
										<input type="text" class="form-control productInfoVal productInfoInput1 inputVal p_option"
											placeholder="???) ????????? ?????? ????????? 2kg" name="p_options">
										<label for="p_price" class="productInfoLabel">??????</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_price"
											placeholder="???) 15000" name="p_prices">
										<label for="p_discount" class="productInfoLabel">?????????</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_discount"
											placeholder="???) 70" name="p_discounts">
										<label for="priceSum" class="productInfoLabel">??????</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal priceSum"
											placeholder="????????????" name="p_sums" readonly>
										<label for="p_stock" class="productInfoLabel">??????</label>
										<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_stock"
											placeholder="???) 100" name="p_stocks">
									</div>
									<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
								</div>
	<!-- 							????????? -->
								<c:forEach items="${productList}" var="productVo" varStatus="status">
									<div class="oneProductOp">
										<div class="productStepTitle">${status.index + 1}</div>
										<div class="oneProductInfo">
											<input type="hidden" name="p_inos" value="${productVo.p_ino }">
											<label for="p_option" class="productInfoLabel">?????????</label>
											<input type="text" class="form-control productInfoVal productInfoInput1 inputVal p_option"
												placeholder="???) ????????? ?????? ????????? 2kg" name="p_options" value="${productVo.p_option}">
											<label for="p_price" class="productInfoLabel">??????</label>
											<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_price"
												placeholder="???) 15000" name="p_prices" value="${productVo.p_price}">
											<label for="p_discount" class="productInfoLabel">?????????</label>
											<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_discount"
												placeholder="???) 70" name="p_discounts" value="${productVo.p_discount}">
											<label for="priceSum" class="productInfoLabel">??????</label>
											<input type="number" class="form-control productInfoVal productInfoInput2 inputVal priceSum"
												placeholder="????????????" name="p_sums"  value="${productVo.p_sum}" readonly>
											<label for="p_stock" class="productInfoLabel">??????</label>
											<input type="number" class="form-control productInfoVal productInfoInput2 inputVal p_stock"
												placeholder="???) 100" name="p_stocks"  value="${productVo.p_stock}">
										</div>
										<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
									</div>
								</c:forEach>
							</div>
							<div style="text-align: center;">
								<span class="addButton btn btn-outline-info" id="addProduct">????????????</span> 
							</div>
						</div>
					</div>
				</div>
				<hr class="createHr">
				<div class="form-group">
					<span class="createTitle">?????? ?????? ??????</span><br>
					<div class="explainDiv">
						<span class="explain">?????? ?????? ????????? ????????? ?????? ???????????????.</span><br>
					</div>
					<div id="productExDivList">
<!-- 						????????? -->
						<div class="oneProductExDiv" style="display: none;">
							<div class="productStepTitle pageTitle">page1</div>
							<div class="stepImageDiv">
								<img class="inputImage stepProductImage" 
									src="/resources/main_mypage/images/plusImage3.jpg" /> 
								<input style="display: none;" type="file" class="productFile productStepFile" style="display: none;" name="files" />
								<div style="display:none;" class="proExPicFilename">${productExPic}</div>
							</div>
							<div class="pageExplain">?????? ?????? ????????? ??????????????????.</div>
							<i class="fas fa-times-circle fa-3x stepIconX stepRemove"></i>
						</div>
<!-- 						????????? -->
						<c:forEach items="${productExPicList}" var="productExPic" varStatus="status">
							<div class="oneProductExDiv">
								<div class="productStepTitle pageTitle">page${status.index + 1 }</div>
								<div class="stepImageDiv">
									<img class="inputImage stepProductImage" 
										<c:choose>
											<c:when test="${not empty productExPic }">
												src="/pointshop/displayImage?filename=${productExPic}" 
											</c:when>
											<c:otherwise>
												src="/resources/main_mypage/images/plusImage3.jpg" 
											</c:otherwise>
										</c:choose>
									/> 
									<input style="display: none;" type="file" class="productFile productStepFile" value="" style="display: none;" name="files" />
									<div style="display:none;" class="proExPicFilename">${productExPic}</div>
								</div>
								<div class="pageExplain" style="visibility: hidden;">?????? ?????? ????????? ??????????????????.</div>
								<i class="fas fa-times-circle fa-3x stepIconX stepRemove"></i>
							</div>
						</c:forEach>
					</div>
					<!-- 					?????? -->
					<div></div>
					<div style="text-align: center;">
						<div class="addButton btn btn-outline-info" id="addStep">??????????????? ??????</div>
					</div>
				</div>
				<hr class="createHr">
				
				<div class="form-group createCookDiv2">
					<label for="title" class="createTitle">??????</label> <input
						id="tagInput" class="form-control inputVal tagInput" type="text"
						placeholder="???) ??????, ????????????, ?????????, ???????????????, ?????????, ??????">
					<button id="tagBtn" type="button" class="btn btn-outline-primary">????????????</button>
					<div id="tagDiv">
						<span class="oneTag" style="display: none;"> <span
							class="tagFront">#</span> <span class="tagName"></span> <i
							class="fas fa-times-circle productIconX tagRemove"></i>
						</span>
						<c:forEach items="${tagList}" var="oneTag">
							<span class="oneTag" > 
								<span class="tagFront">#</span> 
								<span class="tagName">${oneTag }</span> 
								<i class="fas fa-times-circle ingredIconX tagRemove"></i>
							</span>
						</c:forEach>
					</div>
				</div>
				<hr class="createHr">
				
				<div style="text-align: center;">
					<button type="button" id="productFormBtn"
						class="btn btn-outline-success btn-lg">????????????</button>
					<a href="/pointshop/list" class="btn btn-outline-danger btn-lg">????????????</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
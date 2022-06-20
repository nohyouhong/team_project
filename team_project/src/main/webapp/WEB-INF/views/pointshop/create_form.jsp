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
	width: 250px;
	height: 250px;
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
#addIngredList {
	margin-bottom: 20px;
}
.createHr {
	margin-top: 30px;
	margin-bottom: 30px
}
.explainDiv {
	margin-bottom: 20px;
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
.cookStepTitle {
	color: #F83801;
	font-size: 35px;
	
/* 	margin-left: 20px; */
}

.productInfoLabel{
	font-size: 16px;
	margin-left: 20px;
}
.productInfoInput1{
	display: inline-block;
	width: 300px;
	margin-left: 5px;
}
.productInfoInput2{
	display: inline-block;
	width: 150px;
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
.addIngredDiv{
	margin: 20px 30px;
}
.productStepTitle{
	display: inline-block;
	color: #F83801;
	font-size: 25px;
	margin-left: -8px;
	font-style: italic;
	margin-left: 5px;
}
.stepCookImage{
	width: 230px;
	height: 350px;
}
#productExDivList{
	margin-bottom: 20px;
/* 	position: relative; */
/*     left: 10px; */
}
.oneProductExDiv{
	display: inline-block;
	margin-left: 10px;
	margin-right: 10px;
	border: 2px solid #DFD9D8;
    border-radius: 10px;
    padding: 0px 10px;
    padding-bottom: 10px;
}
.inputImage{
	margin: 10px;
}
.productIconX{
	position: relative;
    top: 6px;
    left: 6px;
}
.stepRemove{
	position: relative;
    top: 170px;
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

.tagRemove, .ingredIconX {
	cursor: pointer;
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

</script>
<div class="container-fluid">
	<div class="row titleP">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<span class="createTitleSpan">포인트물품 등록</span>
			<hr class="createHr">
			<form role="form" id="recipeForm" action="/recipeboard/createRun"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="r_title" class="createTitle">물품 제목</label> 
							<input type="text" class="form-control inputVal" id="r_title"
								name="r_title" placeholder="예)김치찌개 끓이기" />
						</div>
						<div class="form-group">
							<label for="r_title" class="createTitle">물품 종류</label> 
							<input type="text" class="form-control inputVal" id="r_title"
								name="r_title" placeholder="예)김치찌개 끓이기" />
						</div>
						<div class="form-group">
							<label for="r_explain" class="createTitle">물품 소개</label>
							<textarea rows="4" class="form-control inputVal" id="r_explain"
								name="r_explain"
								placeholder="레시피의 탄생배경을 적어주세요. 예) 어머니의 된장국이 생각이나  남편과 같이 고안해보았습니다."></textarea>
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">카테고리</label>
							<div class="row">
								<div class="col">
									<select class="custom-select inputVal" id="f_code"
										name="f_code">
										<option selected value="">판매현황</option>
										<option value="1001">판매중지</option>
										<option value="1002">판매중</option>
										<option value="1003">판매예정</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="r_level"
										name="r_level">
										<option selected value="">매입처</option>
										<option value="쉬움">자사</option>
										<option value="보통">자사아님</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="r_time"
										name="r_time">
										<option selected value="">배송비</option>
										<option value="5분이내">무료배송</option>
										<option value="30분이내">3000</option>
										<option value="1시간이내">5000</option>
										<option value="1시간이상">직접입력</option>
									</select>
								</div>
							</div>
							<div class="explainDiv">
								<span class="explain">상황에 맞게 올바르게 분류해주세요. 상시 수정 가능합니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-4" style="text-align: center;">
						<div>
							<img class="inputVal" id="mainProductImage" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/cook.png" /> 
							<label for="file"> 대표 요리사진을 등록해주세요. </label> 
							<input type="file" style="display: none;" id="mainFile" name="file" class="cookFile" />
						</div>
						<div>
							<img class="inputVal productImages" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/cook.png" /> 
							<input type="file" style="display: none;" id="mainFile" name="file" class="cookFile" />
							<img class="inputVal productImages" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/cook.png" /> 
							<input type="file" style="display: none;" id="mainFile" name="file" class="cookFile" />
							<img class="inputVal productImages" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/cook.png" /> 
							<input type="file" style="display: none;" id="mainFile" name="file" class="cookFile" />
							
						</div>
					</div>
				</div>
				<hr class="createHr">
				
				<span class="createTitle">물품 등록</span><br>
				<div class="explainDiv">
					<span class="explain">옵션 별로 물풀을 각각 등록해주세요.</span><br>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="productOpList">
							<div class="oneProductOp">
								<div class="productStepTitle">1</div>
								<div class="oneProductInfo">
									<label for="r_title" class="productInfoLabel">물품명</label>
									<input type="text" class="form-control productInfoInput1 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">가격</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">할인율</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">재고</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
								</div>
								<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
							</div>
							
							<div class="oneProductOp">
								<div class="productStepTitle">2</div>
								<div class="oneProductInfo">
									<label for="r_title" class="productInfoLabel">물품명</label>
									<input type="text" class="form-control productInfoInput1 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">가격</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">할인율</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">재고</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
								</div>
								<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
							</div>
							
							<div class="oneProductOp">
								<div class="productStepTitle">3</div>
								<div class="oneProductInfo">
									<label for="r_title" class="productInfoLabel">물품명</label>
									<input type="text" class="form-control productInfoInput1 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">가격</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">할인율</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
									<label for="r_title" class="productInfoLabel">재고</label>
									<input type="text" class="form-control productInfoInput2 inputVal"
										placeholder="예)소고기" name="i_names">
								</div>
								<i class="fas fa-times-circle fa-2x productIconX productRemove"></i>
							</div>
							
							
							
						</div>
						<div style="text-align: center;">
							<span class="addButton btn btn-outline-info" id="addIngred">물품추가</span> 
						</div>
					</div>
				</div>
				
				<hr class="createHr">
				<div class="form-group createCookDiv">
					<span class="createTitle">물품설명 파일</span><br>
					<div class="explainDiv">
						<span class="explain">요리하는 스텝마다 빠지면안될 중요한 부분을 입력해주세요.</span><br>
					</div>
					<div id="productExDivList">
						<div class="ProductExDivSet">
							<div class="oneProductExDiv">
								<div class="productStepTitle">step1</div>
								<div class="stepImageDiv">
									<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
										src="/resources/main_mypage/images/plus.png" /> 
									<input type="file" class="cookFile cookStepFile" style="display: none;" name="files" />
								</div>
							</div>
							<div class="oneProductExDiv">
								<div class="productStepTitle">step2</div>
								<div class="stepImageDiv">
									<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
										src="/resources/main_mypage/images/plus.png" /> 
									<input style="display: none;" type="file" class="cookFile cookStepFile" name="files" /> 
								</div>
							</div>
							<div class="oneProductExDiv">
								<div class="productStepTitle">step3</div>
								<div class="stepImageDiv">
									<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
										src="/resources/main_mypage/images/plus.png" /> 
									<input style="display: none;" type="file" class="cookFile cookStepFile" name="files" /> 
								</div>
							</div>
							<div class="oneProductExDiv">
								<div class="productStepTitle">step4</div>
								<div class="stepImageDiv">
									<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
										src="/resources/main_mypage/images/plus.png" /> 
									<input style="display: none;" type="file" class="cookFile cookStepFile" name="files" /> 
								</div>
							</div>
							<i class="fas fa-times-circle fa-2x stepIconX stepRemove"></i>
						</div>
					</div>
					<!-- 					여기 -->
					<div style="text-align: center;">
						<span class="addButton btn btn-outline-info" id="addStep">순서
							추가</span>
					</div>
				</div>
				<hr class="createHr">
				
				<div class="form-group createCookDiv2">
					<label for="title" class="createTitle">태그</label> <input
						id="tagInput" class="form-control inputVal tagInput" type="text"
						placeholder="예)주재료, 목적, 효능, 대상 등 태그로 남겨주세요.">
					<button id="tagBtn" type="button" class="btn btn-outline-primary">태그추가</button>
					<div id="tagDiv">
						<span class="oneTag" style="display: none;"> <span
							class="tagFront">#</span> <span class="tagName"></span> <i
							class="fas fa-times-circle ingredIconX tagRemove"></i>
						</span>
					</div>
				</div>
				<hr class="createHr">
				
				<div style="text-align: center;">
					<button type="button" id="recipeFormBtn"
						class="btn btn-outline-success btn-lg">저장하기</button>
					<a href="#" class="btn btn-outline-danger btn-lg">취소하기</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/main_header.jsp"%>
<link rel="stylesheet" href="/resources/recipe/recipe_create.css" type="text/css">
<script src="/resources/recipe/recipe_create.js" ></script>

<!-- 모달 -->
<a id="modal-520057" style="display: none;" href="#modal-container-520057" role="button"
	class="btn" data-toggle="modal">Launch demo modal</a>
<div class="modal fade" id="modal-container-520057" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">재료 등록</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="ingredInsertForm" action="/recipeboard/ingredInfoCreate" method="post">
					<label class="modalLabel" for="i_name">재료이름</label>
					<input type="text" class="modalInput form-control" id="i_name" name="i_name" placeholder="재료의 이름를 입력하세요. 예) 달걀, 참기름"><br>
					<label class="modalLabel" for="i_unit">재료단위</label>
					<input type="text" class="modalInput form-control" id="i_unit" name="i_unit" placeholder="재료의 단위를 입력하세요. 예) g, 개"><br>
					<input style="display: none;" type="text" class="modalInput form-control" id="i_address" name="i_address">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="ingredInsertBtn" class="btn btn-outline-primary">등록하기
				</button>
				<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">
					닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 -->
<div class="container-fluid">
	<div class="row titleP">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<span class="createTitleSpan">레시피 등록</span>
			<hr class="createHr">
			<form role="form" id="recipeForm" action="/recipeboard/createRun"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="r_title" class="createTitle">요리 제목</label> <input
								type="text" class="form-control inputVal" id="r_title"
								name="r_title" placeholder="예)김치찌개 끓이기" />
						</div>
						<div class="form-group">
							<label for="r_explain" class="createTitle">요리 소개</label>
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
										<option selected value="">종류별</option>
										<option value="1001">한식</option>
										<option value="1002">중식</option>
										<option value="1003">양식</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="r_time"
										name="r_time">
										<option selected value="">종류별</option>
										<option value="5분이내">5분이내</option>
										<option value="30분이내">30분이내</option>
										<option value="1시간이내">1시간이내</option>
										<option value="1시간이상">1시간이상</option>
									</select>
								</div>
								<div class="col">
									<select class="custom-select inputVal" id="r_level"
										name="r_level">
										<option selected value="">종류별</option>
										<option value="쉬움">쉬움</option>
										<option value="보통">보통</option>
										<option value="어려움">어려움</option>
									</select>
								</div>
							</div>
							<div class="explainDiv">
								<span class="explain">올바르게 분류하시면, 검색할때 쉽게 찾아볼수 있습니다.</span>
							</div>
						</div>
					</div>
					<div class="col-md-4" style="text-align: center;">
						<img class="inputVal" id="mainCookImage" alt="요리사진을 등록해주세요."
							src="/resources/main_mypage/images/cook.png" /> <label
							for="file"> 대표 요리사진을 등록해주세요. </label> <input type="file"
							id="mainFile" name="file" class="cookFile" />
					</div>
				</div>
				<hr class="createHr">
				<div class="explainDiv">
					<span class="explain">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
				</div>
				<div class="row">
					<div class="col-md-3">
						<input type="text" class="form-control" value="재료"
							style="background: #FFFECC" readonly/>
					</div>
					<div class="col-md-8">
						<div id="addIngredList">
							<!-- 						클론용 -->
							<div class="addIngredDiv" style="display: none;">
								<div class="oneIngred">
									<i class="fa-solid fa-pen-to-square fa-lg"></i>
									<label for="i_names" class="ingredLabel">이름</label>
									<input type="text" id="i_names" class="form-control inputVal ingredName"
										placeholder="예) 소고기" name="i_names"> 
									<label for="i_amounts" class="ingredLabel">갯수</label>
									<input type="text" id="i_amounts" class="form-control inputVal ingredAmount"
										placeholder="예) 1/4, 1(단위는 제외)" name="i_amounts"> 
									<label for="i_units" class="ingredLabel">단위</label>
									<input type="text" id="i_units" class="form-control inputVal ingredUnit"
										placeholder="재료단위(자동입력)" readonly>
									<i class="fas fa-times-circle fa-lg ingredIconX ingredRemove"></i><br>
								</div>
								<div class="checkIngred"></div>
							</div>
							<!-- 						클론용 -->
							<div class="addIngredDiv">
								<div class="oneIngred">
									<i class="fa-solid fa-pen-to-square fa-lg"></i>
									<label for="i_names" class="ingredLabel">이름</label>
									<input type="text" id="i_names" class="form-control inputVal ingredName"
										placeholder="예) 소고기" name="i_names"> 
									<label for="i_amounts" class="ingredLabel">갯수</label>
									<input type="text" id="i_amounts" class="form-control inputVal ingredAmount"
										placeholder="예) 1/4, 1(단위는 제외)" name="i_amounts"> 
									<label for="i_units" class="ingredLabel">단위</label>
									<input type="text" id="i_units" class="form-control inputVal ingredUnit"
										placeholder="재료단위(자동입력)" readonly>
									<i class="fas fa-times-circle fa-lg ingredIconX ingredRemove"></i><br>
								</div>
								<div class="checkIngred"></div>
							</div>
						</div>
						<div style="text-align: center;">
							<span class="addButton btn btn-outline-info" id="addIngred">재료
								추가</span> <span class="addButton btn btn-outline-secondary"
								id="insertIngred">재료 등록</span>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<hr class="createHr">
				<div class="form-group createCookDiv">
					<span class="createTitle">요리 순서</span><br>
					<div class="explainDiv">
						<span class="explain">요리하는 스텝마다 빠지면안될 중요한 부분을 입력해주세요.</span><br>
						<span class="explain">예) 감자를 넣어주세요. ▶ 감자가 없으면, 고구마로 대체
							가능합니다.</span><br> <span class="explain">국간장을 넣어주세요. ▶ 물이 끓고
							있을때 간장을 넣어주세요.</span><br>
					</div>
					<div id="addCookStepList">
						<!-- 						클론용 -->
						<div class="row addCookStepDiv" style="display: none;">
							<div class="col-md-3 cookStepTitle">
								<span class="cookStepTitle">step</span>
							</div>
							<div class="col-md-7">
								<textarea rows="5" class="form-control inputVal stepContent"
									name="r_contents"
									placeholder="예)소고기는 기름기를 떼어내어 먹기 편안크기로 썰어주세요."></textarea>
							</div>
							<div class="col-md-2 stepImageDiv">
								<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
									src="/resources/main_mypage/images/plus.png" /> <input
									type="file" class="cookFile cookStepFile" name="files" /> <i
									class="fas fa-times-circle fa-2x stepIconX stepRemove"></i>
							</div>
						</div>
						<!-- 						클론용 -->
						<div class="row addCookStepDiv">
							<div class="col-md-3 cookStepTitle">
								<span class="cookStepTitle">step1</span>
							</div>
							<div class="col-md-7">
								<textarea rows="5" class="form-control inputVal"
									name="r_contents"
									placeholder="예)소고기는 기름기를 떼어내어 먹기 편안크기로 썰어주세요."></textarea>
							</div>
							<div class="col-md-2 stepImageDiv">
								<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
									src="/resources/main_mypage/images/plus.png" /> <input
									type="file" class="cookFile cookStepFile" name="files" /> <i
									class="fas fa-times-circle fa-2x stepIconX stepRemove"></i>
							</div>
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
					<label for="r_cooktip" class="createTitle">요리팁</label>
					<textarea rows="4" class="form-control inputVal" id="r_cooktip"
						name="r_cooktip"
						placeholder="예)고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요."></textarea>
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
<%@include file="/WEB-INF/views/include/main_footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.addButton{
	cursor: pointer;
}
.createCookDiv{
	width: 75%;
}
#mainCookImage{
	border: 1px solid #DFD9D8;
	width: 250px;
	height: 250px;
}
.inputImage{
	width: 100px;
	height: 100px;
}
.inputVal{
	background: #F5F5F5;
	margin-bottom: 20px;
}
.inputVal:focus{
	background: #F5F5F5;
}
.createHr{
	margin-top: 30px; 
	margin-bottom: 30px
}
.explainDiv{
	margin-bottom: 20px;
}
.explain{
	color: #AFACAC;
	font-size: 13px;
	padding-left: 10px;
}
.createTitle{
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}
.cookFile {
	display: none;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form">
				<h3>레시피 등록</h3><hr class="createHr">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="title" class="createTitle">레시피 제목</label>
							<input type="text" class="form-control inputVal" id="title" name="title" />
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">요리 소개</label>
							<textarea rows="4" class="form-control inputVal"></textarea>
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">카테고리</label> 
							<div class="row">
		   						<div class="col">
									<select class="custom-select inputVal" name="종류" >
										<option selected>종류별</option>
										<option>한식</option>
										<option>한식</option>
										<option>한식</option>
									</select>
								</div>
		   						<div class="col">
									<select class="custom-select inputVal" name="종류" >
										<option selected>종류별</option>
										<option>한식</option>
										<option>한식</option>
										<option>한식</option>
									</select>
								</div>
		   						<div class="col">
									<select class="custom-select inputVal" name="종류" >
										<option selected>종류별</option>
										<option>한식</option>
										<option>한식</option>
										<option>한식</option>
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
						src="/resources/main_mypage/images/cook.png" />
						<label for="file"> 대표 요리사진을 등록해주세요. </label>
						<input type="file" id="file" class="cookFile"/>
					</div>
				</div><hr class="createHr">
				<div class="explainDiv">
					<span class="explain">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
				</div>
				<div class="row">
					<div class="col-md-3">
						<input type="text" class="form-control" id="title" name="title" 
							value="재료" style="background: #FFFECC"/>
					</div>
					<div class="col-md-8">
						<div id="ingrdDiv">
							<div class="input-group mb-2">
								<input type="text" class="form-control inputVal" placeholder="예)돼지고기">
								<input type="text" class="form-control inputVal" placeholder="예)300g">
							</div>
						</div>
						<div style="text-align: center;">
							<span class="addButton">재료 추가</span>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div><hr class="createHr">
				<div class="form-group createCookDiv">
					<span class="createTitle">요리 순서</span><br>
					<div class="explainDiv">
					<span class="explain">요리하는 스텝마다 빠지면안될 중요한 부분을 입력해주세요.</span><br>
					<span class="explain">예) 감자를 넣어주세요. ▶ 감자가 없으면, 고구마로 대체 가능합니다.</span><br>
					<span class="explain">국간장을 넣어주세요. ▶ 물이 끓고 있을때 간장을 넣어주세요.</span><br>
      				</div>
      				<div class="row">
						<div class="col-md-2">
							step1
						</div>
						<div class="col-md-8">
							<textarea rows="5" class="form-control inputVal"></textarea>
						</div>
						<div class="col-md-2">
							<img class="inputImage" alt="요리사진을 등록해주세요."
							src="/resources/main_mypage/images/cook.png" />
							<input type="file" id="file" class="cookFile"/>
						</div>
					</div>
				</div>
				<hr class="createHr">
				<div class="form-group createCookDiv">
					<label for="title" class="createTitle">요리팁</label>
					<textarea rows="4" class="form-control inputVal"></textarea>
				</div><hr class="createHr">
				<button type="submit" class="btn btn-primary">저장하기</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
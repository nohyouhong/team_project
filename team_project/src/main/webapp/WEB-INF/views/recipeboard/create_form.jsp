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
	cursor: pointer;
}
.inputImage{
	background: #F5F5F5;
	border: 1px solid #DFD9D8;
	width: 120px;
	height: 120px;
	cursor: pointer;
}
.inputVal{
	background: #F5F5F5;
	margin-bottom: 20px;
}
.inputVal:focus{
	background: #F5F5F5;
}

#addIngredList{
	margin-bottom: 20px;
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
 	display	: none;
}
.cookStepTitle{
	text-align: right;
	color: 	#F83801;
	font-size: 35px;
}
</style>
<script>
$(function() {
// 	재료추가
	$("#addIngred").click(function() {
		var cloneIngredDiv = $(".addIngredDiv").eq(0).clone();
		var inputs = cloneIngredDiv.find("input");
		inputs.eq(0).val("");
		inputs.eq(1).val("");
		$("#addIngredList").append(cloneIngredDiv);
	});

// 	요리스텝추가
	var index = 2;
	$("#addStep").click(function() {
		var cloneCookStepDiv = $(".addCookStepDiv").eq(0).clone();
		cloneCookStepDiv.find("span").text("step" + index++);
		cloneCookStepDiv.find("textarea").val("");
		cloneCookStepDiv.find("img").attr("src", "/resources/main_mypage/images/plus.png");
		$("#addCookStepList").append(cloneCookStepDiv);
	});
	
// 	대표요리사진넣기
	$("#mainCookImage").click(function() {
		var inputFile = $("#mainFile");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log("클릭됨");
		console.log(file);
	});
	$("#mainFile").on("change", function(){
// 		console.log(this.files);
    	if (this.files && this.files[0]) {
       		var reader = new FileReader();
    			reader.onload = function (e) {
    			$("#mainCookImage").attr("src", e.target.result);
    			}
            reader.readAsDataURL(this.files[0]);
    	}
    });
// 	스텝요리사진넣기
	$("#addCookStepList").on("click", ".stepCookImage" , function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log(file);
	});
	$("#addCookStepList").on("change", ".cookStepFile" , function() {
// 		console.log(this.files);
		var inputImg = $(this).parent().find("img");
    	if (this.files && this.files[0]) {
       		var reader = new FileReader();
    			reader.onload = function (e) {
    			inputImg.attr("src", e.target.result);
    			}
            reader.readAsDataURL(this.files[0]);
    	}
    });
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/recipeboard/createRun" method="post" enctype="multipart/form-data">
				<h3>레시피 등록</h3><hr class="createHr">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="r_title" class="createTitle">레시피 제목</label>
							<input type="text" class="form-control inputVal" id="r_title" name="r_title" />
						</div>
						<div class="form-group">
							<label for="r_explain" class="createTitle">요리 소개</label>
							<textarea rows="4" class="form-control inputVal" id="r_explain" name="r_explain"></textarea>
						</div>
						<div class="form-group">
							<label for="title" class="createTitle">카테고리</label> 
							<div class="row">
		   						<div class="col">
									<select class="custom-select inputVal" name="f_code">
										<option selected>종류별</option>
										<option value="1001">한식</option>
										<option value="1002">중식</option>
										<option value="1003">양식</option>
									</select>
								</div>
		   						<div class="col">
									<select class="custom-select inputVal">
										<option selected>종류별</option>
										<option>한식</option>
										<option>한식</option>
										<option>한식</option>
									</select>
								</div>
		   						<div class="col">
									<select class="custom-select inputVal">
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
						<input type="file" id="mainFile" name="file" class="cookFile"/>
					</div>
				</div><hr class="createHr">
				<div class="explainDiv">
					<span class="explain">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
				</div>
				<div class="row">
					<div class="col-md-3">
						<input type="text" class="form-control"
							value="재료" style="background: #FFFECC"/>
					</div>
					<div class="col-md-8">
						<div id="addIngredList">
							<div class="input-group mb-2 addIngredDiv">
								<input type="text" class="form-control inputVal" 
									placeholder="예)소고기" name="i_name">
								<input type="text" class="form-control inputVal" 
									placeholder="예)1000g" name="i_amount">
							</div>
						</div>
						<div style="text-align: center;">
							<span class="addButton btn btn-info" id="addIngred">재료 추가</span>
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
      				<div id="addCookStepList">
						<div class="row addCookStepDiv">      				
							<div class="col-md-3 cookStepTitle">
								<span class="cookStepTitle">step1</span>
							</div>
							<div class="col-md-7">
								<textarea rows="5" class="form-control inputVal" name="r_content"></textarea>
							</div>
							<div class="col-md-2 stepImageDiv">
								<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/plus.png"/>
								<input type="file" class="cookFile cookStepFile" name="files"/>
							</div>
						</div>
					</div>
					<div style="text-align: center;">
						<span class="addButton btn btn-info" id="addStep">순서 추가</span>
					</div>
				</div>
				<hr class="createHr">
				<div class="form-group createCookDiv">
					<label for="title" class="createTitle">요리팁</label>
					<textarea rows="4" class="form-control inputVal" id="r_cooktip" name="r_cooktip"></textarea>
				</div><hr class="createHr">
				<div style="text-align: center;">
					<button type="submit" class="btn btn-success btn-lg">저장하기</button>
					<a href="#" class="btn btn-secondary btn-lg">취소하기</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
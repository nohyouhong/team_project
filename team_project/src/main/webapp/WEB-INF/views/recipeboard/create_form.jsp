<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.titleP{
	margin-top: 60px;
}
.createTitleSpan{
	font-size: 30px;
	font-style: italic;
}
.addButton{
	cursor: pointer;
}
.createCookDiv{
	width: 75%;
}
.createCookDiv2{
	width: 80%;
}
#mainCookImage{
	margin-top: 40px;
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
.ingredIconX{
	margin-left: 10px;
	margin-top: 17px;
}
.stepIconX{
	position: relative;
	left: 130px;
	bottom: 40px;
	cursor: pointer;
}
#tagDiv{
	margin-left: 20px;
}
.oneTag{
	margin-right: 20px;
}
.tagFront{
	font-size: 22px;
	color: #F83801;
}
.tagName{
	font-size: 17px;
}
.tagRemove, .ingredIconX{
	cursor: pointer;
}
#tagBtn{
	margin-left: 10px;	
}
.tagInput{
	display: inline;
	width: 40%;
	margin-left: 10px;
}
</style>
<script>
$(function() {
// 	재료추가
	$("#addIngred").click(function() {
		var cloneIngredDiv = $(".addIngredDiv").eq(0).clone();
		cloneIngredDiv.show();
		var inputs = cloneIngredDiv.find("input");
		inputs.eq(0).val("");
		inputs.eq(1).val("");
		$("#addIngredList").append(cloneIngredDiv);
	});

//재료 삭제
	$("#addIngredList").on("click", ".ingredRemove", function(){
		$(this).parent().remove();
	});

// 	요리스텝추가
	var index = 2;
	$("#addStep").click(function() {
		var cloneCookStepDiv = $(".addCookStepDiv").eq(0).clone();
		cloneCookStepDiv.show();
		cloneCookStepDiv.find("span").text("step" + index++);
		cloneCookStepDiv.find("textarea").val("");
		cloneCookStepDiv.find("img").attr("src", "/resources/main_mypage/images/plus.png");
		$("#addCookStepList").append(cloneCookStepDiv);
	});
	
//  요리스텝삭제
	$("#addCookStepList").on("click", ".stepRemove", function() {
		var index2 = 0;
		var addCookStepList = $(this).parents("div#addCookStepList");
// 		console.log(addCookStepList);
		$(this).parent().parent().remove();
		var addCookStepSpans = addCookStepList.find("span");
// 		console.log(addCookStepSpans);
		
		$.each(addCookStepSpans, function() {
			var indexStep = "step" + index2++;
			$(this).text(indexStep);
		});
		index = index2;
	});
	
// 	대표요리사진넣기
	$("#mainCookImage").click(function() {
		var inputFile = $("#mainFile");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log("클릭됨");
		console.log(file);
		var form = $("#messageForm");
		var formData = new FormData(form[0]);
		var url = "/message/modalSendMessage";
		
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
				}
			}
		});
		
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
	$("#recipeFormBtn").click(function() {
		var tags = $(".tagName");
		for(var i = 1; i < tags.length; i++) {
			var tag = $(".tagName").eq(i).text();
			console.log(tag);
			var tagHtml = "<input type='hidden' name='r_tags' value=" + tag + ">";
			$("#recipeForm").prepend(tagHtml);
		}
		//클론input삭제
		$(".addIngredDiv").eq(0).remove();
		$(".addCookStepDiv").eq(0).remove();
		$("#recipeForm").submit();
	});
});
</script>
<div class="container-fluid">
	<div class="row titleP">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<span class="createTitleSpan">레시피 등록</span>
			<hr class="createHr">
			<form role="form" id="recipeForm" action="/recipeboard/createRun" method="post" enctype="multipart/form-data">
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
									<select class="custom-select inputVal" name="r_time">
										<option selected>종류별</option>
										<option value="5분이내">5분이내</option>
										<option value="30분이내">30분이내</option>
										<option value="1시간이내">1시간이내</option>
										<option value="1시간이상">1시간이상</option>
									</select>
								</div>
		   						<div class="col">
									<select class="custom-select inputVal" name="r_level">
										<option selected>종류별</option>
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
<!-- 						클론용 -->
							<div class="input-group mb-2 addIngredDiv" style="display: none;">
								<input type="text" class="form-control inputVal" 
									placeholder="예)소고기" name="i_names">
								<input type="text" class="form-control inputVal" 
									placeholder="예)1000g" name="i_amounts">
								<i class="fas fa-times-circle fa-lg ingredIconX ingredRemove"></i>
							</div>
<!-- 						클론용 -->
							<div class="input-group mb-2 addIngredDiv">
								<input type="text" class="form-control inputVal" 
									placeholder="예)소고기" name="i_names">
								<input type="text" class="form-control inputVal" 
									placeholder="예)1000g" name="i_amounts">
								<i class="fas fa-times-circle fa-lg ingredIconX ingredRemove"></i>
							</div>
						</div>
						<div style="text-align: center;">
							<span class="addButton btn btn-outline-info" id="addIngred">재료 추가</span>
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
<!-- 						클론용 -->
						<div class="row addCookStepDiv" style="display: none;">    				
							<div class="col-md-3 cookStepTitle">
								<span class="cookStepTitle">step</span>
							</div>
							<div class="col-md-7">
								<textarea rows="5" class="form-control inputVal" name="r_contents"></textarea>
							</div>
							<div class="col-md-2 stepImageDiv">
								<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/plus.png"/>
								<input type="file" class="cookFile cookStepFile" name="files"/>
								<i class="fas fa-times-circle fa-2x stepIconX stepRemove"></i>
							</div>
						</div>
<!-- 						클론용 -->
						<div class="row addCookStepDiv">    				
							<div class="col-md-3 cookStepTitle">
								<span class="cookStepTitle">step1</span>
							</div>
							<div class="col-md-7">
								<textarea rows="5" class="form-control inputVal" name="r_contents"></textarea>
							</div>
							<div class="col-md-2 stepImageDiv">
								<img class="inputImage stepCookImage" alt="요리사진을 등록해주세요."
								src="/resources/main_mypage/images/plus.png"/>
								<input type="file" class="cookFile cookStepFile" name="files"/>
								<i class="fas fa-times-circle fa-2x stepIconX stepRemove"></i>
							</div>
						</div>
					</div> 
<!-- 					여기 -->
					<div style="text-align: center;">
						<span class="addButton btn btn-outline-info" id="addStep">순서 추가</span>
					</div>
				</div>
				<hr class="createHr">
				<div class="form-group createCookDiv2">
					<label for="r_cooktip" class="createTitle">요리팁</label>
					<textarea rows="4" class="form-control inputVal" id="r_cooktip" name="r_cooktip"></textarea>
				</div><hr class="createHr">
				<div class="form-group createCookDiv2">
					<label for="title" class="createTitle">태그</label>
					<input id="tagInput" class="form-control inputVal tagInput" type="text">
					<button id="tagBtn" type="button" class="btn btn-outline-primary">태그추가</button>
					<div id="tagDiv">
						<span class="oneTag" style="display: none;">
							<span class="tagFront">#</span>
							<span class="tagName"></span>
							<i class="fas fa-times-circle ingredIconX tagRemove"></i>
						</span>
					</div>
				</div><hr class="createHr">
				<div style="text-align: center;">
					<button type="button" id="recipeFormBtn" class="btn btn-outline-success btn-lg">저장하기</button>
					<a href="#" class="btn btn-outline-secondary btn-lg">취소하기</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
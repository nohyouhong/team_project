<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.cookP{
	padding: 35px;
	padding-left: 60px;
	padding-right: 60px;
}
.cookCenterDiv{
	text-align: center;
}
.mainImage{
	position:relative;
	top: 48px;
	width: 680px;
	height: 400px;
	border: 2px solid #BEB6B6;
}
.userImageDiv{
	position:relative;
	bottom: 40px;
}
.userImage{
	width: 150px;
	height: 150px;
}
.cookUserid{
	position: relative;
	top: 10px;
	font-size: 18px;
}
.cookTitle{
	font-size: 30px;
	font-weight: bold;
}
.cookTitleP{
	font-size: 26px;
}
.cookSecondTitleP{
	margin-left: 5px;
	font-size: 15px;
	font-style:italic;
	color: #BEB6B6;
}
.cookExplain{
	margin-top: 25px; 
	font-size: 19px;
	color: #BEB6B6;
}
.cookViewCnt{
	position: relative;
	bottom: 130px;
	padding-right: 250px;
	float: right;
}
.cookViewCntBack{
	padding:7px;
	padding-left: 20px;
	padding-right: 20px;
	background-color: black;
	color: white;
	border-radius: 40px;
}
.cookViewCntVal{
	color: white;
}
.createHr2{
	margin-top: 10px;
	margin-bottom: 30px;
}
.iconDivs{
	margin-top: 60px;
}
.iconDiv{
	width: 30%;	
}
.cookIcon, .grayCol{
	color: #BEB6B6;
}
.iconExplain{
	margin-top: 5px;
	margin-bottom: 20px;
	font-size: 19px;
	color: #BEB6B6;
}
.cookReadUl{
	list-style: none;
	width: 100%;
	margin-top: 30px;
	margin-left: 60px;
	margin-right: 60px;
}
.cookReadLl{
	width: 23%;
	display: inline-block;
	margin: 22px;
	margin-right:50px;	
	border-bottom: 1px solid #C9C3C3;
}
.cookLiSpan{
	font-size: 18px;
}
.cookLiSpanAfter{
	float:right;
	font-size: 18px;
}
.info, .infoSpan{
	cursor: pointer;
}
.stepDiv{
	margin-top: 30px;
}
.cookTipTitle{
	color: rgba(248, 56, 1);
	font-size: 28px;
}
.cookTipEx{
	font-size: 22px;
	margin: 35px;
	margin-left: 70px;
	margin-right: 70px;
}
.stepContent{
	font-size: 23px;
	margin-top: 90px;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 30px;
}
.r_contentP{
	padding-top: 5px;
}
.stepPicDiv, .userImageInfo, .showHideDiv{
	text-align: center;
}
.stepCount{
	float: right;
	color: rgba(248, 56, 1);
	font-size: 28px;
	font-weight: bold;
}
.cookStepStyleSpan{
	float:right;
	margin-top: 10px;
	margin-right: 90px;
}
.cookStepStyleIcon{
	border: 2px solid #BEB6B6;
	padding: 10px;
	color: #BEB6B6;
	cursor: pointer;
}
#stepStyle1{
 	background: #8C8C8C; 
}
.stepPicture{
	width: 900px;
	height: 450px;
}
.stepPicture3{
	width: 300px;
	height: 150px;
}
.userImage2{
	width: 120px;
	height: 120px;
}
.userInfomation{
	margin: 30px;
	margin-top: 50px;
	font-size: 20px;
}
.userInfos{
	margin-top: 15px;
}
.userEmail{
	margin-top: 10px;
	margin-left: 10px;
	font-size: 19px;
}
.cookTitleExNum{
	font-size: 26px;
	font-style: italic;
	color: rgba(248, 56, 1);
	margin-left: 5px;
}
#cookRecipeReImageDiv{
	text-align: center;
	margin-top: 60px;
	margin-bottom: 30px;
	margin-left: 80px;
	margin-right: 80px;
}
.cookRecipeReImage, .imageListButton{
	width: 150px;
	height: 150px;
	margin-right: 5px;
}
.imageListButtonDiv{
	float: right;
	margin-right: 94px;
}
.imageListButton{
	position:relative;
	bottom:180px;
	background: rgba(0, 0, 0, 0.5);
}
.imageListbuttonChar{
	font-size: 18px;
	color: white;
}
#cookCommentDiv{
margin-top: 70px;
}
.oneComment{
margin-left: 80px;
margin-right: 80px;
border-bottom: 1px solid #C9C3C3;
margin-top: 20px;
padding-bottom: 20px;
}
.commentUserImageDiv{
	display: inline-block;
}
.commentUserImage{
	width: 60px;
	height: 60px;
	margin-top: -50px;
	margin-left: 20px;
}
.commentUserInfo{
	display: inline-block;
	width: 70%;
	margin-left: 15px;
}
.commentUser{
	font-size: 20px;
	color: rgba(248, 56, 1);
	margin-right: 12px;
}
.commentDate, .smallHr,.commentReply, .commentDeclare, .commentDelete{
	font-size: 16px;
	color: #BEB6B6;
	margin-right: 10px;
}
.userCommentVal{
	margin-top: 12px;
	font-size: 16px;
}
.cookCommentInputDiv{
	margin-left: 80px;
	margin-right: 130px;
	margin-top: 30px;
}
.cookCommentInputDiv2{
	margin-left: 120px;
	margin-right: 130px;
	margin-top: 15px;
	margin-bottom: 40px;
}
.commentImage{
	height: 100px;
	width: 100px;
	border: 2px solid #BEB6B6;
	cursor: pointer;
	background: #D4D4D4;
}
.commentButton{
	height: 101px;
	width: 100px;
	border: 2px solid #BEB6B6;
	margin-left: -1px;
	background-color: white;
}
.commentTextarea{
	height: 100px;
	width:100%;
	margin-left:30px;
	border: 2px solid #BEB6B6;
}
.showButton, .hideButton{
	height: 40px;
	width: 400px;
	border: 1px solid #BEB6B6;
	background-color: white;
	margin: 20px;
}
</style>
<script>
$(function(){
	//스텝보이는방식 바꾸기
	$("#stepStyle1").click(function(){
		$("#stepStyle1").css("background", "#8C8C8C");
		$("#stepStyle2").css("background", "white");
		$("#stepStyle3").css("background", "white");
		$(".step1").show();
		$(".step2").hide();
		$(".step3").hide();
	});
	$("#stepStyle2").click(function(){
		$("#stepStyle1").css("background", "white");
		$("#stepStyle2").css("background", "#8C8C8C");
		$("#stepStyle3").css("background", "white");
		$(".step1").hide();
		$(".step2").show();
		$(".step3").hide();
	});
	$("#stepStyle3").click(function(){
		$("#stepStyle1").css("background", "white");
		$("#stepStyle2").css("background", "white");
		$("#stepStyle3").css("background", "#8C8C8C");
		$(".step1").hide();
		$(".step2").hide();
		$(".step3").show();
	});
	
	//댓글리스트
	getCommentList();
	function getCommentList() {
		var r_bno = "${recipeBoardVo.r_bno}";
		var url = "/comment/recipeCommentListNum/" + r_bno;
		var url2 = "/comment/recipeCommentList/" + r_bno;
		$.get(url, function(rData) {
			$("#commentNum").text(rData);
		});
		$.get(url2, function(rData) {
			console.log(rData);
			$(".oneComment:gt(0)").remove();
			$.each(rData, function() {
				var oneCommentDiv = $(".oneComment").eq(0).clone();
				oneCommentDiv.show();
				var UserInfoDiv = oneCommentDiv.find(".UserInfoDiv");
				if(this.userid == "${loginVo.userid}") {
					UserInfoDiv.append('<a class="commentDelete" href="#">삭제</a>');
				} else {
					UserInfoDiv.append('<a class="commentDeclare" href="#">신고</a>');
				}
				if(this.r_userpic != null) {
					var r_userpic = this.r_userpic;
					var imageFile = "/recipeboard/displayImage/?filename=" + r_userpic;
					oneCommentDiv.find("img").attr("src", imageFile);
				}
				//답글 띄우기
				if(this.re_level > 0) {
					oneCommentDiv.css("margin-left", "120px");
				}
				var spans = oneCommentDiv.find("span");
				spans.eq(0).text(this.username);
				spans.eq(1).text(this.r_regdate);
				oneCommentDiv.find("div.userCommentVal").text(this.r_comment);
				oneCommentDiv.find(".commentReply").attr("data-re_group", this.re_group);
				oneCommentDiv.find(".commentDeclare").attr("data-r_cno", this.r_cno);
				oneCommentDiv.find(".commentDelete").attr("data-r_cno", this.r_cno);
				$("#cookCommentDiv").append(oneCommentDiv);
			});
		});
	}
	
    //댓글 사진 미리보기
	$("#cookCommentAll").on("click", ".commentImage" , function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log(file);
	});
	$("#cookCommentAll").on("change", ".commentUserImageFile" , function() {
		var inputImg = $(this).parent().find("img");
    	if (this.files && this.files[0]) {
       		var reader = new FileReader();
    			reader.onload = function (e) {
    			inputImg.attr("src", e.target.result);
    			}
            reader.readAsDataURL(this.files[0]);
    	}
    });
	
	//댓글 완료 버튼
	$("#commentButton").click(function() {
		
		var form = $("#cookCommentForm");
		var formData = new FormData(form[0]);
		console.log(formData);
		var url = "/comment/insertRecipeComment";
		
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
					getCommentList();
				}
			}
		});
		//비우기
		$("#commentImage").attr("src", "/resources/main_mypage/images/userImagePlus.png");
		$("#file").val("");
		$("#r_comment").val("");
	});
	
	//답글 완료 버튼
	$("#commentButton2").click(function() {
		
		var form = $("#cookCommentForm2");
		var formData = new FormData(form[0]);
		console.log(formData);
		var url = "/comment/replyRecipeComment";
		
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
					getCommentList();
				}
			}
		});
		//비우기
		form.hide();
		$("#commentImage2").attr("src", "/resources/main_mypage/images/userImagePlus.png");
		$("#file2").val("");
		$("#r_comment2").val("");
	});
	
	//댓글답글버튼
	$("#cookCommentDiv").on("click", ".commentReply", function(e) {
		e.preventDefault();
		var re_group = $(this).attr("data-re_group");
		var cookCommentForm2 = $("#cookCommentForm2");
		cookCommentForm2.show();
		$("#re_group").val(re_group);
		$(this).parents("div.oneComment").after(cookCommentForm2);
	});
	
	//댓글삭제버튼
	$("#cookCommentDiv").on("click", ".commentDelete", function(e) {
		e.preventDefault();
		var r_cno = $(this).attr("data-r_cno");
		var url = "/comment/deleteRecipeComment/" + r_cno;
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				getCommentList();
			}
		});
	});
	
	//모달창 저장버튼
	$("#btnModalSave").click(function() {
		var content = $("#modalContent").val();
		var cno = $(this).attr("data-cno");
		var sData = {
			"content" : content,
			"cno" : cno
		};
		var url = "/comment/updateComment";
		$.post(url, sData, function(rData) {
			console.log(rData);		
			if(rData == "true") {
				getCommentList();
				$("#btnModalClose").trigger("click");
			}
		});
	});
	
	
});
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="cookP cookCenterDiv">
			<img class="mainImage" 
				src="/recipeboard/displayImage?filename=${recipeBoardVo.r_titlepic }"/>
			<div class="userImageDiv">
				<img class="userImage rounded-circle img-thumbnail" 
					src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" /><br>
				<div class="cookUserid">${memberVo.username }</div>
				<div class="cookViewCnt">
					<span class="cookViewCntBack">
						<i class="fas fa-eye fa-lg"></i>
						<span class="cookViewCntVal">${recipeBoardVo.r_viewcnt }</span>
					</span>
				</div>
			</div>
			<div class="row" style="clear:both;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="cookTitle">${recipeBoardVo.r_title }</div>
					<div class="cookExplain">${recipeBoardVo.r_explain }</div>
					<div class="row iconDivs">
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.f_type }</div>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.f_type }</div>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.f_type }</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">재료</span>
			<span class="cookSecondTitleP">Ingredients</span>
			<div>
				<ul class="cookReadUl">
					<c:forEach items="${ingredientVoList }" var="ingredientVo">
						<li class="cookReadLl">
							<span class="cookLiSpan">${ingredientVo.i_name}</span>
							<a href="${ingredientVo.i_address}" target="_blank">
								<i class="fa-solid fa-circle-info fa-lg info"></i>
								<span class="grayCol infoSpan">나무위키</span>
							</a>
							<span class="cookLiSpanAfter grayCol">${ingredientVo.i_amount}${ingredientVo.i_unit}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<div>
				<span class="cookTitleP">조리순서</span>
				<span class="cookSecondTitleP">Steps</span>
				<span class="cookStepStyleSpan">
					<i class="fas fa-images cookStepStyleIcon fa-2x" id="stepStyle1"></i>
					<i class="fas fa-align-justify cookStepStyleIcon fa-2x" id="stepStyle2"></i>
					<i class="far fa-images cookStepStyleIcon fa-2x" id="stepStyle3"></i>
				</span>
			</div>
			<div class="stepDiv">
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step1">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-10 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="stepPicDiv">
						<c:if test="${not empty recipeStepVo.r_picture }">
							<img class="stepPicture img-thumbnail" 
								src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
						</c:if>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step2" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-10 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step3" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-7 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-3">
								<div class="stepPicDiv">
									<c:if test="${not empty recipeStepVo.r_picture }">
										<img class="stepPicture3 img-thumbnail" 
											src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
									</c:if>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<i class="fa-solid fa-circle-exclamation fa-2x cookTipTitle"></i>
			<span class="cookTipTitle" style="margin-left: 10px">팁/주의사항 </span>
			<div class="cookTipEx">${recipeBoardVo.r_cooktip }</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">레시피 작성자</span>
			<span class="cookSecondTitleP">Writer</span>
			<div class="row userInfomation">
				<div class="col-md-2 userImageInfo">
					<c:choose>
						<c:when test="${not empty memberVo.m_picture }">
							<img class="userImage2 rounded-circle" 
								src="/recipeboard/dispalyImage?filename=${memberVo.m_picture }">
						</c:when>
						<c:otherwise>
							<img class="userImage2 rounded-circle" 
								src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="col-md-10 userInfos">
					<div>
						<span>${memberVo.username }</span>
						<a class="btn btn-primary btn-outline-* btn-sm" style="margin-left: 10px;">쪽지 보내기</a>
					</div>
					<div class="userEmail">${memberVo.email }</div>
				</div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">포토리뷰</span>
			<span class="cookTitleExNum">comment</span>
			<div id="cookRecipeReImageDiv">
				<c:forEach begin="1" end="6">
					<img class="cookRecipeReImage" src="/resources/main_mypage/images/cookSample.jpg">
				</c:forEach>
			</div>
			<div class="imageListButtonDiv">
				<button class="imageListButton">
					<span class="imageListbuttonChar">+더보기</span><br>
					<span class="imageListbuttonChar">숫자</span>
				</button>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">요리후기</span>
			<span class="cookTitleExNum">comment</span>
			<div id="cookRecipeReDiv">
				<c:forEach items="">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10"></div>
						<div class="col-md-1"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP" id="cookCommentAll">
			<span class="cookTitleP">댓글달기</span>
			<span class="cookTitleExNum" id="commentNum">갯수</span>
			<div id="cookCommentDiv">
				<div class="oneComment" style="display: none;">
					<div class="commentUserImageDiv">
						<img class="commentUserImage rounded-circle"
							src="/resources/main_mypage/images/userImageM.png">
					</div>
					<div class="commentUserInfo">
						<div class="UserInfoDiv">
							<span class="commentUser">이름</span> <span class="commentDate">날짜</span>
							<span class="smallHr">|</span> <a class="commentReply" href="#">답글</a>
							<span class="smallHr">|</span>
						</div>
						<div class="userCommentVal">코멘트</div>
					</div>
				</div>

				<!-- 				<이동용> -->
				<form id="cookCommentForm2" style="display: none;">
					<div class="cookCommentInputDiv2 row">
						<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
						<input type="hidden" id="re_group" name="re_group"> <input
							type="hidden" name="userid" value="${loginVo.userid}">
						<div class="col-md-1">
							<img class="commentImage" id="commentImage2"
								src="/resources/main_mypage/images/userImagePlus.png"> <input
								class="commentUserImageFile" type="file" id="file2" name="file"
								style="display: none;">
						</div>
						<div class="col-md-10">
							<textarea rows="4" id="r_comment2" name="r_comment"
								class="commentTextarea"></textarea>
						</div>
						<div class="col-md-1">
							<button type="button" class="commentButton" id="commentButton2">등록</button>
						</div>
					</div>
				</form>
			</div>
<!-- 				<이동용> -->
			<div class="showHideDiv">
				<button class="showButton">더보기</button>
				<button class="hideButton" style="display: none;">줄여보기</button>
			</div>
			<form id="cookCommentForm">
				<div class="cookCommentInputDiv row">
					<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
					<input type="hidden" name="userid" value="${loginVo.userid}">
					<div class="col-md-1">
						<img class="commentImage" id="commentImage"
							src="/resources/main_mypage/images/userImagePlus.png"> <input
							class="commentUserImageFile" type="file" id="file" name="file"
							style="display: none;">
					</div>
					<div class="col-md-10">
						<textarea rows="4" id="r_comment" name="r_comment"
							class="commentTextarea"></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="commentButton" id="commentButton">등록</button>
					</div>
				</div>
			</form>
		</div>
		<hr class="createHr2">
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
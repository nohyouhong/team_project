<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	border: 1px solid #BEB6B6;
	border-radius: 10px;
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
.cookViewRatingDiv{
	position: relative;
	bottom: 130px;
	padding-right: 250px;
	float: right;
}
.cookViewCntBack, .cookavgRating{
	padding:7px;
	padding-left: 20px;
	padding-right: 20px;
	background-color: black;
	color: white;
	border-radius: 40px;
}
.cookavgRating{
	margin-right: 10px;
}
.cookViewCntVal, .cookavgRatingVal{
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
	margin-top: 60px;
	margin-bottom: 30px;
	margin-left: 100px;
	margin-right: 100px;
}
.cookRecipeReImage{
	width: 150px;
	height: 150px;
	margin-right: 5px;
}
.imageListButton{
	width: 150px;
	height: 150px;
	margin-right: 20px;
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
#cookCommentDiv, #cookRecipeReDiv{
margin-top: 70px;
}
.oneComment, .oneRecipeReview{
margin-left: 80px;
margin-right: 80px;
border-bottom: 1px solid #C9C3C3;
margin-top: 20px;
padding-bottom: 20px;
}
.commentUserImageDiv, .reviewUserImageDiv, .reviewUserCookImageDiv{
	display: inline-block;
}
.reviewUserCookImageDiv{
	width: 20%;
	text-align: right;
	padding-top:5px;
	padding-right: 20px;
}
.commentUserImage{
	width: 60px;
	height: 60px;
	margin-top: -50px;
	margin-left: 20px;
}
.reviewUserImage{
	width: 60px;
	height: 60px;
}
.commentUserInfo, .reviewUserInfo{
	display: inline-block;
	width: 70%;
	margin-left: 15px;
}
.commentUser, .reviewUser, #modalReviewUser{
	font-size: 20px;
	color: rgba(248, 56, 1);
	margin-right: 12px;
}
.commentDate, .smallHr, .commentReply, .commentDeclare, .commentDelete,
	 .reviewDate, .reviewReply, .reviewDelete, #modalReviewDate{
	font-size: 16px;
	color: #BEB6B6;
	margin-right: 10px;
}
.userCommentVal, .userReviewVal, #modalReviewComment{
	margin-top: 12px;
	font-size: 16px;
}
.cookCommentInputDiv, .cookReviewInputDiv{
	margin-left: 80px;
	margin-right: 130px;
	margin-top: 30px;
}
.cookCommentInputDiv2, .cookReviewInputDiv2{
	margin-left: 120px;
	margin-right: 130px;
	margin-top: 15px;
	margin-bottom: 40px;
}
.commentImage, .reviewImage{
	height: 100px;
	width: 100px;
	border: 2px solid #BEB6B6;
	cursor: pointer;
	background: #D4D4D4;
}
.commentButton, .reviewButton{
	height: 101px;
	width: 100px;
	border: 2px solid #BEB6B6;
	margin-left: -1px;
	background-color: white;
}
.commentTextarea, .reviewTextarea{
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
.yellowStar{
	color: #EAE909;
}
.grayStar{
	color: #BEB6B6
}
.starReviewEx{
	text-align: center;
	font-weight: bold;
	font-size: 18px;
}
.starsDiv{
	position: relative;
	left: 150px;
}
.starRating {
	display:flex;
	flex-direction: row-reverse;
	font-size:50px;
	justify-content:space-around;
	width:180px;
	text-align:center;
}
.starRating input {
	display:none;
}
.starRating label {
	color:#BEB6B6;
	cursor:pointer;
}
.starRating :checked ~ label {
	color:#EAE909;
}
.starRating label:hover,
.starRating label:hover ~ label {
	color:#EAE909;
}
.reviewUserImageBtn{
	cursor: pointer;
}
#modalReviewImage{
	width: 470px;
	height: 320px;
}
#modalReviewImageList{
	width: 570px;
	height: 400px;
}
.cookRecipeReImage{
	cursor: pointer;
}
.mymodalBody{
	width: 800px;
	heght: 800px;
}
.modalImageDiv{
	padding-left: 37px;
}
#modalReviewPic{
	width: 50px;
	height: 50px;
}
.modalReviewInfo{
	margin-left: 80px;
	margin-right: 80px;
	margin-top: 20px;
}
#modalMessageText{
	width: 470px;
	height: 260px;
}
#modalReviewComment{
	margin-left: 5px;
}
#tagDiv{
	margin: 30px;
	margin-left: 60px;
	margin-right: 60px;
}
.oneTag{
	margin-right: 10px;
	background-color: #E9E9E9;
}
.tagFront{
	font-size: 26px;
	color: #F83801;
}
.tagName{
	font-size: 21px;
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
					UserInfoDiv.append('<span class="smallHr">|</span>');
					UserInfoDiv.append('<a class="commentDelete" href="#">삭제</a>');
				} 
				if(this.r_userpic != null) {
					var r_userpic = this.r_userpic;
					var imageFile = "/recipeboard/displayImage?filename=" + r_userpic;
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
			runByCommentState();
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
	//요리후기 사진
	$("#cookReviewAll").on("click", ".reviewImage" , function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log(file);
	});
	$("#cookReviewAll").on("change", ".reviewUserImageFile" , function() {
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
		$("#cookCommentForm2").hide();
		var r_cno = $(this).attr("data-r_cno");
		var url = "/comment/deleteRecipeComment/" + r_cno;
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				getCommentList();
			}
		});
	});
	
	//요리후기 완료
	$("#reviewButton").click(function() {
		$("#modal-269785").trigger("click");
		
	});
	//평점 완료버튼
	$("#starRatingFinish").click(function() {
		$("#modal-269785").trigger("click");
		var ratingVal = $('input:radio[name="rating"]:checked').val();
		$("#cookReviewForm").find("input#r_rating").val(ratingVal);
		
		var form = $("#cookReviewForm");
		var formData = new FormData(form[0]);
		console.log(formData);
		var url = "/comment/insertRecipeReview";
		
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
					getReviewList();
					getReviewImageList();
				}
			}
		});
		//비우기
		$("#reviewImage").attr("src", "/resources/main_mypage/images/cook.png");
		$("#file3").val("");
		$("#r_comment3").val("");
	});
	
	//리뷰리스트
	getReviewList();
	function getReviewList() {
		var r_bno = "${recipeBoardVo.r_bno}";
		var url = "/comment/recipeReviewandImageListNum/" + r_bno;
		var url2 = "/comment/recipeReviewListNum/" + r_bno;
		var url3 = "/comment/recipeReviewList/" + r_bno;
		var url4 = "/comment/recipeReviewImageList/" + r_bno;
		$.get(url, function(rData) {
			$("#imageListNum").text(rData);
			$("#imageListNum2").text(rData);
		});
		$.get(url2, function(rData) {
			$("#reviewListNum").text(rData);
		});
		$.get(url3, function(rData) {
			console.log(rData);
			$(".oneRecipeReview:gt(0)").remove();
			$.each(rData, function() {
				var oneReviewDiv = $(".oneRecipeReview").eq(0).clone();
				oneReviewDiv.show();
				var UserInfoDiv = oneReviewDiv.find(".UserInfoDiv");
				
				if(this.userid == "${loginVo.userid}") {
					UserInfoDiv.append('<span class="smallHr">|</span>');
					UserInfoDiv.append('<a class="reviewDelete" href="#">삭제</a>');
				}  
				if(this.r_reviewpic != null) {
					var r_reviewpic = this.r_reviewpic;
					
					var imageFileHtml = 
						'<img class="reviewUserImage reviewUserImageBtn" data-filename="' + r_reviewpic + '" src="/recipeboard/displayImage?filename=' + r_reviewpic + '">'
					oneReviewDiv.find("div.reviewUserCookImageDiv").append(imageFileHtml);
				}
				if(this.m_picture != null) {
					var m_picture = this.m_picture;
					var imageFile = "/recipeboard/displayImage?filename=" + m_picture;
					oneReviewDiv.find("div.reviewUserImageDiv").find("img").attr("src", imageFile);
				} 
				var spans = oneReviewDiv.find("span");
				spans.eq(0).text(this.username);
				spans.eq(1).text(this.r_regdate);
				if(this.r_rating != null){
					var yellowStarNum = this.r_rating;
					var grayStarNum = 5 - yellowStarNum;
					for(var i = 1; i <= yellowStarNum; i++) {
						spans.eq(2).append('<i class="fas fa-star yellowStar"></i>');
					}
					for(var i = 1; i <= grayStarNum; i++) {
						spans.eq(2).append('<i class="fas fa-star grayStar"></i>');
					}
				}
				oneReviewDiv.find("div.userReviewVal").text(this.r_comment);
				oneReviewDiv.find(".reviewReply").attr("data-re_group", this.re_group);
				oneReviewDiv.find(".reviewDelete").attr("data-r_rno", this.r_rno);
				$("#cookRecipeReDiv").append(oneReviewDiv);
			});
			//하이드 실행
			runByReviewState();
		});
		//포토리뷰 사진
		getReviewImageList();
		function getReviewImageList() {
			var url4 = "/comment/recipeReviewImageList/" + r_bno;
			$.get(url4, function(rData) {
				var rDataIndex = rData.length;
				if(rData.length > 6){
					rDataIndex = 6;
					$("#imageListButtonDiv").show();
				}
				$(".cookRecipeReImage:gt(0)").remove();
				for(var i = 0; i < rDataIndex; i++){
					var reImage = $(".cookRecipeReImage").eq(0).clone();
					reImage.show();
					var reImageVal = rData[i].r_reviewpic;
					var onerData = rData[i];
					var reImageHtml = "/recipeboard/displayImage?filename=" + reImageVal;
					
					if(i == 5) {
						$("#imageListButtonDiv").attr("data-index", i);
					}else{
						reImage.attr("data-index", i);
					}
					reImage.attr("src", reImageHtml);
					console.log("reImage",reImage);
					$("#cookRecipeReImageDiv").append(reImage);
				}
			});
		}
	}
	
	//댓글삭제버튼
	$("#cookRecipeReDiv").on("click", ".reviewDelete", function(e) {
		e.preventDefault();
		var r_rno = $(this).attr("data-r_rno");
		var url = "/comment/deleteRecipeReview/" + r_rno;
		$.get(url, function(rData) {
			console.log(rData);
			if(rData == "true") {
				getReviewList();
				getReviewImageList()
			}
		});
	});
	//요리후기 더보기 줄여보기
	//(false가 줄여보기 상태)
	var reviewState = false;
// 	$("#reviewShowButton").click(function() {
// 		//전환버튼
// 		reviewState = !reviewState;
// 		runByReviewState();
// 	});
	$("#reviewShowButton").click(function() {
		//전환버튼
		reviewState = !reviewState;
		runByReviewState();
		$(this).hide();
		$("#reviewHideButton").show();
	});
	$("#reviewHideButton").click(function() {
		//전환버튼
		reviewState = !reviewState;
		runByReviewState();
		$(this).hide();
		$("#reviewShowButton").show();
	});
	
	//상태에따라 계속 하이드시키기 쇼우하기
	function runByReviewState() {
		var recipeReviews = $(".oneRecipeReview");
		if(reviewState) {
		//show시키기
			for(var i = 1; i < recipeReviews.length; i++){
				$(recipeReviews[i]).show();
// 				console.log(i, "쇼우");
			}
		} else if(!reviewState){
		//hide시키기
			for(var i = 4; i < recipeReviews.length; i++){
// 				console.log(i, "하이드");
// 				console.log(recipeReviews[i], "recipeReviews[i]");
				$(recipeReviews[i]).hide();
			}
		}
	}
	
	//댓글
	var commentState = false;
	$("#commentShowButton").click(function() {
		commentState = !commentState;
		runByCommentState();
		$(this).hide();
		$("#commentHideButton").show();
	});
	$("#commentHideButton").click(function() {
		commentState = !commentState;
		runByCommentState();
		$(this).hide();
		$("#commentShowButton").show();
	});
	function runByCommentState() {
		var recipeComments = $(".oneComment");
		if(commentState) {
			for(var i = 1; i < recipeComments.length; i++){
				$(recipeComments[i]).show();
			}
		} else if(!commentState){
			for(var i = 4; i < recipeComments.length; i++){
				$(recipeComments[i]).hide();
			}
		}
	}
	
	//모달 리뷰사진 정보 보기
	$("#cookRecipeReDiv").on("click", ".reviewUserImageBtn", function(){
		$("#modal-531767").trigger("click");
		var filename = $(this).attr("data-filename");
// 		console.log(filename);
		var imageVal = "/recipeboard/displayImage?filename=" + filename;
		$("#modalReviewImage").attr("src", imageVal);
		
		
	});
	
	//모달 포터리뷰안에서의 작업
	function modalImageRun(i, rData){
		var reImageVal = rData[i].r_reviewpic;
		var reImageSrc = "/recipeboard/displayImage?filename=" + reImageVal;
		var userImageVal = rData[i].m_picture;
		var userImageSrc = "";
		if(userImageVal != null && userImageVal != ""){
			userImageSrc = "/recipeboard/displayImage?filename=" + reImageVal;
		}else{
			userImageSrc = "/resources/main_mypage/images/userImageM.png";
		}
		var userid = rData[i].userid;
		var r_regdate = rData[i].r_regdate;
		var r_comment = rData[i].r_comment;
		var yellowStarNum = rData[i].r_rating;
		var grayStarNum = 5 - yellowStarNum;
		
		$("#modalReviewImageList").attr("src", reImageSrc);
		$("#modalReviewPic").attr("src", userImageSrc);
		$("#modalReviewUser").text(userid);
		$("#modalReviewDate").text(r_regdate);
		$("#modalReviewScore").text("");
		for(var i = 0; i < yellowStarNum; i++){
			$("#modalReviewScore").append('<i class="fas fa-star yellowStar"></i>');
		}
		for(var i = 0; i < grayStarNum; i++){
			$("#modalReviewScore").append('<i class="fas fa-star grayStar"></i>');
		}
		$("#modalReviewComment").text(r_comment);
	}
	
	//모달 포토리뷰
	function modalReviewImageList(that) {
		$("#modal-533333").trigger("click");
		
		var r_bno = "${recipeBoardVo.r_bno}";
		var url = "/comment/recipeReviewImageList/" + r_bno;
		$.get(url, function(rData) {
			var i = that.attr("data-index");
			modalImageRun(i, rData);

			//왼쪽버튼
			$("#modalLeftBtn").click(function() {
// 				console.log("왼쪽버튼 클림됨");
				if(i != 0) {
					modalImageRun(--i, rData);
				}
			});
			//오른쪽버튼
			$("#modalRightBtn").click(function() {
// 				console.log("오른쪽버튼 클림됨");
				if(i != (rData.length - 1)) {
					modalImageRun(++i, rData);
				}
			});
		});
		
	};
	$("#imageListButtonDiv").on("click", ".imageListButton", function() {
		var that = $("#imageListButtonDiv");
		modalReviewImageList(that);
	});
	$("#cookRecipeReImageDiv").on("click", ".cookRecipeReImage", function() {
		var that = $(this);
		modalReviewImageList(that);
	});
	
	//모달로 쪽지보내기
	$("#sendMessageBtn").click(function(){
		if("${loginVo}" != null && "${loginVo}" != ""){
			$("#modal-522222").trigger("click");
			
			$("#modalSendBtn").click(function() {
				var sender = "${loginVo.userid}";
				var receiver = "${memberVo.userid}";
				var textVal = $("#modalMessageText").val();
				$("#sender").val(sender);
				$("#receiver").val(receiver);
				$("#message").val(textVal);
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
				$("#modalMessageText").val("");
				$("#modal-522222").trigger("click");
			});	
		}else{
			alert("로그인 해주세요.");
		}
	});
	
});
</script>
<!-- 모달리스트 -->
<div class="row">
	<div class="col-md-12">
<!-- 	모달 별 평점매기기-->
		<a id="modal-269785" style="display: none;" href="#modal-container-269785" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>
			
		<div class="modal fade" id="modal-container-269785" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">평점을 매겨주세요.</h4>
					</div>
					<div class="modal-body modalReview">
						<div class="starReviewEx">당신의 평점은?</div>
						<div class="starsDiv">
							<div class="starRating">
							  <input type="radio" id="stars5" name="rating" value="5" />
							  <label for="stars5" class="star">&#9733;</label>
							  <input type="radio" id="stars4" name="rating" value="4" />
							  <label for="stars4" class="star">&#9733;</label>
							  <input type="radio" id="stars3" name="rating" value="3" />
							  <label for="stars3" class="star">&#9733;</label>
							  <input type="radio" id="stars2" name="rating" value="2" />
							  <label for="stars2" class="star">&#9733;</label>
							  <input type="radio" id="star1" name="rating" value="1" />
							  <label for="star1" class="star">&#9733;</label>
							</div>
						</div>
					</div>
					<div class="modal-footer modalReview">
						<button type="button" id="starRatingFinish" class="btn btn-primary">평점등록</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 사진만 -->
		<a id="modal-531767" style="display: none;" href="#modal-container-531767" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-531767" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">사 진</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<img id="modalReviewImage" src="#">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 리뷰이미지리스트 -->
		<a id="modal-533333" style="display: none;" href="#modal-container-533333" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-533333" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg"" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">포토 리뷰 전체보기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body mymodalBody">
						<div class="modalImageDiv">
							<i id="modalLeftBtn" class="fas fa-chevron-circle-left fa-4x"></i>
							<img id="modalReviewImageList" src="#">
							<i id="modalRightBtn" class="fas fa-chevron-circle-right fa-4x"></i>
						</div>
						<div id="modalReviewInfo" class="modalReviewInfo">
							<div class="UserInfoDiv">
								<span><img id="modalReviewPic" class="rounded-circle" src="#"></span>
								<span id="modalReviewUser">노유홍</span> 
								<span id="modalReviewDate">2022-06-12</span>
								<span id="modalReviewScore"></span>
							</div>
							<div id="modalReviewComment">코멘트를 달아주세용</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 쪽지보내기 -->
		<a id="modal-522222" style="display: none;" href="#modal-container-522222" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-522222" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지 보내기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<textarea id="modalMessageText" 
							placeholder="쪽지내용을 입력해주세요."></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" id="modalSendBtn" class="btn btn-secondary"
							>보내기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달리스트 -->
<!-- 쪽지폼 -->
<form id="messageForm" method="post">
	<input type="hidden" id="sender" name="sender">
	<input type="hidden" id="receiver" name="receiver">
	<input type="hidden" id="message" name="message">
	<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno }">
</form>
<!-- 쪽지폼 -->
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="cookP cookCenterDiv">
			<img class="mainImage" 
				src="/recipeboard/displayImage?filename=${recipeBoardVo.r_titlepic }"/>
			<div class="userImageDiv">
				<c:choose>
					<c:when test="${not empty memberVo.m_picture }">
						<img class="userImage rounded-circle img-thumbnail" 
							src="/recipeboard/displayImage?filename=${memberVo.m_picture }" /><br>
					</c:when>
					<c:otherwise>
						<img class="userImage rounded-circle img-thumbnail" 
							src="/resources/main_mypage/images/userImageM.png" /><br>
					</c:otherwise>
				</c:choose>
				<div class="cookUserid">${memberVo.username }</div>
				<div class="cookViewRatingDiv">
					<span class="cookavgRating">
						<i class="fas fa-star fa-lg"></i>
						<span class="cookavgRatingVal">${fn:substring(recipeBoardVo.avgRating, 0, 3 )}</span>
					</span>
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
							<span><i class="fas fa-clock fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.r_time }</div>
						</div>
						<div class="col-md-4 iconDiv">
							<c:choose>
								<c:when test="${recipeBoardVo.r_level == '쉬움'}">
									<span><i class="fas fa-grin-alt fa-3x cookIcon"></i></span>
								</c:when>
								<c:when test="${recipeBoardVo.r_level == '보통'}">
									<span><i class="fas fa-grin-beam-sweat fa-3x cookIcon"></i></span>
								</c:when>
								<c:when test="${recipeBoardVo.r_level == '어려움'}">
									<span><i class="fas fa-tired fa-3x cookIcon"></i></span>
								</c:when>
							</c:choose>
							<div class="iconExplain">${recipeBoardVo.r_level }</div>
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
								src="/recipeboard/displayImage?filename=${memberVo.m_picture }">
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
						<a id="sendMessageBtn" class="btn btn-outline-primary" style="margin-left: 10px;">쪽지 보내기</a>
					</div>
					<div class="userEmail">${memberVo.email }</div>
				</div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">포토리뷰</span>
			<span id="imageListNum" class="cookTitleExNum">comment</span>
			<div id="cookRecipeReImageDiv">
				<img class="cookRecipeReImage" style="display: none;" src="/resources/main_mypage/images/cookSample.jpg">
			</div>
			<div class="imageListButtonDiv" id="imageListButtonDiv" style="display: none;">
				<button class="imageListButton">
					<span class="imageListbuttonChar">+더보기</span><br>
					<span id="imageListNum2" class="imageListbuttonChar">숫자</span>
				</button>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP" id="cookReviewAll">
			<span class="cookTitleP">요리후기</span>
			<span id="reviewListNum" class="cookTitleExNum">comment</span>
			<div id="cookRecipeReDiv">
				<div class="row oneRecipeReview" style="display: none;">
					<div class="reviewUserImageDiv">
						<img class="reviewUserImage rounded-circle"
							src="/resources/main_mypage/images/userImageM.png">								
					</div>
					<div class="reviewUserInfo">
						<div class="UserInfoDiv">
							<span class="reviewUser">노유홍</span> 
							<span class="reviewDate">2022-06-12</span>
							<span class="reviewScore"></span>
						</div>
						<div class="userReviewVal">코멘트를 달아주세용</div>
					</div>
					<div class="reviewUserCookImageDiv">
					</div>
				</div>
			</div>
			<div class="showHideDiv">
				<button id="reviewShowButton" class="showButton">더보기</button>
				<button id="reviewHideButton" class="hideButton" style="display: none;">줄여보기</button>
			</div>
			<form id="cookReviewForm">
				<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
				<input type="hidden" name="userid" value="${loginVo.userid}">
				<input type="hidden" name="m_picture" value="${loginVo.m_picture}">
				<input type="hidden" id="r_rating" name="r_rating">
				<div class="cookReviewInputDiv row">
					<div class="col-md-1">
						<img class="reviewImage" id="reviewImage"
							src="/resources/main_mypage/images/cook.png"> <input
							class="reviewUserImageFile" type="file" id="file3" name="file"
							style="display: none;">
					</div>
					<div class="col-md-10">
						<textarea rows="4" id="r_comment3" name="r_comment"
							class="reviewTextarea"></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="reviewButton" id="reviewButton">등록</button>
					</div>
				</div>
			</form>
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
							<span class="commentUser">이름</span> 
							<span class="commentDate">날짜</span>
							<span class="smallHr">|</span> 
							<a class="commentReply" href="#">답글</a>
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
				<button id="commentShowButton" class="showButton">더보기</button>
				<button id="commentHideButton" class="hideButton" style="display: none;">줄여보기</button>
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
		
		<div class="cookP" id="cookCommentAll">
			<span class="cookTitleP">태그</span>
			<span class="cookSecondTitleP">Tag</span>
			<div id="tagDiv">
				<c:forEach items="${tagList}" var="oneTag">
					<span class="oneTag">
						<span class="tagFront">#</span>
						<span class="tagName">${oneTag}</span>
					</span>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
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
			if(rData.length > 3){
				$("#commentShowButton").show();
			}
			$(".oneComment:gt(0)").remove();
			$.each(rData, function() {
				var oneCommentDiv = $(".oneComment").eq(0).clone();
				oneCommentDiv.show();
				var UserInfoDiv = oneCommentDiv.find(".UserInfoDiv");
				if(this.userid == "${loginVo.userid}") {
					UserInfoDiv.append('<span class="smallHr">|</span>');
					UserInfoDiv.append('<a class="commentDelete" href="#">삭제</a>');
				} else {
					UserInfoDiv.append('<span class="smallHr">|</span>');
					UserInfoDiv.append('<a class="commentDeclare" href="#">신고</a>');
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
				oneCommentDiv.find(".commentDeclare").attr("data-userid", this.userid);
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
		var loginUserid = "${loginVo.userid}";
		if(loginUserid != "" && loginUserid != null){
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
		}else{
			alert("로그인 해주세요.");
		}
	});
	
	//답글 완료 버튼
	$("#commentButton2").click(function() {
		var loginUserid = "${loginVo.userid}";
		if(loginUserid != "" && loginUserid != null){
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
		}else{
			alert("로그인 해주세요.");
		}
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
		var loginUserid = "${loginVo.userid}";
		if(loginUserid != "" && loginUserid != null){
			$("#modal-269785").trigger("click");
		}else{
			alert("로그인 해주세요.");
		}
		
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
			if(rData.length > 3){
				$("#reviewShowButton").show();
			}
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
			}
		} else if(!reviewState){
		//hide시키기
			for(var i = 4; i < recipeReviews.length; i++){
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
				if(i != 0) {
					modalImageRun(--i, rData);
				}
			});
			//오른쪽버튼
			$("#modalRightBtn").click(function() {
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
	$("#btnDelete").click(function(e) {
		e.preventDefault();
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result) {
			var link = $(this).attr("href");
			location.href = link;
		}
	});
	
	//신고 기타사유 text창 나오게하기
	$("#declare1009").click(function(){
		$("#declareExplain").show();
	});
	//신고 다른사유누르면 text창 다시 하이드
	$(".declare1009Hide").click(function(){
		$("#declareExplain").hide();
	});
	
	//댓글신고버튼
	$("#cookCommentDiv").on("click", ".commentDeclare", function(e) {
		e.preventDefault();
		$("#modal-534545").trigger("click");
			var r_cno = $(this).attr("data-r_cno");
			var criminal = $(this).attr("data-userid");
		
		$("#reciepCommentDeclareBtn").click(function() {
			var d_code = $('input:radio[name="declare"]:checked').val();
			var d_explain = $("#declareExplain").val();
			
			$("#declareForm").find("input#r_cno").val(r_cno);
			$("#declareForm").find("input#criminal").val(criminal);
			$("#declareForm").find("input#d_code").val(d_code);
			$("#declareForm").find("input#d_explain").val(d_explain);
			
			var form = $("#declareForm");
			var formData = new FormData(form[0]);
			var url = "/declare/insertRecipeCommentDeclare";
			
			$.ajax({
				"enctype" : "multipart/form-data",  
				"processData" : false,
				"contentType" : false,
				"url" : url,
				"method" : "post",
				"data" : formData,
				"success" : function(rData) {
					if(rData == "true") {
						alert("신고가 접수되었습니다.");
					}
				}
			});			
		});
	});
});
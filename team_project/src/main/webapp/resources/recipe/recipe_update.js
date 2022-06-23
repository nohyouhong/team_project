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
	$("#addIngredList").on("click", ".ingredRemove", function() {
		$(this).parent().parent().remove();
	});

	// 	요리스텝추가
	var index = "${fn: length(recipeStepVoList) + 1}";
	$("#addStep").click(
			function() {
				var cloneCookStepDiv = $(".addCookStepDiv").eq(0).clone();
				cloneCookStepDiv.show();
				cloneCookStepDiv.find("span").text("step" + index++);
				cloneCookStepDiv.find("textarea").val("");
				cloneCookStepDiv.find("img").attr("src",
						"/resources/main_mypage/images/plus.png");
				$("#addCookStepList").append(cloneCookStepDiv);
			});

	//  요리스텝삭제
	$("#addCookStepList").on("click", ".stepRemove", function() {
		var index2 = 0;
		var addCookStepList = $(this).parents("div#addCookStepList");
		// 		console.log(addCookStepList);
		$(this).parent().parent().remove();
		var addCookStepSpans = addCookStepList.find("span.cookStepTitle");
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

	});
	$("#mainFile").on("change", function() {
		// 		console.log(this.files);
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#mainCookImage").attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	// 	스텝요리사진넣기
	$("#addCookStepList").on("click", ".stepCookImage", function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log(file);
	});
	$("#addCookStepList").on("change", ".cookStepFile", function() {
		// 		console.log(this.files);
		var inputImg = $(this).parent().find("img");
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
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
		inputCheck();
		if (inputState) {
			var tags = $(".tagName");
			for (var i = 1; i < tags.length; i++) {
				var tag = $(".tagName").eq(i).text();
				console.log(tag);
				var tagHtml = "<input type='hidden' name='r_tags' value=" + tag + ">";
				$("#recipeForm").append(tagHtml);
			}
			//클론input삭제
			$(".addIngredDiv").eq(0).remove();
			$(".addCookStepDiv").eq(0).remove();
			var filenames = $("span.data-pictures");
			for(var i = 0; i < filenames.length; i++){
				var filename = $(filenames[i]).text();
				var inputHtml = '<input type="hidden" name="pictures" value="' + filename + '">';
				$("#recipeForm").append(inputHtml);
			}
			$("#recipeForm").submit();
		}
	});
	//빈값체크
	var inputState = false;
	var ingredState = false;
	var stepState = false;
	function inputCheck() {
		var r_title = $("#r_title").val();
		var r_explain = $("#r_explain").val();
		var f_code = $("#f_code").val();
		var r_time = $("#r_time").val();
		var r_level = $("#r_level").val();
		var addIngredDivs = $(".addIngredDiv");
		var ingredNames = $(".ingredName");
		var ingredAmounts = $(".ingredAmount");
		var addCookStepDivs = $(".addCookStepDiv");
		var stepContents = $(".stepContent");
		var r_cooktip = $("#r_cooktip").val();

		if (r_title == "") {
			alert("제목이 비어 있습니다.");
		} else if (r_explain == "") {
			alert("소개가 비어 있습니다.");
		} else if (f_code == "") {
			alert("카테고리를 선택해주세요.");
		} else if (r_time == "") {
			alert("카테고리를 선택해주세요.");
		} else if (r_level == "") {
			alert("카테고리를 선택해주세요.");
		} else if (addIngredDivs.length < 2) {
			alert("재료 내용이 하나도 없습니다.");
		} else if (addIngredDivs.length > 1) {
			for (var i = 1; i < addIngredDivs.length; i++) {
				var i_name = $(ingredNames[i]).val();
				var i_amount = $(ingredAmounts[i]).val();
				if (i_name == "" || i_amount == "") {
					alert(i + "번째 재료 내용이 비어 있습니다.");
					ingredState = false;
					break;
				} else {
					ingredState = true;
				}
			}
		}
		if (ingredState) {
			console.log("싱행1");
			if (addCookStepDivs.length < 2) {
				alert("레시피스탭 내용이 하나도 없습니다.");
			} else if (addCookStepDivs.length > 1) {
				for (var i = 1; i < addCookStepDivs.length; i++) {
					var r_content = $(stepContents[i]).val();
					if (r_content == "") {
						alert(i + "번째 요리 스탭내용이 비어 있습니다.");
						stepState = false;
						break;
					} else {
						stepState = true;
					}
				}
			}
		}
		if (stepState) {
			if (r_cooktip == "") {
				alert("요리팁이 비어 있습니다.");
			} else {
				inputState = true;
			}
		}
	}

	//재료등록
	var ingredInfoCreateState = false;
	$("#insertIngred").click(function() {
		$("#modal-520057").trigger("click");
			$("#ingredInsertBtn").click(function() {
				var i_name = $("#i_name").val();
				var i_address = $("#i_address").val();
				if(i_name == "") {
					alert("재료이름을 입력하세요.");
				}else if(i_address == ""){
					alert("재료의 나무위키 주소를 입력하세요.");
				} else{
					var form = $("#ingredInsertForm");
					var formData = new FormData(form[0]);
					var url = "/recipeboard/ingredInfoCreate";
					
					$.ajax({
						"enctype" : "multipart/form-data",  
						"processData" : false,
						"contentType" : false,
						"url" : url,
						"method" : "post",
						"data" : formData,
						"success" : function(rData) {
							if(rData == "true"){
								ingredInfoCreateState = true;
								alert(i_name + "를 등록했습니다.");
// 								console.log("아약스 안", ingredInfoCreateState);
							}
						}
					});
					//아약스 비동기라 셋타임아웃 안쓰면 밑에꺼랑 아약스안 함수랑 거의 동시에 실행
					setTimeout(function() {
// 						console.log("아약스 이후", ingredInfoCreateState);
						if(!ingredInfoCreateState){
							alert(i_name + "는 이미 등록되있습니다.");
						}
						ingredInfoCreateState = false;
						$("#i_name").val("");
						$("#i_unit").val("");
						$("#i_address").val("");
						var thats = $(".ingredName");
						$.each(thats, function(){
							var that = $(this);
							checkIngred(that);
						});
					}, 1000);
				}
			});
	});
	//재료칸에 이름적을때
	$("#addIngredList").on("change", ".ingredName", function(){
		var that = $(this);
		checkIngred(that);
	});
	//재료적은거 등록도잇는건지 확인
	function checkIngred(that) {
		var checkDiv = $(that).parent().parent().find("div.checkIngred"); 
		var ingredName = $(that).val();
		var url = "/recipeboard/checkIngredInfo";
		var sData = {
			"i_name" : ingredName
		};
		$.get(url, sData, function(rData) {
			if(rData == "true"){
				var checkResult = ingredName + "는 등록된 재료입니다.";
				checkDiv.text(checkResult);
				checkDiv.css("color", "#BEB6B6");
			} else{
				var checkResult = ingredName + "는 등록되지않은 재료입니다.";
				checkDiv.text(checkResult);
				checkDiv.css("color", "#F83801");
			}
		});
	}
});
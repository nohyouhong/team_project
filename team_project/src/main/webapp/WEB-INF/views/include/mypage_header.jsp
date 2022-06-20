<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#mainHeaderUserImage{
	width: 150px;
	height: 150px;
}
#mainHeaderForm{
	text-align: center;
}
</style>
<script>
$(function() {
	//메인헤더 이미지바꾸기
	$("#mainHeaderUserImage").click(function() {
		var inputFile = $("#mainHeaderUserImageFile");
		inputFile.trigger("click");
	});
	$("#mainHeaderUserImageFile").on("change", function(){
    	if (this.files && this.files[0]) {
       		var reader = new FileReader();
    			reader.onload = function (e) {
    			$("#mainHeaderUserImage").attr("src", e.target.result);
    			}
            reader.readAsDataURL(this.files[0]);
    	}
    	$("#mainHeaderFormBtn").show();
    });
	$("#mainHeaderFormBtn").click(function() {
		var form = $("#mainHeaderForm");
		var formData = new FormData(form[0]);
		var url = "/member/uploadFile";
		$.ajax({
			"enctype" : "multipart/form-data",  
			"processData" : false,
			"contentType" : false,
			"url" : url,
			"method" : "post",
			"data" : formData,
			"success" : function(rData) {
				console.log(rData);
				var url2 = "/member/updateUserImage";
				var sData = {
						"filename" : rData
				}
				$.post(url2, sData, function(rData2){
						console.log(rData2);
				});
			}
		});
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-top: 50px;">

			<!-- partial -->
			<div class="container-fluid">
				<div class="row row-offcanvas row-offcanvas-right">
					<!-- partial:partials/_sidebar.html -->
					<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
						<div class="user-info">
<%-- 						${loginVo } --%>
							<form id="mainHeaderForm">
								<img id="mainHeaderUserImage" class="rounded-circle" src="/member/displayImage?filename=${loginVo.m_picture}">
								<input style="display: none;" type="file" id="mainHeaderUserImageFile" name="file" class="mainHeaderUserImageFile"/>
								<button type="button" id="mainHeaderFormBtn" style="display: none;">수정하기</button>
							</form>
							<p class="name">${loginVo.username}</p>
							<p class="designation">Manager</p>

						</div>
						<ul class="nav">
<!-- 							<li class="nav-item"> -->
<!-- 								<a class="nav-link menuEx" href="index.html"> -->
<!-- 									<span class="attendance">  -->
<!-- 										<span>2</span><br> <span>이번달 출석</span> -->
<!-- 									</span>  -->
<!-- 									<span class="attendance">  -->
<!-- 										<span>102</span><br> <span>총누적 출석</span> -->
<!-- 									</span> -->
<!-- 								</a> -->
<!-- 							</li> -->
							<li class="nav-item">
								<a class="nav-link menuEx" href="/message/receive_list?page=1"> 
									<span class="menu-title">쪽지함</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="/member/point_list?userid=${loginVo.userid }"> 
									<span class="menu-title">포인트 내역</span>
								</a>
							</li>
<!-- 							<li class="nav-item"> -->
<!-- 								<a class="nav-link menuEx" href="#">  -->
<!-- 									<span class="menu-title">내 정보 수정</span> -->
<!-- 								</a> -->
<!-- 							</li> -->
							<li class="nav-item">
								<a class="nav-link menuEx" href="/ask/ask_list"> 
									<span class="menu-title">1:1문의</span>
								</a>
							</li>
						</ul>
					</nav>
					<!-- partial -->
					<div class="content-wrapper bg-white">
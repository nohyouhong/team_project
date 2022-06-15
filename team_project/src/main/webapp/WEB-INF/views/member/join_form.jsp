<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<script>
$(document).ready(function(){
	$("#profileImg").on("click", ".commentImage", function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
		console.log(file);
	});
	$("#joinImage").on("change", ".joinImageFile", function() {
		var inputImg = $(this).parent().find("img");
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				inputImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
});
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="col-md-12 myjoinForm">
				<form id="join_form" role="form" action="/member/" method="post">
					<div class="form-group" id="profileImg">
<!-- 						<label for="exampleInputFile" id="filename">프로필 사진</label>  -->
						<img class="joinImage" id="joinImg" src="/resources/login_join/images/join.png">
						<input class="joinImageFile" type="file" id="file3" name="file"
							style="display: none;">
						<input type="file" class="form-control-file" id="file" name="file"/><br>
						<p class="help-block" id="filecomment">프로필 사진을 등록해주세요.</p>
					</div>
					
					<div class="form-group">
						<label for="userid" id="userid">아이디</label> 
						<input type="text" class="form-control" name="userid" />
						<button type="button" class="btn btn-outline-secondary" id="overlapIdCheckBtn">아이디 중복확인</button>
					</div>

					<div class="form-group">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" name="userpw" />
					</div>

					<div class="form-group">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" />
					</div>

					<div class="form-group">
						<label for="username" id="username">이름</label> 
						<input type="text" class="form-control" name="username" />
					</div>

					<div class="form-group">
						<label for="email" id="email">이메일</label> 
						<input type="email" class="form-control" name="email" />
					</div>

					<div class="form-group">
						<label for="gender" id="gender">성별</label>
						<div id="genderRadio">
						<input type="radio" class="gender" name="gender" value="M" /><p id="genderMan">남</p> 
						<input type="radio" class="gender" name="gender" value="F" /><p id="genderWoman">여</p>
						</div> 
					</div>

					
						<button type="submit" class="btn btn-outline-danger">가입하기</button>
				</form>
			</div>
			<div id="join_bottom"></div>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
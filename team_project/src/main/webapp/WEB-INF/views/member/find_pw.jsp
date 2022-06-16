<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<script>
$(document).ready(function(){
	
		
});
</script>
<div class="container-fluid window">
	<div class="row">
			<div class="col-md-12 myjoinForm">
				<div id="joinTitle">
					<form id="joinTitleForm">
						<img class="joinImage" id="writeImg" src="/resources/login_join/images/jointitle.png">
					</form>
				</div>
				<form id="join_form" role="form" action="/member/join_run" method="post">
					<div class="form-group" id="profileImg">
						<img class="joinImage" id="joinImg" src="/resources/login_join/images/join.png">
						<input class="joinImageFile" type="file" id="file" name="file"
							style="display: none;">
					</div>
					<p class="help-block" id="filecomment">프로필 사진을 등록해주세요.</p>
					<div class="join-form">
						<label for="userid" id="useridlabel">아이디</label> 
						<input type="text" class="form-control" name="userid" id="userid" placeholder="숫자와 영어로 4~10글자"/>
						<div id="checkdiv">
							<button type="button" class="btn btn-outline-secondary" id="overlapIdCheckBtn">아이디 중복확인</button>
							<span id="idChk"></span>
						</div>
					</div>

					<div class="join-form">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" name="userpw" id="userpwInput" placeholder="영어와 숫자를 포함해서 6~14글자"/>
						<span id="pwChk"></span>
					</div>

					<div class="join-form">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpwInputCheck" placeholder="위의 비밀번호와 일치하게 작성"/>
						<span id="pwSameChk"></span>
					</div>

					<div class="join-form">
						<label for="username" id="username">이름</label> 
						<input type="text" class="form-control" name="username" id="usernameInput"/>
					</div>
					<div class="join-form">
						<label for="email" id="email">이메일</label> 
						<div id="emailDiv">
							<input type="hidden" name="email" id="totalemail">
							<input type="text" class="form-control" name="email1" id="emailIdInput" /><span id="emailB">@</span>
							<input type="text" class="form-control" name="email2" id="emailAdInput" disabled/>
							<select name="email3" id="email3">
								<option value=''>메일 선택</option>
								<option value='9'>직접 입력하기</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
					</div>

					<div class="join-form">
						<label for="gender" id="gender">성별</label>
						<div id="genderRadio">
						<input type="radio" class="gender" name="gender" value="M" /><p id="genderMan">남</p> 
						<input type="radio" class="gender" name="gender" value="F" /><p id="genderWoman">여</p>
						</div> 
					</div>
						<button type="button" class="btn btn-outline-danger" id="joinBtn">가입하기</button>
						<span id="joinBtnSpan"></span>
				</form>
			</div>
			<div id="join_bottom"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
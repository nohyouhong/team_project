<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<link rel="stylesheet" href="/resources/user_info/user_info.css" type="text/css">
<div class="container-fluid window">
	<div class="row">
			<div class="col-md-12 myjoinForm">
				<form id="info-form" role="form" action="/member/member_modify" method="post">
					<div class="join-form">
						<label for="userid" id="useridlabel">아이디</label> 
						<input type="text" class="form-control" name="userid" id="userid" value="${memberVo.userid}" disabled="disabled"/>
					</div>

					<div class="join-form">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" name="userpw" id="userpwInput" />
						<span id="pwChk"></span>
					</div>

					<div class="join-form">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpwInputCheck" placeholder="위의 비밀번호와 일치하게 작성"/>
						<span id="pwSameChk"></span>
					</div>

					<div class="join-form">
						<label for="username" id="username">이름</label> 
						<input type="text" class="form-control" name="username" id="usernameInput" value="${memberVo.username}"/>
					</div>
					<div class="join-form">
						<label for="cellphone" id="cellphone">폰번호</label> 
						<div id="cellphonediv">
							<input type="hidden" name="cellphone" id="totalPhoneNum">
							<input type="text" class="form-control" id="cellphoneInput1" value="010" disabled/>-
							<input type="text" class="form-control" id="cellphoneInput2"/>-
							<input type="text" class="form-control" id="cellphoneInput3"/>
						</div>
						<button type="button" class="btn btn-outline-secondary" id="overlapPhoneCheckBtn">폰번호 중복확인</button>
						<span id="phoneChk"></span>
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
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
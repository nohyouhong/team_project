<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<style>
.findIdDiv {
	border:medium ridge rgb(255,227,219);
	border-radius:5px;
	box-shadow: 10px 5px 5px rgb(255,227,219);
	padding:15px 10px 15px 10px;
	font-family: jua;
	width: 600px;
    margin: 0 auto;
}

.findResult {
	margin-top: 10px;
	font-size: 15px;
	font-family: jua;
}
.resultTxt {
	font-size: 25px;
}
#namediv{
	border-top:solid 1px rgb(255,227,219);
	padding-top:10px;
}
.findIdbtn{
	border-radius:5px;
}
#findIddiv{
	margin-top:25px;
	margin-bottom:10px;
	text-align:right;
}
#id_hr{
	width:480px;
}
</style>
<script>
$(document).ready(function(){
	$(".selectMethod").on("change", function(){
		var findMethod = $(this).val()
		console.log("findMethod: ", findMethod);
		if (findMethod == "email") {
			$(".username").val("");
			$("#cellphone").val("");
			$(".findResult").hide();
			$("#findByEmailDiv").show();
			$("#findByCellphoneDiv").hide();
		} else if (findMethod == "cellphone") {
			$(".username").val("");
			$("#email").val("");
			$(".findResult").hide();
			$("#findByEmailDiv").hide();
			$("#findByCellphoneDiv").show();
		}
	});
	$(".findIdbtn").click(function(e){
		e.preventDefault();
		var username = $(".username").val();
		var email = $("#email").val();
		var cellphone = $("#cellphone").val().trim();
		console.log("username: " + username);
		console.log("email: " + email);
		console.log("cellphone: ", cellphone);
		var url = "/member/find_id_run";
		var sData = {
				"username" : username, 
				"email" : email, 
				"cellphone" : cellphone
		};
		$.post(url, sData, function(rData){
			console.log("rData: " + rData)
			if (rData == "") {
				alert("입력한 정보와 일치하는 계정이 없습니다.");
			} else {
				$(".resultTxt > li").remove();
				for (var i = 0; i < rData.length; i++) {
					$(".resultTxt").append("<li>" + rData[i] + "</li>");
				}
				$(".findResult").show();
			}
		});
	});	
});
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
				<h3>아이디 찾기</h3>
				<hr id="id_hr">
				<p>아이디를 찾는 방법을 선택해주세요</p>
			<div class="findIdDiv">
				<input type="radio" name="selectMethod" class="selectMethod" value="email" checked>
					<label for="selectMethod"> 가입시 등록한 이메일로 찾기</label><br>
				<input type="radio" name="selectMethod" class="selectMethod" value="cellphone">
					<label for="selectMethod"> 가입시 등록한 휴대폰번호로 찾기</label>
				<div class="form-group" id="namediv">
					<label for="username">이름</label>
					<input type="text" class="form-control username"/>
				</div>
				<div class="findIdByEmail">					
					<div id="findByEmailDiv">
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="text" class="form-control" id="email"/>
						</div>
					</div>
				</div>
				<div class="findIdByCellphone">
					<div id="findByCellphoneDiv" style="display: none">
						<div class="form-group">
							<label for="cellphone">휴대폰 번호</label>
							<input type="text" class="form-control" id="cellphone"/>
						</div>
					</div>
				<div class="form-group" id="findIddiv">
					<a class="btn btn-outline-danger findIdbtn">아이디 찾기</a>
				</div>
				</div>
				<div class="findResult" style="display: none;">
					<div class="resultTxt">
						<span>회원님이 보유하고 있는 아이디 목록 입니다.</span>
					</div>
					<div>
						<a href="/member/find_pw_form">비밀번호 찾기</a>
						<a href="/member/login_form">로그인창으로 이동</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>

<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<style>
.deleteMemberPwDiv {
	border:medium ridge rgb(255,227,219);
	border-radius:5px;
	box-shadow: 10px 5px 5px rgb(255,227,219);
	padding:15px 10px 10px 10px;
	font-family: jua;
	width: 300px;
	margin: 0 auto;
}
.userpwchk{
	font-family: "Poppins", sans-serif;
    font-size: 12px;
}
.deletebtn, .closebtn, #deletemember{
 	border-radius:10px;
 	 
}
</style>
<script>
$(document).ready(function(){
	$("#deletemember").click(function(){
		var userpw = "${loginVo.userpw}";
		var userpwck = $(".userpwchk").val();
		console.log(userpw);
		if(userpw == userpwck){
			$("#modal-444695").click();
			$("#deleteBtn").click(function(){
				$("#deleteUserForm").submit();
			});
		}else{
			alert("비밀번호를 정확히 입력해주세요");
		}
	});
}); // script
</script>
<!-- 모달창 -->
<a id="modal-444695" href="#modal-container-444695" role="button"
	class="btn" data-toggle="modal" style="display:none;">회원삭제 확인창</a>

<div class="modal fade" id="modal-container-444695" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">탈퇴 확인창</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">탈퇴하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-danger deletebtn" id="deleteBtn">탈퇴
				</button>
				<button type="button" class="btn btn-outline-secondary closebtn" data-dismiss="modal">
					닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid window">
	<div class="row">
		<div class="col-md-12">
			<form id="deleteUserForm" action="/member/user_delete" method="get">
				<input type="hidden" value="${loginVo.userid}" name="userid">
				<div class="deleteMemberPwDiv">
					<h3>회원탈퇴</h3>
					<p>현재비밀번호를 입력해주세요.</p>
					<hr>
					<div class="form-group">
						<label for="userpw">비밀번호입력</label>
						<input type="password" class="form-control userpwchk" name="userpwInput"/>
					</div>
					<div class="form-group">
						<button class="btn btn-outline-secondary" type="button" id="deletemember">탈퇴하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
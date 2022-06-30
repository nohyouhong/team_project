<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">
<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">
<script>
$(document).ready(function(){
	$("#submitBtn").click(function(){
		if($("#i_title").val() == ""){
			alert("문의 제목을 입력해주세요");
		}else if($("#message").val() == ""){
			alert("문의 내용을 입력해주세요");
		}else{
			$("#frmCreate").submit();
		}
	});
});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div>
					<img id="cus_img3" src="/resources/customer_center/images/QnA.png"
						alt="고객센터이미지">
					<h2 id="iquiryh2">${inquiryVo.userid}의 문의 답글작성</h2>
				</div>
				<div id="read-title-writer">
					<div class="form-group message_read text-left" id="read-title">
						문의 제목 <input type="text" class="form-control" id="receiver"
							value="${inquiryVo.i_title}" readonly />
					</div>
					<div class="form-group message_read text-left" id="read-writer">
						작성자 <input type="text" class="form-control" id="writer"
							value="${inquiryVo.userid}" readonly />
					</div>
				</div>
				<div class="form-group message_read text-left">
					내용
					<textarea class="form-control" id="message" name="message"
						rows="8" readonly>${inquiryVo.i_content}</textarea>
				</div>
				<hr>
				<form role="form" action="/inquiry/inquiryAdminReplyRun" method="post" id="frmCreate">
				<input type="hidden" name="userid" value="${loginVo.userid}">
				<input type="hidden" name="re_group" value="${inquiryVo.re_group}">
				<input type="hidden" name="i_bno" value="${inquiryVo.i_bno}">
					<div id="read-title-writer">
						<div class="form-group message_read text-left" id="read-title2">
							답글 제목
							<input type="text" class="form-control" name="i_title" value="[re:]" id="i_title"/>
						</div>
					</div>
					<div class="form-group message_read text-left">
						답글 내용 
						<textarea class="form-control" id="message" name="i_content" rows="8"></textarea>
					</div>
					<div id="inquirysend">
						<a href="/inquiry/inquiry_admin_list" class="btn btn-outline-warning">목록으로</a>
						<button type="button" class="btn btn-outline-danger">답글등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/admin_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
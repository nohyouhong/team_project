<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>

<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">

<script>
$(document).ready(function(){
	var frmPaging = $("#frmPaging");
	
	$("#inquiry_del_btn").click(function(e){
		e.preventDefault();
		var a_bno  = $(this).attr("href");
		frmPaging.find("input[name=a_bno]").val(a_bno);
		frmPaging.attr("action", "/inquiry/inquiry_delete");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div>
					<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
					<h2 id="iquiryh2">나의 문의 내역</h2>
						<div id="inquirysend">
							<a href="/inquiry/inquiry_list" class="btn btn-outline-warning">목록으로</a>
						</div>
					</div>
					<form role="form">
					<a href="${inquiryVo.a_bno}" class="btn btn-sm btn-outline-danger" id="inquiry_del_btn">
						삭제하기
					</a>
					<div class="form-group message_read text-left" id="message_read">
							문의 제목
							<input type="text" class="form-control" id="receiver"
							value="${inquiryVo.a_title}" readonly />
					</div>
					<div class="form-group message_read text-left">
						 내용 
						<textarea class="form-control" id="message" name="message" rows="8"
							 readonly >${inquiryVo.a_content}</textarea>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
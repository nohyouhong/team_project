<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">
<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">

<script src="/resources/js/myscript.js"></script>

<div class="row">
	<div class="col-md-12" id="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<div class="cus-info">
							<a href="/customer/customer_center">
							<img id="cus_img2" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<form role="form" method="post" action="/inquiry/inquiry_run" id="frmCreate">
						<input type="hidden" value="${loginVo.userid}" name="userid">
						<span id="notice_top">문의글 작성</span>
						
						<hr>
							<div class="form-group inq">
								<b>문의 제목</b><input type="text" class="form-control" name="i_title" />
							</div>
							<div class="form-group inq">
								<b>문의 내용</b><textarea class="form-control" name="i_content" rows="20"></textarea>
							</div>
							<div id="ask_submit">
								<button type="submit" class="btn btn-outline-warning">문의등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
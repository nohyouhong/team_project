<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<c:choose>
	<c:when test="${loginVo.m_code == 101}">
		<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
	</c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>

<link rel="stylesheet" href="/resources/customer_center/ask.css" type="text/css">

<style>
.askImage{
	width: 150px;
	height: 150px;
}
</style>
<script>
$(document).ready(function(){
	var frmPaging = $("#frmPaging");
	
	$("#ask_del_btn").click(function(e){
		e.preventDefault();
		var a_bno  = $(this).attr("href");
		frmPaging.find("input[name=a_bno]").val(a_bno);
		frmPaging.attr("action", "/ask/ask_delete");
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
					<c:choose>
						<c:when test="${loginVo.m_code == 101}">
							<h2 class="iquiryh2">1:1 문의 내역</h2>
						</c:when>
						<c:otherwise>
							<h2 class="iquiryh2">나의 문의 내역</h2>
						</c:otherwise>
					</c:choose>
						<div id="asksend">
							<c:choose>
								<c:when test="${loginVo.m_code == 101}">
									<a href="/ask/ask_admin_list?page=${param.page}&perPage=${param.perPage}"
										class="btn btn-outline-warning">목록으로</a>
									<a href="/ask/askReplyForm?a_bno=${askVo.a_bno}" class="btn btn-outline-primary">답글달기</a>
								</c:when>
								<c:otherwise>
									<a href="/ask/ask_list" class="btn btn-outline-warning">목록으로</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<form role="form">
					<a href="${askVo.a_bno}" class="btn btn-sm btn-outline-danger" id="ask_del_btn">
						삭제하기
					</a>
					<div id="read-title-writer">
						<div class="form-group message_read text-left" id="read-title">
							문의 제목
							<input type="text" class="form-control" id="receiver"
							value="${askVo.a_title}" readonly />
						</div>
						<div class="form-group message_read text-left" id="read-writer">
							작성자
							<input type="text" class="form-control" id="writer"
							value="${askVo.writer}" readonly />
						</div>
					</div>
					<div class="form-group message_read text-left">
						 내용 
						<textarea class="form-control" id="message" name="message" rows="8"
							 readonly >${askVo.a_content}</textarea>
					</div>
				</form>
				</div>
			</div>
		</div>
		<div>
			<c:forEach items="${askImages}" var="askImage">
				<p>첨부한 이미지 파일</p>
				<img class="askImage" src="/ask/displayImage?filename=${askImage}">
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
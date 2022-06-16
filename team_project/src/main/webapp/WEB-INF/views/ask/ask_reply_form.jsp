<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/ask.css" type="text/css">
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div>
					<div>
					<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
						<h2 id="iquiryh2">1:1 문의 답글쓰기</h2>
						<a href="/ask/ask_admin_list" class="btn btn-outline-warning">목록으로</a>
					</div>
				<form role="form" action="/ask/askReplyRun" method="post">
					<input type="hidden" name="writer" value="${loginVo.userid}">
					<input type="hidden" name="re_group" value="${askVo.re_group}">
					<input type="hidden" name="a_bno" value="${askVo.a_bno}">
					<div id="read-title-writer">
						<div class="form-group message_read text-left" id="read-title">
							문의 제목
							<input type="text" class="form-control"
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
						<textarea class="form-control" id="message"  rows="8"
							 readonly >${askVo.a_content}</textarea>
					</div>
					<div class="form-group inq" id="reply-title">
						답글 제목
						<input type="text" class="form-control" name="a_title" value="[re]"/>
					</div>
					<div class="form-group inq">
						답글 내용
						<textarea class="form-control" name="a_content" rows="20"></textarea>
					</div>
					<div id="ask_submit">
						<button type="submit" class="btn btn-outline-warning">답글등록</button>
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
<%@ include file="/WEB-INF/views/include/admin_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
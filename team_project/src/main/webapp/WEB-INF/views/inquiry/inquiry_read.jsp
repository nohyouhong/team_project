<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">
<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">
<div class="row">
	<div class="col-md-12" id="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<div class="cus-info">
							<a href="/customer/customer_center"> <img id="cus_img"
								src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
							</a>
						</div>
					</div>
					<div class="col-md-9">
						<div class="faq">
							<ul class="teb_lst">
								<li><a href="/customer/customer_center">자주묻는질문</a></li>
								<li><a href="/customer/agreement">이용약관</a></li>
								<li><a href="/customer/rules">개인정보취급방침</a></li>
								<li><a href="/customer/notice">공지사항</a></li>
								<li class="on"><a href="/inquiry/inquiry_list">문의게시판</a></li>
							</ul>
						</div>
						<div id="inquirysend">
							<a href="/inquiry/inquiry_list" class="btn btn-outline-warning">목록으로</a>
							<c:if test="${loginVo.m_code == 101}">
								<a href="/inquiry/inquiryReplyForm?i_bno=${inquiryVo.i_bno}" class="btn btn-outline-primary">답글달기</a>
							</c:if>
							<c:if test="${loginVo.userid == inquiryVo.userid}">
								<a href="/inquiry/inquiry_delete?i_bno=${inquiryVo.i_bno}" class="btn btn-sm btn-outline-danger" id="inquiry_del_btn">
									삭제하기
								</a>
							</c:if>
						</div>
							<div id="read-title-writer">
								<div class="form-group message_read text-left" id="read-title">
									문의 제목
									<input type="text" class="form-control" id="receiver"
									value="${inquiryVo.i_title}" readonly />
								</div>
								<div class="form-group message_read text-left" id="read-writer">
									작성자
									<input type="text" class="form-control" id="writer"
									value="${inquiryVo.userid}" readonly />
								</div>
							</div>
							<div class="form-group message_read text-left">
								 내용 
								<textarea class="form-control" id="message" name="message" rows="8"
									 readonly >${inquiryVo.i_content}</textarea>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/inquiry.css" type="text/css">

<script>

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
							<a id="btnWriteMessage" href="/inquiry/inquiry_form" class="btn btn-outline-success">1:1문의하기</a>
						</div>
					</div>
					<table class="table inquiry_table">
						<thead>
							<tr>
								<th>#</th>
								<th>문의제목</th>
							<c:if test="${loginVo.m_code == 101}">
								<th>작성자</th>
							</c:if>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="inquiryVo" items="${inquiryList}" varStatus="inquiry_status">
							<tr class="tr_list">
								<td>${inquiry_status.count}</td>
								<td class="td_list">${inquiryVo.a_title}</td>
							<c:if test="${loginVo.m_code == 101}">
								<td>${inquiryVo.userid}</td>
							</c:if>
								<td>${inquiryVo.a_regdate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
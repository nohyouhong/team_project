<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>

<style>
	tr.tr_list{
		cursor: pointer;
	}
	
	tr.tr_list:hover{
		background-color: rgb(255,227,219);
	}
	#msg_list{
		margin-top:100px;
	}
	#msg_paging{
		margin-top:30px;
	}
	th{
		background-color: #eeffde;
	}
	#cus_img{
		height:50px;
	}
	#iquiryh2{
		margin-left:50px;
	}
</style>

<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div>
					<img id="cus_img" src="/resources/customer_center/images/QnA.png" alt="고객센터이미지">
					<h2 id="iquiryh2">나의 문의 내역</h2>
					</div>
					${inquiryList}
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>문의제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="inquiryVo" items="${inquiryList}" varStatus="inquiry_status">
							<tr class="tr_list">
								<td>${inquiry_status.count}</td>
								<td class="td_list">${inquiryVo.a_title}</td>
								<td>${inquiryVo.userid}</td>
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
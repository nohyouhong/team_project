<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="tabbable" id="tabs-667120">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active show"
					href="#tab1" data-toggle="tab">받은 쪽지함</a></li>
				<li class="nav-item"><a class="nav-link" href="#tab2"
					data-toggle="tab">보낸 쪽지함</a></li>
			</ul>
			<div class="tab-content">
<!-- 				<div class="tab-pane active" id="panel-489324"> -->
				<div class="tab-pane active" id="tab1">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>내용</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="messageVo" items="${receive_messagelist}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${messageVo.message}</td>
								<td>${messageVo.receiver}</td>
								<td>
								<c:choose>
									<c:when test="${empty messageVo.opendate}">
										읽지않음
									</c:when>
									<c:otherwise>
										${memberVo.opendate}
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="tab2">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>내용</th>
								<th>받는사람</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="messageVo" items="${send_messagelist}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${messageVo.message}</td>
								<td>${messageVo.sender}</td>
								<td>${messageVo.senddate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- 페이징 -->
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<body>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="tabbable" id="tabs-667120">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active show"
					href="#tab1" data-toggle="tab">포인트 획득 내역</a></li>
				<li class="nav-item"><a class="nav-link" href="#tab2"
					data-toggle="tab">포인트 사용 내역</a></li>
			</ul>
			<div class="tab-content">
<!-- 				<div class="tab-pane active" id="panel-489324"> -->
				<div class="tab-pane active" id="tab1">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>획득 내용</th>
								<th>아이디</th>
								<th>획득 날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>01/04/2012</td>
								<td>Default</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="tab2">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>사용 내용</th>
								<th>아이디</th>
								<th>사용 날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>01/04/2012</td>
								<td>Default</td>
							</tr>
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
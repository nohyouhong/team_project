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
		background-color: aliceblue;
	}
	#pointdiv{
		margin:auto;
		display:flex;
	}
	.pointh5{
		margin:60px auto 50px auto;
	}
	#betweenh5{
		border-right:1px solid #DFD9D8;
		height:150px;
		margin:10px auto 10px auto;
	}
</style>

<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div class="col-md-6" id="pointdiv" style="display: none;">
				
				<h5 class="pointh5">현재 포인트</h5>
				<div id="betweenh5"></div>
				<h5 class="pointh5">누적 포인트</h5>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active show"
					href="#tab1" data-toggle="tab">포인트 획득 내역</a></li>
				<li class="nav-item"><a class="nav-link" href="#tab2"
					data-toggle="tab">포인트 사용 내역</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>포인트 획득 사유</th>
								<th>포인트</th>
								<th>포인트 획득 날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="pointVo" items="${point_list}" varStatus="getPoint_status">
							<c:if test="${pointVo.p_code != 1004}">
								<tr class="tr_list">
									<td>${getPoint_status.count}</td>
									<td class="td_list">${pointVo.p_desc}</td>
									<td>${pointVo.point}</td>
									<td>${pointVo.p_regdate}</td>
								</tr>
							</c:if>
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
							<c:forEach var="pointVo" items="${point_list}" varStatus="usePoint_status">
								<c:if test="${pointVo.p_code == 1004}">
									<tr class="tr_list">
										<td>${usePoint_status.count}</td>
										<td class="td_list">${pointVo.p_desc}</td>
										<td>${pointVo.point}</td>
										<td>${pointVo.p_regdate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 페이징 -->
<!-- <div class="row" id="point_paging"> -->
<!-- 	<div class="col-md-2"></div> -->
<!-- 	<div class="col-md-8"> -->
<!-- 		<nav> -->
<!-- 			<ul class="pagination justify-content-center"> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!-- 				<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->
<!-- 	</div> -->
<!-- 	<div class="col-md-2"></div> -->
<!-- </div> -->
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
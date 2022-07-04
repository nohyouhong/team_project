<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		border: medium ridge aliceblue;
		border-radius:5px;
	}
	.pointh5{
		margin:20px auto 20px auto;
	}
	#betweenh5{
		border-right:1px solid #DFD9D8;
		height:150px;
		margin:10px auto 10px auto;
	}
	#pointdiv{
		display:flex;
		margin-bottom:50px;
	}
	.pointspan{
		font-size:50px;
	}
	.pit{
		text-align: center;
	}
	#pointdiv1{
		border-right:1px dashed #dee2e6;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-667120">
			<div id="pointdiv">
				<div class="col-md-6 pit" id="pointdiv1">
					<h5 class="pointh5">현재 포인트</h5>
					<span class="pointspan"><fmt:formatNumber value="${nowPoint}" type="number" maxFractionDigits="3"/></span>
				</div>
				<div class="col-md-6 pit">
					<h5 class="pointh5">누적 포인트</h5>
					<span class="pointspan"><fmt:formatNumber value="${allPoint}" type="number" maxFractionDigits="3"/></span>
				</div>
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
									<td><fmt:formatNumber value="${pointVo.point}" type="number" maxFractionDigits="3"/></td>
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
								<th>포인트</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pointVo" items="${point_list}" varStatus="usePoint_status">
								<c:if test="${pointVo.p_code == 1004}">
									<tr class="tr_list">
										<td>${usePoint_status.count}</td>
										<td class="td_list">${pointVo.p_desc}</td>
										<td><fmt:formatNumber value="${pointVo.point}" type="number" maxFractionDigits="3"/></td>
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
<div class="row" id="point_paging">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link column_paging_prev" href="/column/column_list?page=${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li 
					<c:choose>
						<c:when test="${v == param.page}">
							class="page-item active"
						</c:when>
						<c:otherwise>
							class="page-item"
						</c:otherwise>
					</c:choose>
				>
					<a class="page-link column_paging" href="/column/column_list?page=${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link column_paging_next" href="/column/column_list?page=${pagingDto.endPage + 1}">다음</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
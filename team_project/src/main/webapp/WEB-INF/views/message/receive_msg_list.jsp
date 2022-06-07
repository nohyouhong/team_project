<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<style>
	tr.tr_list{
		cursor: pointer;
	}
	
	tr.tr_list:hover{
		background-color: aliceblue;
		cursor: pointer;
	}
	#msg_list{
		margin-top:100px;
	}
	#msg_paging{
		margin-top:30px;
	}
	th{
 		background-color: rgb(255,227,219); 
	}
</style>
<script>
$(document).ready(function(){
	var frmpaging = $("#frmPaging");
	$(".td_list").click(function(){
		var mno = $(this).attr("data-mno");
		frmpaging.find("input[name=mno]").val(mno);
		frmpaging.attr("action", "/message/message_read");
		frmpaging.attr("method", "get");
		frmpaging.submit();
	});
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/message/send_msg_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
});
</script>
<%-- ${messageList} --%>
	<div class="row" id="msg_list">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-680374">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" href="#">받은 쪽지함</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/message/send_list?page=1">보낸쪽지함</a>
					</li>
				</ul>
			</div>
			<table class="table">
				<thead>
				<tr>
					<th>#</th>
					<th>내용</th>
					<th>보낸사람</th>
					<th>날짜</th>
				</tr>
			</thead>
				<tbody>
				<c:forEach var="messageVo" items="${receive_list}" varStatus="status">
					<tr class="tr_list">
						<td>${status.count}</td>
						<td class="td_list" data-mno="${messageVo.mno}">${messageVo.message}</td>
						<td>${messageVo.receiver}</td>
						<td>
						<c:choose>
							<c:when test="${empty messageVo.opendate}">
								읽지않음
							</c:when>
							<c:otherwise>
								${messageVo.opendate}
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		${pagingDto}
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li class="page-item">
					<a class="page-link" href="${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.endPage +1}">다음</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
	</div>
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
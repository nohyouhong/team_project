<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<style>
	tr.tr_list{
		cursor: pointer;
	}
	
	tr.tr_list:hover{
		background-color: aliceblue;
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
	});
</script>

<div class="row" id="msg_list">
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
							<tr class="tr_list">
								<td>${status.count}</td>
								<td class="td_list"  data-mno="${messageVo.mno}">${messageVo.message}</td>
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
							<tr class="tr_list">
								<td>${status.count}</td>
								<td class="td_list"  data-mno="${messageVo.mno}">${messageVo.message}</td>
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
<div class="row" id="msg_paging">
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

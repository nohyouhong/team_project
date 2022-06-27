<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<style>
tr.tr_list {
	cursor: pointer;
}

tr.tr_list:hover {
	background-color: aliceblue;
	cursor: pointer;
}

#msg_list {
	margin-top: 20px;
}

#msg_paging {
	margin-top: 30px;
}

th {
	background-color: rgb(255, 227, 219);
}

#p {
	text-align: left;
	font-size: 15px;
}

#modal-693650 {
	text-align: left;
}

#msgsend {
	float: right;
}
</style>
<script>
$(document).ready(function(){
	var frmPaging = $("#frmPaging");
	$(".td_list").click(function(){
		var mno = $(this).attr("data-mno");
		frmPaging.find("input[name=mno]").val(mno);
		frmPaging.attr("action", "/message/message_read");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	$("a.page-link").click(function(e){
		e.preventDefault();
		var page = $(this).attr("href");
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/message/send_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	$("#perPage").change(function(){
		var perPage = $(this).val();
		console.log(perPage);
		frmPaging.find("input[name=perPage]").val(perPage);
		frmPaging.attr("action", "/message/send_msg_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	$("#btnMsgSend").click(function(){
		var message = $("#message").val();
		var receiver = $("#rec").val();
		var sender = "user01";
		var sData = {
				"message" : message,
				"receiver"  : receiver,
				"sender"  : sender
		};
		var url = "/message/sendMessage";
		$.post(url, sData, function(rData){
			console.log(rData);
			$("#modalX").trigger("click");
	 	});
	});
	
	$("#btnWriteMessage").click(function() {
		$("#modal-693650").trigger("click");
	});
});
</script>
<div class="row">
	<div class="col-md-12">
		<div id="msgsend">
			<a id="btnWriteMessage" class="btn btn-outline-danger">쪽지쓰기</a>
		</div>
		<div class="modal fade" id="modal-container-693650" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<a id="modal-693650" href="#modal-container-693650" role="button"
			class="btn btn-outline-danger" data-toggle="modal" style="display:none;">쪽지쓰기</a>
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지쓰기창</h5>
						<button type="button" class="close" data-dismiss="modal" id="modalX">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<p id="p">받는 사람</p>
						<input type="text" class="form-control" id="rec" placeholder="받는사람 아이디">
						<p id="p">보낼 내용</p>
						<textarea class="form-control" id="message" placeholder="내용을 적어주세요(150글자이내)" rows="4"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnMsgSend">보내기</button>
						<button type="button" class="btn btn-secondary" id="btnMsgClose"
							data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
<%-- ${messageList} --%>
	<div class="row" id="msg_list">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-680374">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="/message/receive_list?page=1">받은 쪽지함</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="#">보낸쪽지함</a>
					</li>
				</ul>
			</div>
			<div class="tab-pane" id="tab2">
					<table class="table">
						<thead>
							<tr>
								<th>내용</th>
								<th>받는사람</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
					
						<c:forEach var="messageVo" items="${send_list}" varStatus="status">
							<tr class="tr_list">
								<c:if test="${messageVo.sender == loginVo.userid}">
								<td class="td_list"  data-mno="${messageVo.mno}">${messageVo.message}</td>
								<td>${messageVo.receiver}</td>
								<td>${messageVo.senddate}</td>
								</c:if>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link" href="${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
				<c:forEach begin="${pagingDto.startPage}" end="${pagingDto.endPage}"
					var="i">
					<li
						<c:choose>
									<c:when test="${i == param.page}">
										class = "page-item active"
									</c:when>
									<c:otherwise>
										 class="page-item" 
									</c:otherwise>
								</c:choose>>
						<a href="${i}" class="page-link">${i}</a>
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
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
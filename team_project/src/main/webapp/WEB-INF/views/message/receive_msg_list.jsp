<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		margin-top:20px;
	}
	#msg_paging{
		margin-top:30px;
	}
	th{
 		background-color: rgb(255,227,219); 
	}
	#p{
		text-align:left;
		font-size:15px;
	}
	#modal-693650{
		text-align:left;
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
	$("#btnMsgSend").click(function(){
		var message = $("#message").val();
		var receiver = $("#rec").val();
		var sender = "${loginVo.userid}";
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
	
	$(".dropdown-menu").on("click","#sendMessageSender", function(){
		$("#modal-693650").trigger("click");
		var sender = "${loginVo.userid}";
	})

});
</script>
<div class="row">
	<div class="col-md-12">
		<a id="btnWriteMessage" class="btn btn-outline-danger">쪽지쓰기</a>
		<hr>
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
<!-- 					<button type="button">쪽지쓰기</button> -->
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
					<th>내용</th>
					<th>보낸사람</th>
					<th>날짜</th>
				</tr>
			</thead>
				<tbody>
				<c:forEach var="messageVo" items="${receive_list}" varStatus="status">
					<tr class="tr_list">
						<td class="td_list" data-mno="${messageVo.mno}">${fn:substring(messageVo.message,0,7)}...</td>
						<td>
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button"
											id="dropdownMenuButton" data-toggle="dropdown">
								${messageVo.sender}
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#" id="sendMessageSender" >
									쪽지보내기
								</a> 
								<a class="dropdown-item" href="#">
									레시피보기 
								</a>
							</div>
						</div>
						</td>
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
<%-- 						</c:if> --%>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
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
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
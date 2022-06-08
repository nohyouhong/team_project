<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>

<script>
	$(document).ready(function(){
		var frmPaging = $("#frmPaging");
		$("#btn_msg_del").click(function(e){
			e.preventDefault();
			var mno  = $(this).attr("href");
			frmPaging.find("input[name=mno]").val(mno);
			frmPaging.attr("action", "/message/message_delete");
			frmPaging.attr("method", "get");
			frmPaging.submit();
		});
		$("#a_list").click(function(e){
			e.preventDefault();
			frmPaging.find("input[name=mno]").val("");
			frmPaging.find("input[name=page]").val("${param.page}");
			frmPaging.find("input[name=perPage]").val("${param.perPage}");
			frmPaging.attr("action", "/message/receive_list");
			frmPaging.submit();
		});
		$("#btnreply").click(function(){
			$("#modal-693650").trigger("click");
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
		
	});
</script>
<div class="row">
	<div class="col-md-12">
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
						<input type="text" class="form-control" id="rec" placeholder="받는사람 아이디"
							 value="${messageVo.sender}" readonly>
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
<div class="row" id="readform">
	<div class="col-md-12">
				<form role="form">
					<c:choose>
						<c:when test="${messageVo.sender == 'user01'}"></c:when>
						<c:otherwise>
							<button type="button" class="btn btn-sm btn-secondary" id="btnreply">
								답장하기
							</button>
						</c:otherwise>
					</c:choose>
					<a href="${messageVo.mno}" class="btn btn-sm btn-danger" id="btn_msg_del">
						삭제하기
					</a>
					
					<a href="#" class="btn btn-sm btn-warning"
						 id="a_list">목록으로</a>
					<div class="form-group message_read text-left" id="message_read">
					<c:choose>
						<c:when test="${messageVo.sender != 'user01'}">
							보낸사람
							<input type="text" class="form-control" id="sender"
							value="${messageVo.sender}" readonly />
						</c:when>
						<c:otherwise>
							받는사람
							<input type="text" class="form-control" id="receiver"
							value="${messageVo.receiver}" readonly />
						</c:otherwise>
					</c:choose>
					</div>
					<div class="form-group message_read text-left">
						 내용 
						<textarea class="form-control" id="message" name="message"
							 readonly >${messageVo.message}</textarea>
					</div>
				</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>

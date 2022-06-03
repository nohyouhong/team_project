<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<div class="row" id="readform">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form">
					<button type="button" class="btn btn-sm btn-secondary">
						답장하기
					</button>
					<button type="button" class="btn btn-sm btn-danger">
						삭제하기
					</button>
					<div class="form-group message_read text-left" id="message_read">
						보낸사람
						<input type="text" class="form-control" id="receiver" name="receiver"
							value="${messageVo.receiver}" readonly />
					</div>
					<div class="form-group message_read text-left">
						 내용 
						<textarea class="form-control" id="message" name="message"
							 readonly >${messageVo.message}</textarea>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>

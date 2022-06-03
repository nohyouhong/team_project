<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form">
					<button type="button" class="btn btn-sm btn-outline-info">
						답장</button>
					<div class="form-group">

						<label for="exampleInputEmail1"> Email address </label> <input
							type="email" class="form-control" id="exampleInputEmail1" />
					</div>
					<div class="form-group">

						<label for="exampleInputPassword1"> Password </label> <input
							type="password" class="form-control" id="exampleInputPassword1" />
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>

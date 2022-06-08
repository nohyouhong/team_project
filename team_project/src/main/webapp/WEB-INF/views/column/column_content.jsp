<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<%-- ${columnVo} --%>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h3>${columnVo.c_title}</h3>
		${columnVo.c_content}
	</div>
	<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
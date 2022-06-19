<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frmPaging">
	<input type="hidden" name="mno" value="">
	<input type="hidden" name="n_bno" value="">
	<input type="hidden" name="a_bno" value="">
	<input type="hidden" name="r_bno" value="">
	<input type="hidden" name="listType" value="${pagingDto.listType}">
	<input type="hidden" name="page" value="${pagingDto.page}">
	<input type="hidden" name="perPage" value="${pagingDto.perPage}">
	<input type="hidden" name="searchType" value="${pagingDto.searchType}">
	<input type="hidden" name="keyword" value="${pagingDto.keyword}">
</form>
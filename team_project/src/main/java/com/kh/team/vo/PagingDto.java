package com.kh.team.vo;

public class PagingDto {
	private int page = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int count;
	private int totalPage;
	private int startPage = 1;
	private int endPage = 10;
	private String searchType;
	private String keyword;
	private int perPage=10;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		setPageInfo();
		
	}
	
	private void setPageInfo() {
		endRow = page * perPage;
		startRow = endRow - (perPage-1);
		totalPage = (int)Math.ceil((double)count/ perPage); 
		startPage = ((page-1) /10) * 10 +1;
		endPage= startPage +9;
		if(endPage > totalPage) {
			endPage=totalPage;
		}
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage + ", searchType="
				+ searchType + ", keyword=" + keyword + ", perPage=" + perPage + "]";
	}

	
	
}

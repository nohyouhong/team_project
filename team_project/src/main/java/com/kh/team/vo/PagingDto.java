package com.kh.team.vo;

public class PagingDto {
	private int page = 1;
	private int startRow;
	private int endRow;
	private String searchType;
	private String keyword;
	private String listType = "avgRating";
	private int perPage = 10;
	private int totalPage;
	private int count;
	private int startPage;
	private int endPage;
	private final int PAGE_BLOCK=10;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		this.endRow = this.page * this.perPage;
		this.startRow = this.endRow - (this.perPage-1);
		totalPage = (int)(Math.ceil((double)count/perPage));
		startPage = ((page - 1)/PAGE_BLOCK)*PAGE_BLOCK + 1;
		endPage = startPage + (PAGE_BLOCK - 1);
		if(endPage > totalPage) {
			endPage = totalPage;
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
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}
	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", searchType="
				+ searchType + ", keyword=" + keyword + ", listType=" + listType + ", perPage=" + perPage
				+ ", totalPage=" + totalPage + ", count=" + count + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	
	


	
	
}

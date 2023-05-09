package org.jun.domain;

public class Criteria {
	// 페이지 번호
	private int pageNum;
	// 한 페이지당 게시물 갯수
	private int amount;
	// 검색 종류
	private String search;
	// 검색 키워드
	private String keyword;
	
	// 기본생성자
	Criteria(){
		this(1,10); // 1페이지에 10개
	}
	Criteria(int pageNum,int amount){
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", search=" + search + ", keyword=" + keyword
				+ "]";
	}
	
	
}

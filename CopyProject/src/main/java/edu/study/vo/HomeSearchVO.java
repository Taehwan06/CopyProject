package edu.study.vo;

public class HomeSearchVO {
	
	private String searchType;
	private String search_value;
	private int cnt;
	private String[] searchValueAry;
	
	
	public String[] getSearchValueAry() {
		return searchValueAry;
	}
	public void setSearchValueAry(String[] searchValueAry) {
		this.searchValueAry = searchValueAry;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearch_value() {
		return search_value;
	}
	public void setSearch_value(String search_value) {
		this.search_value = search_value;
	}
}

package edu.study.vo;

public class StorePagingVO {

	private int spidx;
	private int nowPage;
	private int total;
	private int viewPage;
	private int start;
	private int end;
	private String DBname;
	public int getSpidx() {
		return spidx;
	}
	public void setSpidx(int spidx) {
		this.spidx = spidx;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getDBname() {
		return DBname;
	}
	public void setDBname(String dBname) {
		DBname = dBname;
	}
	
	
}

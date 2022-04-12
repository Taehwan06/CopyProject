package edu.study.vo;

public class PagingVO {
	private int nowPage;
	private int startPage;
	private int endPage;
	private int total;
	private int cntPerPage;
	private int lastPage;
	private int start;
	private int end;
	private int cntPage = 10;
	
	public PagingVO() {
		
	}
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		
		calcLastPage(total, cntPerPage);
		calcStartEndPage(nowPage, cntPage);
		calcStartEnd(nowPage, cntPerPage);
	}
	
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		int end = nowPage*cntPerPage;
		int start = end-cntPerPage+1;
		
		setEnd(end);
		setStart(start);
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		
		int endPage = (((int)Math.ceil((double)nowPage/cntPage)) * cntPage);
		if (getLastPage() < endPage) {
			setEndPage(getLastPage());
		}else {
			setEndPage(endPage);
		}
		
		int startPage = (endPage-cntPage+1);
		
		if(startPage<1) {
			startPage = 1;
		}
		setStartPage(startPage);
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		int lastPage = (int)Math.ceil((double)total/cntPerPage);
		setLastPage(lastPage);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
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
}

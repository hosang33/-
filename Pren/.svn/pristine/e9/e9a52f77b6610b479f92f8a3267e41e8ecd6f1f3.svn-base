package kr.pren.vo;

import kr.pren.util.NumberUtils;

public class Pagination {

	private int rowsPerPage;   //출력할 행의 갯수
	private int pagesPerPage;  // 출력할 페이지번호 갯수
	private int pageNo;        // 요청 페이지번호
	private int totalRows;     // 전체 데이터 갯수


	public Pagination() {
		this.rowsPerPage = 5;
		this.pagesPerPage = 5;
	}
	
	public Pagination(int pageNo, int totalRows) {
		this.rowsPerPage = 5;
		this.pagesPerPage = 5;
		this.pageNo= pageNo;
		this.totalRows = totalRows;
	} 
	public Pagination(int pageNo, int totalRows, int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage = 5;
		this.pageNo= pageNo;
		this.totalRows = totalRows;
	}
	public Pagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerPage) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerPage = pagesPerPage;
		this.pageNo= pageNo;
		this.totalRows = totalRows;
		
	}
	
	public int getTotalPagesCount() {
		return NumberUtils.ceil(totalRows, rowsPerPage);
	}
	
	public int getTotalBlocksCount() {
		return NumberUtils.ceil(getTotalPagesCount(), pagesPerPage);
	}
	
	public int getCurrentBlockNo() {
		return NumberUtils.ceil(pageNo, pagesPerPage);
	}

	public int getTotalBlocksNo() {
		return NumberUtils.ceil(pageNo, pagesPerPage);
	}
	
	public int getBeginPage() {
		return (getCurrentBlockNo() -1)*pagesPerPage +1;
	}
	
	public int getEndPage() {
		return (getCurrentBlockNo() == getTotalBlocksCount()
				? getTotalPagesCount() : getCurrentBlockNo()*pagesPerPage);
	}
	
	public int getBeginIndex() {
		return(pageNo-1)*rowsPerPage +1; 
	}
	
	public int getEndIndex() {
		return pageNo*rowsPerPage;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	public int getPagesPerPage() {
		return pagesPerPage;
	}
	public void setPagesPerPage(int pagesPerPage) {
		this.pagesPerPage = pagesPerPage;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	
	
}

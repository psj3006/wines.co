package com.wines.co.VO;

public class PagingVO {
	
	private int nowPage = 1;		
	private int nowBlock = 1;		
	private int totalRecord = 0;	
	private int numPerPage = 10;		
	private int pagePerBlock = 5;	
	private int totalPage = 0;		
	private int totalBlock = 0;		
	private int beginPage = 0;		
	private int endPage = 0;		
	private int begin = 0;		
	private int end = 0;			
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) {
			totalPage++;
		}
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
}

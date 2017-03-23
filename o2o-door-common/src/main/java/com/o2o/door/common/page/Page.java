package com.o2o.door.common.page;

public class Page {
	public Page() {
		// TODO Auto-generated constructor stub
		this.pageNo=1;
		this.pageSize=5;
	}
	//当前页
	private Integer pageNo;
	//当前显示多少页，当前显示记录数
	private Integer pageSize;
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}

package com.blog.entity;

public class PageBean {

	private int page; //第几页
	private int pageSize; //每页几行
	private int start; //起始页
	
	public PageBean() {
	}
	public PageBean(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStart() {
		start = (page-1)*pageSize;
		return start;
	}
	
}

package com.weiweiqin.vo.common;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = 2893170431993503915L;

	private int pageSize = 10;

	private int currPage;

	private int totalPage;

	private int totalCount;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		if (totalCount % pageSize == 0) {
			totalPage = totalCount / pageSize;
		} else {
			totalPage = totalCount / pageSize + 1;
		}
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		if (currPage != 0) {
			return (currPage - 1) * pageSize;
		}
		return 0;
	}

	public int getEnd() {
		if (currPage != 0) {
			return currPage * pageSize;
		}
		return 0;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}

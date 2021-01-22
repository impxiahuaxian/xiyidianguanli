package com.weiweiqin.vo.common;

import java.io.Serializable;

/**
 * 结果VO
 * 
 * @author weiweiqin
 * 
 */
public class OrderQueryVO implements Serializable {

	private static final long serialVersionUID = 2076324875575488461L;
	
	private int currPage;
	
	private String name;
	
	private String mobile;
	
	private String address;
	
	private String startDate;
	
	private Integer state;

 
	private String endDate;


	public int getCurrPage() {
		return currPage;
	}


	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	 
}
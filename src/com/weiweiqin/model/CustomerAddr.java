package com.weiweiqin.model;

import java.io.Serializable;


public class CustomerAddr implements Serializable {

	private static final long serialVersionUID = -7970848646314840509L;

	private Integer id;

	private Integer customerId;
	
	private String mobile;
	
	private String province;
	
	private String provinceCode;
	
	private String city;
	
	private String cityCode;
	
	private String area;
	
	private String areaCode;
	
	private String address;
	
	private String name;
	
	private int defaultAddr =0;



	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getProvinceCode() {
		return provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String toString() {

		StringBuffer sb = new StringBuffer();
		sb.append("id=");
		sb.append(id);
		sb.append("customerId=");
		sb.append(customerId);
		sb.append("mobile=");
		sb.append(mobile);
		sb.append("province=");
		sb.append(province);
		sb.append("provinceCode=");
		sb.append(provinceCode);
		sb.append("city=");
		sb.append(city);
		sb.append("cityCode=");
		sb.append(cityCode);
		sb.append("area=");
		sb.append(area);
		sb.append("areaCode=");
		sb.append(areaCode);
		sb.append("address=");
		sb.append(address);
		sb.append("name=");
		sb.append(name);
		sb.append("defaultAddr=");
		sb.append(defaultAddr);
		return sb.toString();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public int getDefaultAddr() {
		return defaultAddr;
	}

	public void setDefaultAddr(int defaultAddr) {
		this.defaultAddr = defaultAddr;
	}

}
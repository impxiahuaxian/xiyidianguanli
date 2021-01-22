package com.weiweiqin.model;

import java.io.Serializable;

public class Province implements Serializable {

	private static final long serialVersionUID = -7970848646314840509L;

	private int id;

	private String code;

	private String name;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
		sb.append(":code=");
		sb.append(code);
		sb.append(":name=");
		sb.append(name);
		return sb.toString();
	}

}
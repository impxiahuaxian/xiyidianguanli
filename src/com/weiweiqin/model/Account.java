package com.weiweiqin.model;

import java.io.Serializable;

public class  Account implements Serializable {

	private static final long serialVersionUID = -7970848646314840509L;

	private Integer id;
	private Integer status;
	private String username;
	private String password;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
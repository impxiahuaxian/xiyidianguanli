package com.weiweiqin.model;

import java.io.Serializable;

public class VipType implements Serializable {

	private static final long serialVersionUID = 5947691543764682200L;

	private int id;

	private int level;

	private String name;

	private int discount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

}

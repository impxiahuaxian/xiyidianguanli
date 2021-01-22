package com.weiweiqin.model;

import java.io.Serializable;

public class OrderDetail implements Serializable {

	private static final long serialVersionUID = -7970848646314840509L;

	/**
	 * 自动生成主键
	 */
	private int id;

	private int orderId;

	private int clothesId;

	private int num;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getClothesId() {
		return clothesId;
	}

	public void setClothesId(int clothesId) {
		this.clothesId = clothesId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
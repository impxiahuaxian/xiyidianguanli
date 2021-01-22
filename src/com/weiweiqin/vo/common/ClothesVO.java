package com.weiweiqin.vo.common;

import com.weiweiqin.model.Clothes;


/**
 * 结果VO
 * 
 * @author weiweiqin
 * 
 */
public class ClothesVO{
	private String addDate;
	
	private Clothes clothes;

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public Clothes getClothes() {
		return clothes;
	}

	public void setClothes(Clothes clothes) {
		this.clothes = clothes;
	}
	
}
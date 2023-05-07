package com.my.pro.dto;

import com.my.pro.model.Goods;

public class CarGoods {

	private Integer carId;
	
	private Goods goods;

	public Integer getCarId() {
		return carId;
	}

	public void setCarId(Integer carId) {
		this.carId = carId;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}

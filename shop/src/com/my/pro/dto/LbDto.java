package com.my.pro.dto;

import java.util.ArrayList;
import java.util.List;

import com.my.pro.model.Lb;
import com.my.pro.model.Pp;

public class LbDto {

	private Lb lb;
	
	private List<Pp> pps = new ArrayList<Pp>();

	public Lb getLb() {
		return lb;
	}

	public void setLb(Lb lb) {
		this.lb = lb;
	}

	public List<Pp> getPps() {
		return pps;
	}

	public void setPps(List<Pp> pps) {
		this.pps = pps;
	}
	
}

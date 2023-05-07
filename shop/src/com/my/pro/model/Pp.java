package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 产品
 * @author
 *
 */
@Entity
@Table(name="pp")
public class Pp {
	
    private Integer id;
	
	private String name;
	
	private String cpUrl;//产品url
	
	private Lb lb;//类别

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCpUrl() {
		return cpUrl;
	}

	public void setCpUrl(String cpUrl) {
		this.cpUrl = cpUrl;
	}

	@ManyToOne
	@JoinColumn(name="lbId")
	public Lb getLb() {
		return lb;
	}

	public void setLb(Lb lb) {
		this.lb = lb;
	}
}

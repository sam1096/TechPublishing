package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="areainterest")
public class AreaInterest {
	@Id
	
	@Column(name="areaid")
	private String areaid;
	@Column(name="areaname")
	private String areaname;
	public AreaInterest()
	{
		
	}
	public AreaInterest(String areaid, String areaname) {
		super();
		this.areaid = areaid;
		this.areaname = areaname;
	}
	@Override
	public String toString() {
		return "AreaInterest [areaid=" + areaid + ", areaname=" + areaname + "]";
	}
	public String getAreaid() {
		return areaid;
	}
	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	
	
	

}

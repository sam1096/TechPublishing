package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="adminarea")
public class AdminArea {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	@Column(name="adminname")
	private String adminname;
	@Column(name="areaid")
	private String areaid;
	public AdminArea()
	{
		
	}
	public AdminArea(String adminname, String areaid) {
		super();
		this.adminname = adminname;
		this.areaid = areaid;
	}
	@Override
	public String toString() {
		return "AdminArea [id=" + id + ", adminname=" + adminname + ", areaid=" + areaid + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAreaid() {
		return areaid;
	}
	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}
	
}

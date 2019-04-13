package com.example.demo.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="admin")
public class Admin implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="adminid")
	private int adminid;
	@Column(name="name")
	private String name;
	

	@Column(name="password")
	private String password;
	@Column(name="adminname",unique=true,nullable=false)
	private String adminname;
	public Admin()
	{
		
	}
	public Admin(String name, String password, String adminname) {
		super();
		this.name = name;
		this.password = password;
		this.adminname = adminname;
	}
	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", name=" + name + ", password=" + password + ", adminname=" + adminname
				+ "]";
	}
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	
}

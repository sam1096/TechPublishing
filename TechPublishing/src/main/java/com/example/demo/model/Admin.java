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
	
	@Column(name="email")
	private String email;
	@Column(name="phoneNo")
	private String phoneNo;
	
	
	public Admin()
	{
		
	}


	public Admin(int adminid, String name, String password, String adminname, String email, String phoneNo) {
		super();
		this.adminid = adminid;
		this.name = name;
		this.password = password;
		this.adminname = adminname;
		this.email = email;
		this.phoneNo = phoneNo;
	}


	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", name=" + name + ", password=" + password + ", adminname=" + adminname
				+ ", email=" + email + ", phoneNo=" + phoneNo + "]";
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	
}

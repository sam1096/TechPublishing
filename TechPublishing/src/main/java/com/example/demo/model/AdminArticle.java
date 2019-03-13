package com.example.demo.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="adminarticle")
public class AdminArticle {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="artid")
	private int artid;
	@Column(name="description")
	private String description;
	@Column(name="areaid")
	private String areaid;
	@Column(name="adminname")
	private String adminname;
	public AdminArticle()
	{
		
	}
	public AdminArticle(String description, String areaid, String adminname) {
		super();
		this.description = description;
		this.areaid = areaid;
		this.adminname = adminname;
	}
	@Override
	public String toString() {
		return "AdminArticle [artid=" + artid + ", description=" + description + ", areaid=" + areaid + ", adminname="
				+ adminname + "]";
	}
	
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAreaid() {
		return areaid;
	}
	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	
}

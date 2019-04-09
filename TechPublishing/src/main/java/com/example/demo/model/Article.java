package com.example.demo.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="article")

public class Article {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="aid")
	private int aid;
	@Column(name="rating")
	private int rating;
	@Column(name="description")
	private String description;
	@Column(name="areaid")
	private String areaid;
	@Column(name="authname")
	private String authname;
	@Column(name="status")
	private String status;
	@Column(name="postdate")
	private Date postdate;
	@Column(name="reviewdate")
	private Date reviewdate;
	
	@Column(name="reviewby")
	private String reviewby;
	@Column(name="reason")
	private String reason;
	
	
	public Article()
	{}	
	
	
	public Article(int aid, int rating, String description, String areaid, String authname, String status,
			Date postdate, Date reviewdate, String reviewby, String reason) {
		super();
		this.aid = aid;
		this.rating = rating;
		this.description = description;
		this.areaid = areaid;
		this.authname = authname;
		this.status = status;
		this.postdate = postdate;
		this.reviewdate = reviewdate;
		this.reviewby = reviewby;
		this.reason = reason;
	}
	
	
	
	@Override
	public String toString() {
		return "Article [aid=" + aid + ", rating=" + rating + ", description=" + description + ", areaid=" + areaid
				+ ", authname=" + authname + ", status=" + status + ", postdate=" + postdate + ", reviewdate="
				+ reviewdate + ", reviewby=" + reviewby + ", reason=" + reason + "]";
	}

	
	
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
	public String getAuthname() {
		return authname;
	}
	public void setAuthname(String authname) {
		this.authname = authname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public String getReviewby() {
		return reviewby;
	}
	public void setReviewby(String reviewby) {
		this.reviewby = reviewby;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}

	
	
	
	
	
	
	

	
	
	
	
	
}

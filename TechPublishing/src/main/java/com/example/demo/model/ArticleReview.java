package com.example.demo.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="articlereview")
public class ArticleReview {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	@Column(name="artid")
	private int artid;
	@Column(name="authname")
	private String authname;
	@Column(name="reviewby")
	private String reviewby;
	
	@Column(name="status")
	private String status;
	@Column(name="reason")
	private String reason;
	@Column(name="postdate")
	private Date postdate;
	@Column(name="reviewdate")
	private Date reviewdate;
	public ArticleReview()
	{
		
	}
	public ArticleReview(int artid, String authname, String reviewby, String status, String reason, Date postdate,
			Date reviewdate) {
		super();
		this.artid = artid;
		this.authname = authname;
		this.reviewby = reviewby;
		this.status = status;
		this.reason = reason;
		this.postdate = postdate;
		this.reviewdate = reviewdate;
	}
	@Override
	public String toString() {
		return "ArticeReview [id=" + id + ", artid=" + artid + ", authname=" + authname + ", reviewby=" + reviewby
				+ ", status=" + status + ", reason=" + reason + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getAuthname() {
		return authname;
	}
	public void setAuthname(String authname) {
		this.authname = authname;
	}
	public String getReviewby() {
		return reviewby;
	}
	public void setReviewby(String reviewby) {
		this.reviewby = reviewby;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	
	
}

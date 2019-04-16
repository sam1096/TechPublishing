package com.example.demo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.*;
@Entity
public class userRatings {
	@Id
	@GeneratedValue
	private int id;
	private int artid;
	private String authname;
	private int rating;
	@Column(columnDefinition="boolean default true")
	private boolean notRated;
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
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public boolean isNotRated() {
		return notRated;
	}
	public void setNotRated(boolean notRated) {
		this.notRated = notRated;
	}
	@Override
	public String toString() {
		return "userRatings [id=" + id + ", artid=" + artid + ", authname=" + authname + ", rating=" + rating
				+ ", notRated=" + notRated + "]";
	}
	 
	
}

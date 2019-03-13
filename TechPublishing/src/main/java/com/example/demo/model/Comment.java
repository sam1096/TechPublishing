package com.example.demo.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="comment")
public class Comment {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="commentid")
	private int commentid;
	@Column(name="comdesc")
	private String comdesc;
	@Column(name="authname")
	private String authname;
	@Column(name="artid")
	private int artid;
	public Comment()
	{
		
	}
	public Comment(String comdesc, String authname, int artid) {
		super();
		this.comdesc = comdesc;
		this.authname = authname;
		this.artid = artid;
	}
	@Override
	public String toString() {
		return "Comment [commentid=" + commentid + ", comdesc=" + comdesc + ", authname=" + authname + ", artid="
				+ artid + "]";
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public String getComdesc() {
		return comdesc;
	}
	public void setComdesc(String comdesc) {
		this.comdesc = comdesc;
	}
	public String getAuthname() {
		return authname;
	}
	public void setAuthname(String authname) {
		this.authname = authname;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	
}

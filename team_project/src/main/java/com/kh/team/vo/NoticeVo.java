package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class NoticeVo {
	private int n_bno;
	private String n_title;
	private String n_content;
	private String userid;
	private String username;
	private Date n_regdate;
	
	public NoticeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeVo(int n_bno, String n_title, String n_content, String userid) {
		super();
		this.n_bno = n_bno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.userid = userid;
	}

	public NoticeVo(int n_bno, String n_title, String n_content, String userid, Date n_regdate) {
		super();
		this.n_bno = n_bno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.userid = userid;
		this.n_regdate = n_regdate;
	}
	
	public NoticeVo(int n_bno, String n_title, String n_content, String userid, String username, Date n_regdate) {
		super();
		this.n_bno = n_bno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.userid = userid;
		this.username = username;
		this.n_regdate = n_regdate;
	}
	
	

	public int getN_bno() {
		return n_bno;
	}
	public void setN_bno(int n_bno) {
		this.n_bno = n_bno;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "NoticeVo [n_bno=" + n_bno + ", n_title=" + n_title + ", n_content=" + n_content + ", userid=" + userid
				+ ", username=" + username + ", n_regdate=" + n_regdate + "]";
	}
	

	
}

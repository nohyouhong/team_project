package com.kh.team.vo;

import java.sql.Date;

public class InquiryVo {
	private int i_bno;
	private String i_title;
	private String i_content;
	private String userid;
	private Date i_regdate;
	private int re_group;
	private int re_level;
	private int re_seq;
	
	public InquiryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InquiryVo(int i_bno, String i_title, String i_content, String userid, Date i_regdate) {
		super();
		this.i_bno = i_bno;
		this.i_title = i_title;
		this.i_content = i_content;
		this.userid = userid;
		this.i_regdate = i_regdate;
	}
	
	public InquiryVo(int i_bno, String i_title, String i_content, String userid, Date i_regdate, int re_group,
			int re_level, int re_seq) {
		super();
		this.i_bno = i_bno;
		this.i_title = i_title;
		this.i_content = i_content;
		this.userid = userid;
		this.i_regdate = i_regdate;
		this.re_group = re_group;
		this.re_level = re_level;
		this.re_seq = re_seq;
	}
	
	public int getI_bno() {
		return i_bno;
	}
	
	public void setI_bno(int i_bno) {
		this.i_bno = i_bno;
	}
	
	public String getI_title() {
		return i_title;
	}
	
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}
	
	public String getI_content() {
		return i_content;
	}
	
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public Date getI_regdate() {
		return i_regdate;
	}
	
	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}
	
	public int getRe_group() {
		return re_group;
	}
	
	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}
	
	public int getRe_level() {
		return re_level;
	}
	
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	public int getRe_seq() {
		return re_seq;
	}
	
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	
	@Override
	public String toString() {
		return "InquiryVo [i_bno=" + i_bno + ", i_title=" + i_title + ", i_content=" + i_content + ", userid=" + userid
				+ ", i_regdate=" + i_regdate + ", re_group=" + re_group + ", re_level=" + re_level + ", re_seq="
				+ re_seq + "]";
	}
	
	
	
}

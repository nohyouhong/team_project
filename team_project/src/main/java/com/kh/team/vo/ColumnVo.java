package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class ColumnVo {
	private int c_bno;
	private String c_title;
	private String c_content;
	private String userid;
	private Date c_regdate;
	private int c_viewcnt;
	private int c_likecnt;
	private String[] pictures;
	private String c_picture;
	private int c_rnum;
	
	
	public ColumnVo() {
		super();
	}

	public ColumnVo(int c_bno, String c_title, String c_content, String userid, Date c_regdate, int c_viewcnt,
			int c_likecnt) {
		super();
		this.c_bno = c_bno;
		this.c_title = c_title;
		this.c_content = c_content;
		this.userid = userid;
		this.c_regdate = c_regdate;
		this.c_viewcnt = c_viewcnt;
		this.c_likecnt = c_likecnt;
	}

	public ColumnVo(int c_bno, String c_title, String c_content, String userid) {
		super();
		this.c_bno = c_bno;
		this.c_title = c_title;
		this.c_content = c_content;
		this.userid = userid;
	}

	public int getC_bno() {
		return c_bno;
	}

	public void setC_bno(int c_bno) {
		this.c_bno = c_bno;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}

	public int getC_viewcnt() {
		return c_viewcnt;
	}

	public void setC_viewcnt(int c_viewcnt) {
		this.c_viewcnt = c_viewcnt;
	}

	public int getC_likecnt() {
		return c_likecnt;
	}

	public void setC_likecnt(int c_likecnt) {
		this.c_likecnt = c_likecnt;
	}

	public String[] getPictures() {
		return pictures;
	}

	public void setPictures(String[] pictures) {
		this.pictures = pictures;
	}

	public String getC_picture() {
		return c_picture;
	}

	public void setC_picture(String c_picture) {
		this.c_picture = c_picture;
	}

	public int getC_rnum() {
		return c_rnum;
	}

	public void setC_rnum(int c_rnum) {
		this.c_rnum = c_rnum;
	}

	@Override
	public String toString() {
		return "ColumnVo [c_bno=" + c_bno + ", c_title=" + c_title + ", c_content=" + c_content + ", userid=" + userid
				+ ", c_regdate=" + c_regdate + ", c_viewcnt=" + c_viewcnt + ", c_likecnt=" + c_likecnt + ", pictures="
				+ Arrays.toString(pictures) + ", c_picture=" + c_picture + ", c_rnum=" + c_rnum + "]";
	}
	
}

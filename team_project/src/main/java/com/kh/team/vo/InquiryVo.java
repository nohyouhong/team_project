package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;


public class InquiryVo {
	private int a_bno;
	private String a_title;
	private String a_content;
	private String userid;
	private Date a_regdate;
	private String[] files;
	
	public InquiryVo() {
		super();
		
	}


	public InquiryVo(int a_bno, String a_title, String a_content, String userid, Date a_regdate) {
		super();
		this.a_bno = a_bno;
		this.a_title = a_title;
		this.a_content = a_content;
		this.userid = userid;
		this.a_regdate = a_regdate;
	}


	public InquiryVo(int a_bno, String a_title, String a_content, String userid, Date a_regdate, String[] files) {
		super();
		this.a_bno = a_bno;
		this.a_title = a_title;
		this.a_content = a_content;
		this.userid = userid;
		this.a_regdate = a_regdate;
		this.files = files;
	}


	

	public int getA_bno() {
		return a_bno;
	}


	public void setA_bno(int a_bno) {
		this.a_bno = a_bno;
	}


	public String getA_title() {
		return a_title;
	}


	public void setA_title(String a_title) {
		this.a_title = a_title;
	}


	public String getA_content() {
		return a_content;
	}


	public void setA_content(String a_content) {
		this.a_content = a_content;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public Date getA_regdate() {
		return a_regdate;
	}


	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}


	public String[] getFiles() {
		return files;
	}


	public void setFiles(String[] files) {
		this.files = files;
	}


	@Override
	public String toString() {
		return "InquiryVo [a_bno=" + a_bno + ", a_title=" + a_title + ", a_content=" + a_content + ", userid=" + userid
				+ ", a_regdate=" + a_regdate + ", files=" + Arrays.toString(files) + "]";
	}


	
}

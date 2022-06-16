package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;


public class AskVo {
	private int a_bno;
	private String a_title;
	private String a_content;
	private String writer;
	private Date a_regdate;
	private int re_group;
	private int re_level;
	private int re_seq;
	private String[] files;
	
	public AskVo() {
		super();
		
	}
	

	public AskVo(int a_bno, String a_title, String a_content, String writer, Date a_regdate, String[] files) {
		super();
		this.a_bno = a_bno;
		this.a_title = a_title;
		this.a_content = a_content;
		this.writer = writer;
		this.a_regdate = a_regdate;
		this.files = files;
	}

	public AskVo(int a_bno, String a_title, String a_content, String writer, Date a_regdate, int re_group,
			int re_level, int re_seq, String[] files) {
		super();
		this.a_bno = a_bno;
		this.a_title = a_title;
		this.a_content = a_content;
		this.writer = writer;
		this.a_regdate = a_regdate;
		this.re_group = re_group;
		this.re_level = re_level;
		this.re_seq = re_seq;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getA_regdate() {
		return a_regdate;
	}

	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
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

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "AskVo [a_bno=" + a_bno + ", a_title=" + a_title + ", a_content=" + a_content + ", writer=" + writer
				+ ", a_regdate=" + a_regdate + ", re_group=" + re_group + ", re_level=" + re_level + ", re_seq="
				+ re_seq + ", files=" + Arrays.toString(files) + "]";
	}

	
	
}

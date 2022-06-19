package com.kh.team.vo;

import java.sql.Date;

public class DeclareVo {
	private int r_dno;
	private int r_cno;
	private String reporter;
	private String criminal;
	private Date d_regdate;
	private int d_code;
	private String d_explain;
	
	public DeclareVo() {
		super();
	}

	public DeclareVo(int r_cno, String reporter, String criminal, int d_code, String d_explain) {
		super();
		this.r_cno = r_cno;
		this.reporter = reporter;
		this.criminal = criminal;
		this.d_code = d_code;
		this.d_explain = d_explain;
	}

	public DeclareVo(int r_dno, int r_cno, String reporter, String criminal, Date d_regdate, int d_code,
			String d_explain) {
		super();
		this.r_dno = r_dno;
		this.r_cno = r_cno;
		this.reporter = reporter;
		this.criminal = criminal;
		this.d_regdate = d_regdate;
		this.d_code = d_code;
		this.d_explain = d_explain;
	}

	public int getR_dno() {
		return r_dno;
	}

	public void setR_dno(int r_dno) {
		this.r_dno = r_dno;
	}

	public int getR_cno() {
		return r_cno;
	}

	public void setR_cno(int r_cno) {
		this.r_cno = r_cno;
	}

	public Date getD_regdate() {
		return d_regdate;
	}

	public void setD_regdate(Date d_regdate) {
		this.d_regdate = d_regdate;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getCriminal() {
		return criminal;
	}

	public void setCriminal(String criminal) {
		this.criminal = criminal;
	}

	public int getD_code() {
		return d_code;
	}

	public void setD_code(int d_code) {
		this.d_code = d_code;
	}

	public String getD_explain() {
		return d_explain;
	}

	public void setD_explain(String d_explain) {
		this.d_explain = d_explain;
	}

	@Override
	public String toString() {
		return "DeclareVo [r_dno=" + r_dno + ", r_cno=" + r_cno + ", reporter=" + reporter + ", criminal=" + criminal
				+ ", d_regdate=" + d_regdate + ", d_code=" + d_code + ", d_explain=" + d_explain + "]";
	}
}

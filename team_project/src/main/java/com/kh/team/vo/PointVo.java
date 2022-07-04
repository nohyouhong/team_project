package com.kh.team.vo;

import java.sql.Date;

public class PointVo {
	private int pno;
	private String userid;
	private int point;
	private int p_code;
	private Date p_regdate;
	private String p_desc;
	
	public PointVo() {
		super();
	}

	public PointVo(String userid, int point) {
		super();
		this.userid = userid;
		this.point = point;
	}



	public PointVo(String userid, int point, int p_code) {
		super();
		this.userid = userid;
		this.point = point;
		this.p_code = p_code;
	}

	public PointVo(int pno, String userid, int point, int p_code, Date p_regdate, String p_desc) {
		super();
		this.pno = pno;
		this.userid = userid;
		this.point = point;
		this.p_code = p_code;
		this.p_regdate = p_regdate;
		this.p_desc = p_desc;
	}

	public PointVo(int pno, String userid, int point, Date p_regdate, String p_desc) {
		super();
		this.pno = pno;
		this.userid = userid;
		this.point = point;
		this.p_regdate = p_regdate;
		this.p_desc = p_desc;
	}

	public PointVo(String userid, int point, int p_code, String p_desc) {
		super();
		this.userid = userid;
		this.point = point;
		this.p_code = p_code;
		this.p_desc = p_desc;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	@Override
	public String toString() {
		return "PointShopVo [pno=" + pno + ", userid=" + userid + ", point=" + point + ", p_code=" + p_code
				+ ", p_regdate=" + p_regdate + ", p_desc=" + p_desc + "]";
	}
	
}

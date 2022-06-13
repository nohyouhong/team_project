package com.kh.team.vo;

import java.sql.Date;

public class RecipeReviewVo {
	private int r_rno;
	private int r_bno;
	private String r_comment;
	private String userid;
	private String r_reviewpic;
	private String m_picture;
	private Date r_regdate;
	private int re_group;
	private int re_level;
	private int r_code;
	private int r_desc;
	
	public RecipeReviewVo() {
		super();
	}

	public RecipeReviewVo(int r_bno, String r_comment, String userid, String r_reviewpic, int re_group, int r_code) {
		super();
		this.r_bno = r_bno;
		this.r_comment = r_comment;
		this.userid = userid;
		this.r_reviewpic = r_reviewpic;
		this.re_group = re_group;
		this.r_code = r_code;
	}

	public RecipeReviewVo(int r_rno, int r_bno, String r_comment, String userid, String r_reviewpic, String m_picture,
			Date r_regdate, int re_group, int re_level, int r_code, int r_desc) {
		super();
		this.r_rno = r_rno;
		this.r_bno = r_bno;
		this.r_comment = r_comment;
		this.userid = userid;
		this.r_reviewpic = r_reviewpic;
		this.m_picture = m_picture;
		this.r_regdate = r_regdate;
		this.re_group = re_group;
		this.re_level = re_level;
		this.r_code = r_code;
		this.r_desc = r_desc;
	}

	public int getR_rno() {
		return r_rno;
	}

	public void setR_rno(int r_rno) {
		this.r_rno = r_rno;
	}

	public int getR_bno() {
		return r_bno;
	}

	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}

	public String getR_comment() {
		return r_comment;
	}

	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getR_reviewpic() {
		return r_reviewpic;
	}

	public void setR_reviewpic(String r_reviewpic) {
		this.r_reviewpic = r_reviewpic;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
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

	public int getR_code() {
		return r_code;
	}

	public void setR_code(int r_code) {
		this.r_code = r_code;
	}

	public int getR_desc() {
		return r_desc;
	}

	public void setR_desc(int r_desc) {
		this.r_desc = r_desc;
	}

	public String getM_picture() {
		return m_picture;
	}

	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}

	@Override
	public String toString() {
		return "RecipeReviewVo [r_rno=" + r_rno + ", r_bno=" + r_bno + ", r_comment=" + r_comment + ", userid=" + userid
				+ ", r_reviewpic=" + r_reviewpic + ", m_picture=" + m_picture + ", r_regdate=" + r_regdate
				+ ", re_group=" + re_group + ", re_level=" + re_level + ", r_code=" + r_code + ", r_desc=" + r_desc
				+ "]";
	}
}

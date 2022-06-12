package com.kh.team.vo;

import java.sql.Date;

public class RecipeCommentVo {
	private int r_cno;
	private int r_bno;
	private String r_comment;
	private String userid;
	private String username;
	private String r_userpic;
	private Date r_regdate;
	private int re_group;
	private int re_level;
	private int declarecnt;
	
	public RecipeCommentVo() {
		super();
	}

	public RecipeCommentVo(int r_bno, String r_comment, String userid, String r_userpic) {
		super();
		this.r_bno = r_bno;
		this.r_comment = r_comment;
		this.userid = userid;
		this.r_userpic = r_userpic;
	}

	public RecipeCommentVo(int r_cno, int r_bno, String r_comment, String userid, String username, String r_userpic,
			Date r_regdate, int re_group, int re_level, int declarecnt) {
		super();
		this.r_cno = r_cno;
		this.r_bno = r_bno;
		this.r_comment = r_comment;
		this.userid = userid;
		this.username = username;
		this.r_userpic = r_userpic;
		this.r_regdate = r_regdate;
		this.re_group = re_group;
		this.re_level = re_level;
		this.declarecnt = declarecnt;
	}

	public int getR_cno() {
		return r_cno;
	}

	public void setR_cno(int r_cno) {
		this.r_cno = r_cno;
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

	public int getDeclarecnt() {
		return declarecnt;
	}

	public void setDeclarecnt(int declarecnt) {
		this.declarecnt = declarecnt;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getR_userpic() {
		return r_userpic;
	}

	public void setR_userpic(String r_userpic) {
		this.r_userpic = r_userpic;
	}

	@Override
	public String toString() {
		return "RecipeCommentVo [r_cno=" + r_cno + ", r_bno=" + r_bno + ", r_comment=" + r_comment + ", userid="
				+ userid + ", username=" + username + ", r_userpic=" + r_userpic + ", r_regdate=" + r_regdate
				+ ", re_group=" + re_group + ", re_level=" + re_level + ", declarecnt=" + declarecnt + "]";
	}
}

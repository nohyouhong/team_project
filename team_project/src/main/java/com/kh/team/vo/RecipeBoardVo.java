package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class RecipeBoardVo {
	private int r_bno;
	private String r_title;
	private String r_explain;
	private String[] r_contents;
	private String r_cooktip;
	private String userid;
	private String username;
	private String m_picture;
	private Date r_regdate;
	private int f_code;
	private String f_type;
	private String r_time;
	private String r_level;
	private int r_viewcnt;
	private float avgRating;
	private int ratingNum;
	private String r_titlepic;
	private String[] pictures;
	private String[] r_tags;
	
	public RecipeBoardVo() {
		super();
	}

	public RecipeBoardVo(String r_title, String r_explain, String[] r_contents, String r_cooktip, String userid,
			int f_code, String r_titlepic, String[] pictures) {
		super();
		this.r_title = r_title;
		this.r_explain = r_explain;
		this.r_contents = r_contents;
		this.r_cooktip = r_cooktip;
		this.userid = userid;
		this.f_code = f_code;
		this.r_titlepic = r_titlepic;
		this.pictures = pictures;
	}
	
	public RecipeBoardVo(String r_title, String r_explain, String[] r_contents, String r_cooktip, String userid,
			int f_code, String r_time, String r_level, String r_titlepic, String[] pictures) {
		super();
		this.r_title = r_title;
		this.r_explain = r_explain;
		this.r_contents = r_contents;
		this.r_cooktip = r_cooktip;
		this.userid = userid;
		this.f_code = f_code;
		this.r_time = r_time;
		this.r_level = r_level;
		this.r_titlepic = r_titlepic;
		this.pictures = pictures;
	}

	public RecipeBoardVo(int r_bno, String r_title, String r_explain, String[] r_contents, String r_cooktip,
			String userid, String username, String m_picture, Date r_regdate, int f_code, String f_type, String r_time,
			String r_level, int r_viewcnt, float avgRating, int ratingNum, String r_titlepic, String[] pictures,
			String[] r_tags) {
		super();
		this.r_bno = r_bno;
		this.r_title = r_title;
		this.r_explain = r_explain;
		this.r_contents = r_contents;
		this.r_cooktip = r_cooktip;
		this.userid = userid;
		this.username = username;
		this.m_picture = m_picture;
		this.r_regdate = r_regdate;
		this.f_code = f_code;
		this.f_type = f_type;
		this.r_time = r_time;
		this.r_level = r_level;
		this.r_viewcnt = r_viewcnt;
		this.avgRating = avgRating;
		this.ratingNum = ratingNum;
		this.r_titlepic = r_titlepic;
		this.pictures = pictures;
		this.r_tags = r_tags;
	}

	public int getRatingNum() {
		return ratingNum;
	}

	public void setRatingNum(int ratingNum) {
		this.ratingNum = ratingNum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getR_bno() {
		return r_bno;
	}

	public void setR_bno(int r_bno) {
		this.r_bno = r_bno;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_explain() {
		return r_explain;
	}

	public void setR_explain(String r_explain) {
		this.r_explain = r_explain;
	}

	public String[] getR_contents() {
		return r_contents;
	}

	public void setR_contents(String[] r_contents) {
		this.r_contents = r_contents;
	}

	public String getR_cooktip() {
		return r_cooktip;
	}

	public void setR_cooktip(String r_cooktip) {
		this.r_cooktip = r_cooktip;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getM_picture() {
		return m_picture;
	}

	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getF_code() {
		return f_code;
	}

	public void setF_code(int f_code) {
		this.f_code = f_code;
	}

	public String getF_type() {
		return f_type;
	}

	public void setF_type(String f_type) {
		this.f_type = f_type;
	}

	public String getR_time() {
		return r_time;
	}

	public void setR_time(String r_time) {
		this.r_time = r_time;
	}

	public String getR_level() {
		return r_level;
	}

	public void setR_level(String r_level) {
		this.r_level = r_level;
	}

	public int getR_viewcnt() {
		return r_viewcnt;
	}

	public void setR_viewcnt(int r_viewcnt) {
		this.r_viewcnt = r_viewcnt;
	}

	public float getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(float avgRating) {
		this.avgRating = avgRating;
	}

	public String getR_titlepic() {
		return r_titlepic;
	}

	public void setR_titlepic(String r_titlepic) {
		this.r_titlepic = r_titlepic;
	}

	public String[] getPictures() {
		return pictures;
	}

	public void setPictures(String[] pictures) {
		this.pictures = pictures;
	}

	public String[] getR_tags() {
		return r_tags;
	}

	public void setR_tags(String[] r_tags) {
		this.r_tags = r_tags;
	}

	@Override
	public String toString() {
		return "RecipeBoardVo [r_bno=" + r_bno + ", r_title=" + r_title + ", r_explain=" + r_explain + ", r_contents="
				+ Arrays.toString(r_contents) + ", r_cooktip=" + r_cooktip + ", userid=" + userid + ", username="
				+ username + ", m_picture=" + m_picture + ", r_regdate=" + r_regdate + ", f_code=" + f_code
				+ ", f_type=" + f_type + ", r_time=" + r_time + ", r_level=" + r_level + ", r_viewcnt=" + r_viewcnt
				+ ", avgRating=" + avgRating + ", ratingNum=" + ratingNum + ", r_titlepic=" + r_titlepic + ", pictures="
				+ Arrays.toString(pictures) + ", r_tags=" + Arrays.toString(r_tags) + "]";
	}
}

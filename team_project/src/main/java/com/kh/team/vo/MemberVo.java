package com.kh.team.vo;

import java.sql.Date;

public class MemberVo {
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String gender;
	private Date m_regdate;
	private int m_point;
	private String m_picture;
	private int m_totalattend;
	private int m_code;
	private String cellphone;
	private int m_attend_count;
	private String nickname;
	private int add_code;
	private int basket;
	
	public MemberVo() {
		super();
	}
	
	public MemberVo(String userid, String userpw, String username, String email, String gender, String cellphone,
			String nickname) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
		this.gender = gender;
		this.cellphone = cellphone;
		this.nickname = nickname;
	}

	public MemberVo(String userid, String userpw, String username, String email, String gender, String m_picture,
			String cellphone, String nickname) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
		this.gender = gender;
		this.m_picture = m_picture;
		this.cellphone = cellphone;
		this.nickname = nickname;
	}

	public MemberVo(String userid, String userpw, String username, String email, String gender, Date m_regdate,
			int m_point, String m_picture, int m_totalattend, int m_code, String cellphone, int m_attend_count,
			String nickname, int add_code, int basket) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
		this.gender = gender;
		this.m_regdate = m_regdate;
		this.m_point = m_point;
		this.m_picture = m_picture;
		this.m_totalattend = m_totalattend;
		this.m_code = m_code;
		this.cellphone = cellphone;
		this.m_attend_count = m_attend_count;
		this.nickname = nickname;
		this.add_code = add_code;
		this.basket = basket;
	}

	public int getAdd_code() {
		return add_code;
	}

	public void setAdd_code(int add_code) {
		this.add_code = add_code;
	}

	public int getBasket() {
		return basket;
	}

	public void setBasket(int basket) {
		this.basket = basket;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public String getM_picture() {
		return m_picture;
	}

	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}

	public int getM_totalattend() {
		return m_totalattend;
	}

	public void setM_totalattend(int m_totalattend) {
		this.m_totalattend = m_totalattend;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	
	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public int getM_attend_count() {
		return m_attend_count;
	}

	public void setM_attend_count(int m_attend_count) {
		this.m_attend_count = m_attend_count;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", gender=" + gender + ", m_regdate=" + m_regdate + ", m_point=" + m_point + ", m_picture="
				+ m_picture + ", m_totalattend=" + m_totalattend + ", m_code=" + m_code + ", cellphone=" + cellphone
				+ ", m_attend_count=" + m_attend_count + ", nickname=" + nickname + ", add_code=" + add_code
				+ ", basket=" + basket + "]";
	}
}

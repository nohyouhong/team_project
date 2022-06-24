package com.kh.team.vo;

public class AddrVo {
	private int add_no;
	private String add_nickname;
	private String add_receiver;
	private int add_postcode;
	private String add_address;
	private String add_addrdetail;
	private String add_cellphone;
	private int add_code;
	private String userid;
	
	public AddrVo() {
		super();
	}

	public int getAdd_no() {
		return add_no;
	}

	public void setAdd_no(int add_no) {
		this.add_no = add_no;
	}

	public String getAdd_nickname() {
		return add_nickname;
	}

	public void setAdd_nickname(String add_nickname) {
		this.add_nickname = add_nickname;
	}

	public String getAdd_receiver() {
		return add_receiver;
	}

	public void setAdd_receiver(String add_receiver) {
		this.add_receiver = add_receiver;
	}

	public int getAdd_postcode() {
		return add_postcode;
	}

	public void setAdd_postcode(int add_postcode) {
		this.add_postcode = add_postcode;
	}

	public String getAdd_address() {
		return add_address;
	}

	public void setAdd_address(String add_address) {
		this.add_address = add_address;
	}

	public String getAdd_addrdetail() {
		return add_addrdetail;
	}

	public void setAdd_addrdetail(String add_addrdetail) {
		this.add_addrdetail = add_addrdetail;
	}

	public String getAdd_cellphone() {
		return add_cellphone;
	}

	public void setAdd_cellphone(String add_cellphone) {
		this.add_cellphone = add_cellphone;
	}

	public int getAdd_code() {
		return add_code;
	}

	public void setAdd_code(int add_code) {
		this.add_code = add_code;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "AddrVo [add_no=" + add_no + ", add_nickname=" + add_nickname + ", add_receiver=" + add_receiver
				+ ", add_postcode=" + add_postcode + ", add_address=" + add_address + ", add_addrdetail="
				+ add_addrdetail + ", add_cellphone=" + add_cellphone + ", add_code=" + add_code + ", userid=" + userid
				+ "]";
	}
	
}

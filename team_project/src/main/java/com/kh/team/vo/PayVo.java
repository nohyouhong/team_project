package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class PayVo {
	private int hno;
	private int h_pno;
	private Date h_date;
	private int h_totaldeliverycharge;
	private int h_totalsale;
	private int h_totalprice;
	private String h_receiver;
	private int h_postcode;
	private String h_address;
	private String h_addrdetail;
	private String h_cellphone;
	private String h_email;
	private String h_deliver_comment;
	private String userid;
	private String[] h_picture;
	private String[] h_title;
	private String[] h_option;
	private int[] h_amount;
	private int[] h_price;
	private int[] h_discount;
	private int[] h_sum_price;
	private int[] h_deliverycharge;
	
	public PayVo() {
		super();
	}

	public PayVo(int hno, int h_pno, Date h_date, int h_totaldeliverycharge, int h_totalsale, int h_totalprice,
			String h_receiver, int h_postcode, String h_address, String h_addrdetail, String h_cellphone,
			String h_email, String h_deliver_comment, String userid, String[] h_picture, String[] h_title,
			String[] h_option, int[] h_amount, int[] h_price, int[] h_discount, int[] h_sum_price,
			int[] h_deliverycharge) {
		super();
		this.hno = hno;
		this.h_pno = h_pno;
		this.h_date = h_date;
		this.h_totaldeliverycharge = h_totaldeliverycharge;
		this.h_totalsale = h_totalsale;
		this.h_totalprice = h_totalprice;
		this.h_receiver = h_receiver;
		this.h_postcode = h_postcode;
		this.h_address = h_address;
		this.h_addrdetail = h_addrdetail;
		this.h_cellphone = h_cellphone;
		this.h_email = h_email;
		this.h_deliver_comment = h_deliver_comment;
		this.userid = userid;
		this.h_picture = h_picture;
		this.h_title = h_title;
		this.h_option = h_option;
		this.h_amount = h_amount;
		this.h_price = h_price;
		this.h_discount = h_discount;
		this.h_sum_price = h_sum_price;
		this.h_deliverycharge = h_deliverycharge;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public int getH_pno() {
		return h_pno;
	}

	public void setH_pno(int h_pno) {
		this.h_pno = h_pno;
	}

	public Date getH_date() {
		return h_date;
	}

	public void setH_date(Date h_date) {
		this.h_date = h_date;
	}

	public int getH_totaldeliverycharge() {
		return h_totaldeliverycharge;
	}

	public void setH_totaldeliverycharge(int h_totaldeliverycharge) {
		this.h_totaldeliverycharge = h_totaldeliverycharge;
	}

	public int getH_totalsale() {
		return h_totalsale;
	}

	public void setH_totalsale(int h_totalsale) {
		this.h_totalsale = h_totalsale;
	}

	public int getH_totalprice() {
		return h_totalprice;
	}

	public void setH_totalprice(int h_totalprice) {
		this.h_totalprice = h_totalprice;
	}

	public String getH_receiver() {
		return h_receiver;
	}

	public void setH_receiver(String h_receiver) {
		this.h_receiver = h_receiver;
	}

	public int getH_postcode() {
		return h_postcode;
	}

	public void setH_postcode(int h_postcode) {
		this.h_postcode = h_postcode;
	}

	public String getH_address() {
		return h_address;
	}

	public void setH_address(String h_address) {
		this.h_address = h_address;
	}

	public String getH_addrdetail() {
		return h_addrdetail;
	}

	public void setH_addrdetail(String h_addrdetail) {
		this.h_addrdetail = h_addrdetail;
	}

	public String getH_cellphone() {
		return h_cellphone;
	}

	public void setH_cellphone(String h_cellphone) {
		this.h_cellphone = h_cellphone;
	}

	public String getH_email() {
		return h_email;
	}

	public void setH_email(String h_email) {
		this.h_email = h_email;
	}

	public String getH_deliver_comment() {
		return h_deliver_comment;
	}

	public void setH_deliver_comment(String h_deliver_comment) {
		this.h_deliver_comment = h_deliver_comment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String[] getH_picture() {
		return h_picture;
	}

	public void setH_picture(String[] h_picture) {
		this.h_picture = h_picture;
	}

	public String[] getH_title() {
		return h_title;
	}

	public void setH_title(String[] h_title) {
		this.h_title = h_title;
	}

	public String[] getH_option() {
		return h_option;
	}

	public void setH_option(String[] h_option) {
		this.h_option = h_option;
	}

	public int[] getH_amount() {
		return h_amount;
	}

	public void setH_amount(int[] h_amount) {
		this.h_amount = h_amount;
	}

	public int[] getH_price() {
		return h_price;
	}

	public void setH_price(int[] h_price) {
		this.h_price = h_price;
	}

	public int[] getH_discount() {
		return h_discount;
	}

	public void setH_discount(int[] h_discount) {
		this.h_discount = h_discount;
	}

	public int[] getH_sum_price() {
		return h_sum_price;
	}

	public void setH_sum_price(int[] h_sum_price) {
		this.h_sum_price = h_sum_price;
	}

	public int[] getH_deliverycharge() {
		return h_deliverycharge;
	}

	public void setH_deliverycharge(int[] h_deliverycharge) {
		this.h_deliverycharge = h_deliverycharge;
	}

	@Override
	public String toString() {
		return "PayVo [hno=" + hno + ", h_pno=" + h_pno + ", h_date=" + h_date + ", h_totaldeliverycharge="
				+ h_totaldeliverycharge + ", h_totalsale=" + h_totalsale + ", h_totalprice=" + h_totalprice
				+ ", h_receiver=" + h_receiver + ", h_postcode=" + h_postcode + ", h_address=" + h_address
				+ ", h_addrdetail=" + h_addrdetail + ", h_cellphone=" + h_cellphone + ", h_email=" + h_email
				+ ", h_deliver_comment=" + h_deliver_comment + ", userid=" + userid + ", h_picture="
				+ Arrays.toString(h_picture) + ", h_title=" + Arrays.toString(h_title) + ", h_option="
				+ Arrays.toString(h_option) + ", h_amount=" + Arrays.toString(h_amount) + ", h_price="
				+ Arrays.toString(h_price) + ", h_discount=" + Arrays.toString(h_discount) + ", h_sum_price="
				+ Arrays.toString(h_sum_price) + ", h_deliverycharge=" + Arrays.toString(h_deliverycharge) + "]";
	}
	
}

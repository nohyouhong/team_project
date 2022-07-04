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
	private String h_picture;
	private String h_title;
	private String h_option;
	private int h_amount;
	private int h_price;
	private int h_sale;
	private int h_sum_price;
	private int h_deliverycharge;
	private String[] h_pictures;
	private String[] h_titles;
	private String[] h_options;
	private int[] h_amounts;
	private int[] h_prices;
	private int[] h_sales;
	private int[] h_sum_prices;
	private int[] h_deliverycharges;
	private int[] o_pno;
	
	public PayVo() {
		super();
	}

	public PayVo(int hno, String h_picture, String h_title, String h_option, int h_amount, int h_price, int h_sale,
			int h_sum_price, int h_deliverycharge) {
		super();
		this.hno = hno;
		this.h_picture = h_picture;
		this.h_title = h_title;
		this.h_option = h_option;
		this.h_amount = h_amount;
		this.h_price = h_price;
		this.h_sale = h_sale;
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

	public String getH_picture() {
		return h_picture;
	}

	public void setH_picture(String h_picture) {
		this.h_picture = h_picture;
	}

	public String getH_title() {
		return h_title;
	}

	public void setH_title(String h_title) {
		this.h_title = h_title;
	}

	public String getH_option() {
		return h_option;
	}

	public void setH_option(String h_option) {
		this.h_option = h_option;
	}

	public int getH_amount() {
		return h_amount;
	}

	public void setH_amount(int h_amount) {
		this.h_amount = h_amount;
	}

	public int getH_price() {
		return h_price;
	}

	public void setH_price(int h_price) {
		this.h_price = h_price;
	}

	public int getH_sale() {
		return h_sale;
	}

	public void setH_sale(int h_sale) {
		this.h_sale = h_sale;
	}

	public int getH_sum_price() {
		return h_sum_price;
	}

	public void setH_sum_price(int h_sum_price) {
		this.h_sum_price = h_sum_price;
	}

	public int getH_deliverycharge() {
		return h_deliverycharge;
	}

	public void setH_deliverycharge(int h_deliverycharge) {
		this.h_deliverycharge = h_deliverycharge;
	}

	public String[] getH_pictures() {
		return h_pictures;
	}

	public void setH_pictures(String[] h_pictures) {
		this.h_pictures = h_pictures;
	}

	public String[] getH_titles() {
		return h_titles;
	}

	public void setH_titles(String[] h_titles) {
		this.h_titles = h_titles;
	}

	public String[] getH_options() {
		return h_options;
	}

	public void setH_options(String[] h_options) {
		this.h_options = h_options;
	}

	public int[] getH_amounts() {
		return h_amounts;
	}

	public void setH_amounts(int[] h_amounts) {
		this.h_amounts = h_amounts;
	}

	public int[] getH_prices() {
		return h_prices;
	}

	public void setH_prices(int[] h_prices) {
		this.h_prices = h_prices;
	}

	public int[] getH_sales() {
		return h_sales;
	}

	public void setH_sales(int[] h_sales) {
		this.h_sales = h_sales;
	}

	public int[] getH_sum_prices() {
		return h_sum_prices;
	}

	public void setH_sum_prices(int[] h_sum_prices) {
		this.h_sum_prices = h_sum_prices;
	}

	public int[] getH_deliverycharges() {
		return h_deliverycharges;
	}

	public void setH_deliverycharges(int[] h_deliverycharges) {
		this.h_deliverycharges = h_deliverycharges;
	}

	public int[] getO_pno() {
		return o_pno;
	}

	public void setO_pno(int[] o_pno) {
		this.o_pno = o_pno;
	}

	@Override
	public String toString() {
		return "PayVo [hno=" + hno + ", h_pno=" + h_pno + ", h_date=" + h_date + ", h_totaldeliverycharge="
				+ h_totaldeliverycharge + ", h_totalsale=" + h_totalsale + ", h_totalprice=" + h_totalprice
				+ ", h_receiver=" + h_receiver + ", h_postcode=" + h_postcode + ", h_address=" + h_address
				+ ", h_addrdetail=" + h_addrdetail + ", h_cellphone=" + h_cellphone + ", h_email=" + h_email
				+ ", h_deliver_comment=" + h_deliver_comment + ", userid=" + userid + ", h_picture=" + h_picture
				+ ", h_title=" + h_title + ", h_option=" + h_option + ", h_amount=" + h_amount + ", h_price=" + h_price
				+ ", h_sale=" + h_sale + ", h_sum_price=" + h_sum_price + ", h_deliverycharge=" + h_deliverycharge
				+ ", h_pictures=" + Arrays.toString(h_pictures) + ", h_titles=" + Arrays.toString(h_titles)
				+ ", h_options=" + Arrays.toString(h_options) + ", h_amounts=" + Arrays.toString(h_amounts)
				+ ", h_prices=" + Arrays.toString(h_prices) + ", h_sales=" + Arrays.toString(h_sales)
				+ ", h_sum_prices=" + Arrays.toString(h_sum_prices) + ", h_deliverycharges="
				+ Arrays.toString(h_deliverycharges) + ", o_pno=" + Arrays.toString(o_pno) + "]";
	}
	
}

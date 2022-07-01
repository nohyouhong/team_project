package com.kh.team.vo;

import java.util.Arrays;

public class OrderProductVo {
	private int o_pno;
	private int l_lno;
	private int p_ino;
	private int[] p_inos;
	private int p_bno;
	private String o_titlepic;
	private int p_price;
	private int o_price;
	private int[] o_prices;
	private int o_amount;
	private int[] o_amounts;
	private int o_sum;
	private int l_sum;
	private int[] o_sums;
	private String p_option;
	private String p_discount;
	private String p_name;
	private String p_title;
	private String p_explain;
	private int p_stock;
	private int o_deliverycharge;
	private int l_deliverycharge;
	private int p_deliverycharge;
	private int o_state;
	private int pno;
	private int deliver_count;
	
	public OrderProductVo() {
		super();
	}

	public OrderProductVo(int o_pno, int l_lno, int p_ino, int[] p_inos, int p_bno, String o_titlepic, int p_price,
			int o_price, int[] o_prices, int o_amount, int[] o_amounts, int o_sum, int l_sum, int[] o_sums,
			String p_option, String p_discount, String p_name, String p_title, String p_explain, int p_stock,
			int o_deliverycharge, int l_deliverycharge, int p_deliverycharge, int o_state) {
		super();
		this.o_pno = o_pno;
		this.l_lno = l_lno;
		this.p_ino = p_ino;
		this.p_inos = p_inos;
		this.p_bno = p_bno;
		this.o_titlepic = o_titlepic;
		this.p_price = p_price;
		this.o_price = o_price;
		this.o_prices = o_prices;
		this.o_amount = o_amount;
		this.o_amounts = o_amounts;
		this.o_sum = o_sum;
		this.l_sum = l_sum;
		this.o_sums = o_sums;
		this.p_option = p_option;
		this.p_discount = p_discount;
		this.p_name = p_name;
		this.p_title = p_title;
		this.p_explain = p_explain;
		this.p_stock = p_stock;
		this.o_deliverycharge = o_deliverycharge;
		this.l_deliverycharge = l_deliverycharge;
		this.p_deliverycharge = p_deliverycharge;
		this.o_state = o_state;
	}

	public OrderProductVo(int p_price, String p_option, String p_discount, String p_title) {
		super();
		this.p_price = p_price;
		this.p_option = p_option;
		this.p_discount = p_discount;
		this.p_title = p_title;
	}

	public int getDeliver_count() {
		return deliver_count;
	}

	public void setDeliver_count(int deliver_count) {
		this.deliver_count = deliver_count;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getO_pno() {
		return o_pno;
	}

	public void setO_pno(int o_pno) {
		this.o_pno = o_pno;
	}

	public int getP_ino() {
		return p_ino;
	}

	public void setP_ino(int p_ino) {
		this.p_ino = p_ino;
	}

	public String getO_titlepic() {
		return o_titlepic;
	}

	public void setO_titlepic(String o_titlepic) {
		this.o_titlepic = o_titlepic;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public int[] getO_prices() {
		return o_prices;
	}

	public void setO_prices(int[] o_prices) {
		this.o_prices = o_prices;
	}

	public int getO_amount() {
		return o_amount;
	}

	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}

	public int[] getO_amounts() {
		return o_amounts;
	}

	public void setO_amounts(int[] o_amounts) {
		this.o_amounts = o_amounts;
	}

	public int getO_sum() {
		return o_sum;
	}

	public void setO_sum(int o_sum) {
		this.o_sum = o_sum;
	}

	public int[] getO_sums() {
		return o_sums;
	}

	public void setO_sums(int[] o_sums) {
		this.o_sums = o_sums;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public String getP_discount() {
		return p_discount;
	}

	public void setP_discount(String p_discount) {
		this.p_discount = p_discount;
	}

	public int getL_lno() {
		return l_lno;
	}

	public void setL_lno(int l_lno) {
		this.l_lno = l_lno;
	}

	public int getP_bno() {
		return p_bno;
	}

	public void setP_bno(int p_bno) {
		this.p_bno = p_bno;
	}

	public int getO_deliverycharge() {
		return o_deliverycharge;
	}

	public void setO_deliverycharge(int o_deliverycharge) {
		this.o_deliverycharge = o_deliverycharge;
	}

	public int getP_deliverycharge() {
		return p_deliverycharge;
	}

	public void setP_deliverycharge(int p_deliverycharge) {
		this.p_deliverycharge = p_deliverycharge;
	}

	public int[] getP_inos() {
		return p_inos;
	}

	public void setP_inos(int[] p_inos) {
		this.p_inos = p_inos;
	}

	public int getL_sum() {
		return l_sum;
	}

	public void setL_sum(int l_sum) {
		this.l_sum = l_sum;
	}

	public int getL_deliverycharge() {
		return l_deliverycharge;
	}

	public void setL_deliverycharge(int l_deliverycharge) {
		this.l_deliverycharge = l_deliverycharge;
	}
	
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	
	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_explain() {
		return p_explain;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	
	public int getO_state() {
		return o_state;
	}

	public void setO_state(int o_state) {
		this.o_state = o_state;
	}

	@Override
	public String toString() {
		return "OrderProductVo [o_pno=" + o_pno + ", l_lno=" + l_lno + ", p_ino=" + p_ino + ", p_inos="
				+ Arrays.toString(p_inos) + ", p_bno=" + p_bno + ", o_titlepic=" + o_titlepic + ", p_price=" + p_price
				+ ", o_price=" + o_price + ", o_prices=" + Arrays.toString(o_prices) + ", o_amount=" + o_amount
				+ ", o_amounts=" + Arrays.toString(o_amounts) + ", o_sum=" + o_sum + ", l_sum=" + l_sum + ", o_sums="
				+ Arrays.toString(o_sums) + ", p_option=" + p_option + ", p_discount=" + p_discount + ", p_name="
				+ p_name + ", p_title=" + p_title + ", p_explain=" + p_explain + ", p_stock=" + p_stock
				+ ", o_deliverycharge=" + o_deliverycharge + ", l_deliverycharge=" + l_deliverycharge
				+ ", p_deliverycharge=" + p_deliverycharge + ", o_state=" + o_state + ", pno=" + pno
				+ ", deliver_count=" + deliver_count + "]";
	}
	
}

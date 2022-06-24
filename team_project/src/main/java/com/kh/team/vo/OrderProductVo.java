package com.kh.team.vo;

import java.util.Arrays;

public class OrderProductVo {
	private int o_pno;
	private int o_lno;
	private int p_ino;
	private String o_titlepic;
	private int o_price;
	private int[] o_prices;
	private int o_amount;
	private int[] o_amounts;
	private int o_sum;
	private int[] o_sums;
	private String p_option;
	private String p_discount;
	
	public OrderProductVo() {
		super();
	}

	public OrderProductVo(int o_pno, int o_lno, int p_ino, String o_titlepic, int o_price, int[] o_prices, int o_amount,
			int[] o_amounts, int o_sum, int[] o_sums, String p_option, String p_discount) {
		super();
		this.o_pno = o_pno;
		this.o_lno = o_lno;
		this.p_ino = p_ino;
		this.o_titlepic = o_titlepic;
		this.o_price = o_price;
		this.o_prices = o_prices;
		this.o_amount = o_amount;
		this.o_amounts = o_amounts;
		this.o_sum = o_sum;
		this.o_sums = o_sums;
		this.p_option = p_option;
		this.p_discount = p_discount;
	}

	public int getO_pno() {
		return o_pno;
	}

	public void setO_pno(int o_pno) {
		this.o_pno = o_pno;
	}

	public int getO_lno() {
		return o_lno;
	}

	public void setO_lno(int o_lno) {
		this.o_lno = o_lno;
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

	@Override
	public String toString() {
		return "OrderProductVo [o_pno=" + o_pno + ", o_lno=" + o_lno + ", p_ino=" + p_ino + ", o_titlepic=" + o_titlepic
				+ ", o_price=" + o_price + ", o_prices=" + Arrays.toString(o_prices) + ", o_amount=" + o_amount
				+ ", o_amounts=" + Arrays.toString(o_amounts) + ", o_sum=" + o_sum + ", o_sums="
				+ Arrays.toString(o_sums) + ", p_option=" + p_option + ", p_discount=" + p_discount + "]";
	}
}

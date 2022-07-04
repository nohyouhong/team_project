package com.kh.team.vo;

import java.util.Arrays;

public class ProductVo {
	private int pno;
	private int p_bno;
	private String p_name;
	private int p_ino;
	private int[] p_inos;
	private String p_option;
	private String[] p_options;
	private int p_price;
	private int[] p_prices;
	private int p_discount;
	private int[] p_discounts;
	private int p_stock; //다오에서 받을때
	private int[] p_stocks; //다오로 줄때
	private int p_sum;
	private int[] p_sums;
	private String p_picture;
	private String[] p_pictures;
	
	public ProductVo() {
		super();
	}
	
	public ProductVo(int pno, String p_option, int p_price, int p_discount, int p_stock, int p_sum) {
		super();
		this.pno = pno;
		this.p_option = p_option;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_stock = p_stock;
		this.p_sum = p_sum;
	}

	public ProductVo(String p_name, int p_ino, String p_option, int p_price, int p_discount, int p_stock) {
		super();
		this.p_name = p_name;
		this.p_ino = p_ino;
		this.p_option = p_option;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_stock = p_stock;
	}

	public ProductVo(int pno, int p_bno, String p_name, int p_ino, int[] p_inos, String p_option, String[] p_options,
			int p_price, int[] p_prices, int p_discount, int[] p_discounts, int p_stock, int[] p_stocks, int p_sum,
			int[] p_sums, String p_picture, String[] p_pictures) {
		super();
		this.pno = pno;
		this.p_bno = p_bno;
		this.p_name = p_name;
		this.p_ino = p_ino;
		this.p_inos = p_inos;
		this.p_option = p_option;
		this.p_options = p_options;
		this.p_price = p_price;
		this.p_prices = p_prices;
		this.p_discount = p_discount;
		this.p_discounts = p_discounts;
		this.p_stock = p_stock;
		this.p_stocks = p_stocks;
		this.p_sum = p_sum;
		this.p_sums = p_sums;
		this.p_picture = p_picture;
		this.p_pictures = p_pictures;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getP_bno() {
		return p_bno;
	}

	public void setP_bno(int p_bno) {
		this.p_bno = p_bno;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_ino() {
		return p_ino;
	}

	public void setP_ino(int p_ino) {
		this.p_ino = p_ino;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public String[] getP_options() {
		return p_options;
	}

	public void setP_options(String[] p_options) {
		this.p_options = p_options;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int[] getP_prices() {
		return p_prices;
	}

	public void setP_prices(int[] p_prices) {
		this.p_prices = p_prices;
	}

	public int getP_discount() {
		return p_discount;
	}

	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}

	public int[] getP_discounts() {
		return p_discounts;
	}

	public void setP_discounts(int[] p_discounts) {
		this.p_discounts = p_discounts;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public int[] getP_stocks() {
		return p_stocks;
	}

	public void setP_stocks(int[] p_stocks) {
		this.p_stocks = p_stocks;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public String[] getP_pictures() {
		return p_pictures;
	}

	public void setP_pictures(String[] p_pictures) {
		this.p_pictures = p_pictures;
	}
	
	public int getP_sum() {
		return p_sum;
	}

	public void setP_sum(int p_sum) {
		this.p_sum = p_sum;
	}
	
	public int[] getP_sums() {
		return p_sums;
	}

	public void setP_sums(int[] p_sums) {
		this.p_sums = p_sums;
	}

	public int[] getP_inos() {
		return p_inos;
	}

	public void setP_inos(int[] p_inos) {
		this.p_inos = p_inos;
	}

	@Override
	public String toString() {
		return "ProductVo [pno=" + pno + ", p_bno=" + p_bno + ", p_name=" + p_name + ", p_ino=" + p_ino + ", p_inos="
				+ Arrays.toString(p_inos) + ", p_option=" + p_option + ", p_options=" + Arrays.toString(p_options)
				+ ", p_price=" + p_price + ", p_prices=" + Arrays.toString(p_prices) + ", p_discount=" + p_discount
				+ ", p_discounts=" + Arrays.toString(p_discounts) + ", p_stock=" + p_stock + ", p_stocks="
				+ Arrays.toString(p_stocks) + ", p_sum=" + p_sum + ", p_sums=" + Arrays.toString(p_sums)
				+ ", p_picture=" + p_picture + ", p_pictures=" + Arrays.toString(p_pictures) + "]";
	}
	
}
